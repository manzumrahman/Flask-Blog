from flask import Flask, render_template, request, redirect, session, flash
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
from werkzeug.utils import secure_filename
import flask_mail
import json
import os
import math

print(datetime.now())
with open('config.json', 'r') as config:
    parameters = json.load(config)['parameters']

local_server = True
app = Flask(__name__)
app.config.update(
    MAIL_SERVER="smtp.gmail.com",
    MAIL_PORT='465',
    MAIL_USE_SSL=True,
    MAIL_USERNAME=parameters['mail_username'],
    MAIL_PASSWORD=parameters['mail_password'],
)
app.secret_key = 'Secret_key'
if local_server:
    app.config['SQLALCHEMY_DATABASE_URI'] = parameters['local_uri']
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = parameters['production_uri']
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = True
mail = flask_mail.Mail(app)
db = SQLAlchemy(app)


class Contacts(db.Model):
    Serial = db.Column(db.Integer, nullable=False, primary_key=True, unique=True)
    name = db.Column(db.String(80), nullable=False)
    email = db.Column(db.String(120), nullable=False)
    phone_no = db.Column(db.String(120), nullable=False)
    message = db.Column(db.String(120), nullable=False)
    date = db.Column(db.Date())


class Posts(db.Model):
    serial = db.Column(db.Integer, nullable=False, primary_key=True, unique=True)
    title = db.Column(db.String(100), nullable=False)
    sub_title = db.Column(db.String(200), nullable=False)
    slug = db.Column(db.String(100), nullable=False)
    content = db.Column(db.String(120), nullable=False)
    author = db.Column(db.String(100), nullable=False)
    date = db.Column(db.Date())
    img_file = db.Column(db.String(50), nullable=False)


@app.route('/')
def home():
    posts = Posts.query.all()[-1:-(int(parameters['number_of_post']) + 1):-1]
    latest_post = Posts.query.all()[-1]
    return render_template("index.html", posts=posts, latest_post=latest_post.slug)


@app.route('/all_posts/')
def all_posts():
    posts = Posts.query.all()
    posts = posts[-1:-(len(posts)+1):-1]
    latest_post = Posts.query.all()[-1]
    page = request.args.get('page')
    if not str(page.isnumeric()):
        page = 1
    else:
        page = int(page)
    posts_per_page = 5
    total_pages = math.ceil(len(posts)/posts_per_page)
    next_page = '/all_posts/?page='+str(page+1)
    previous_page = '/all_posts/?page='+str(page-1)
    posts = posts[posts_per_page*(page-1):posts_per_page*page]
    if 1 > page or page > total_pages:
        return redirect('/all_posts/?page=1')
    if page == 1:
        previous_page = '/all_posts/?page=1'
    elif page == total_pages:
        next_page = '/all_posts/?page=1'
    return render_template("all posts.html", posts=posts, latest_post=latest_post.slug, next_page=next_page,previous_page=previous_page )


@app.route('/about')
def about():
    latest_post = Posts.query.all()[-1]
    return render_template("about.html", latest_post=latest_post.slug)


@app.route('/post/<string:post_slug>', methods=['GET'])
def post_route(post_slug):
    post = Posts.query.filter_by(slug=post_slug).first()
    latest_post = Posts.query.all()[-1]
    return render_template("post.html", post=post, latest_post=latest_post.slug)


@app.route('/contact', methods=["GET", "POST"])
def contact():
    latest_post = Posts.query.all()[-1]
    if request.method == "POST":
        name = request.form.get("name")
        email = request.form.get("email")
        phone_no = request.form.get("phone_no")
        message = request.form.get("message")
        entry = Contacts(name=name, email=email, phone_no=phone_no, message=message, date=datetime.now())
        if name and email and phone_no and message and entry:
            existing_user = Contacts.query.filter(
                Contacts.name == name or Contacts.email == email or Contacts.phone_no == phone_no).first()
            if existing_user is None:
                db.session.add(entry)
                db.session.commit()
                mail.send_message(
                    'New Message in Blog from ' + name,
                    sender=email,
                    recipients=[parameters['mail_username']],
                    body=message + '\n' + phone_no
                )
                flash('Thanks For Your Response!', 'success')
            else:
                flash('Wrong Inputs', 'danger')
        else:
            flash('Wrong Inputs', 'danger')
    return render_template("contact.html", latest_post=latest_post.slug)


@app.route('/login', methods=["GET", "POST"])
def login():
    latest_post = Posts.query.all()[-1]
    if 'user' in session and session['user'] == parameters['admin_email']:
        return redirect("/dashboard")
    elif request.method == "POST":
        email = request.form.get("email")
        password = request.form.get("password")
        if email == parameters['admin_email'] and password == parameters['admin_password']:
            session['user'] = email
            return redirect("/dashboard")
        else:
            return redirect("/login")
    else:
        return render_template('login.html', latest_post=latest_post.slug)


@app.route('/dashboard')
def dashboard():
    latest_post = Posts.query.all()[-1]
    if 'user' in session and session['user'] == parameters['admin_email']:
        posts = Posts.query.all()
        return render_template('dashboard.html', posts=posts, latest_post = latest_post.slug)
    else:
        return redirect("/login")


@app.route('/edit/<string:serial>', methods=["GET", "POST"])
def edit(serial):
    latest_post = Posts.query.all()[-1]
    if 'user' in session and session['user'] == parameters['admin_email']:
        if request.method == "POST" :
            title = request.form.get("title")
            subtitle = request.form.get("subtitle")
            slug = request.form.get("slug")
            content = request.form.get("content")
            author = request.form.get("author")
            img_file = request.form.get("image")
            entry = Posts(title=title, sub_title=subtitle,slug=slug,content=content,author=author,img_file=img_file,date=datetime.now())
            if title and subtitle and slug and content and author and img_file:
                if serial == "0":
                    existing_slug = Posts.query.filter(Posts.slug == slug).first()
                    if existing_slug is None:
                        entry = Posts(title=title, sub_title=subtitle,slug=slug,content=content,author=author,img_file=img_file,date=datetime.now())
                        db.session.add(entry)
                        db.session.commit()
                else:
                    post = Posts.query.filter_by(serial=serial).first()
                    post.title = title
                    post.subtitle = subtitle
                    post.slug = slug
                    post.content = content
                    post.author = author
                    post.img_file = img_file
                    db.session.commit()
                    return redirect('/post/'+slug)

        post = Posts.query.filter_by(serial=serial).first()
        if serial == "0":
            new_post = True
        else:
            new_post = False
        return render_template('edit.html', post=post, new_post=new_post,latest_post=latest_post.slug)
    else:
        return redirect("/login")


@app.route('/delete/<string:serial>', methods=["GET", "POST"])
def delete(serial):
    if 'user' in session and session['user'] == parameters['admin_email']:
        post = Posts.query.filter_by(serial=serial).first()
        db.session.delete(post)
        db.session.commit()
        return redirect('/dashboard')
    else:
        return redirect("/login")


@app.route('/logout')
def logout():
    if 'user' in session and session['user'] == parameters['admin_email']:
        session.pop('user')
        return redirect('/login')


@app.route('/upload', methods=["GET", "POST"])
def upload():
    if 'user' in session and session['user'] == parameters['admin_email']:
        if request.method == "POST":
            file = request.files["file"]
            file.save(os.path.join(parameters['upload_folder'], secure_filename(file.filename)))
            return 'File Uploaded Succesfully'


# app.run(host="0.0.0.0", port='80')
app.run()
