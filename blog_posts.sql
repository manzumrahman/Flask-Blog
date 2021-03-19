-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: blog
-- ------------------------------------------------------
-- Server version	8.0.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `serial` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `sub_title` varchar(200) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `date` date NOT NULL,
  `author` varchar(100) NOT NULL,
  `img_file` varchar(50) NOT NULL,
  PRIMARY KEY (`serial`),
  UNIQUE KEY `slug_UNIQUE` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'First blog','My first Blog','first-blog','This is my first blog in Hello Geek for testing purpose.','2021-02-21','Me','post-bg.jpg'),(2,'Second Post','This is My Second Blog','scond-blog','I was automating the homepage of this blog so that the post previews don\'t need to be hardcoded , rather they will automatically appear there once I post a blog.  So, I made this blog in order to test that','2021-02-22','Admin','about-bg.jpg'),(3,'Third Blog','My 3rd Blog','third-blog','this is my 4th Blog made for testing. \\n testing Alert \\n testing Alert \\n testing Alert\\n testing Alert\\n testing Alert\\n testing Alert\\n testing Alert\\n testing Alert\\n testing Alert\\n testing Alert\\n testing Alert','2021-02-22','Admin','about-bg.jpg'),(4,'Fourth Blog','My 4th Blog','fourth-blog','this is my 4th Blog made for testing. \\n testing Alert \\n testing Alert \\n testing Alert\\n testing Alert\\n testing Alert\\n testing Alert\\n testing Alert\\n testing Alert\\n testing Alert\\n testing Alert\\n testing Alert','2021-02-22','Admin','about-bg.jpg'),(5,'Fifth Blog','My 5th Blog','fifth-blog','this is my 4th Blog made for testing. \\n testing Alert \\n testing Alert \\n testing Alert\\n testing Alert\\n testing Alert\\n testing Alert\\n testing Alert\\n testing Alert\\n testing Alert\\n testing Alert\\n testing Alert','2021-02-22','Admin','about-bg.jpg'),(6,'Sixth Blog','My 6th Blog','sixth-blog','this is my 4th Blog made for testing. \\n testing Alert \\n testing Alert \\n testing Alert\\n testing Alert\\n testing Alert\\n testing Alert\\n testing Alert\\n testing Alert\\n testing Alert\\n testing Alert\\n testing Alert','2021-02-22','Admin','about-bg.jpg'),(7,'Seventh Blog','My 7th Blog','seventh-blog','this is my 4th Blog made for testing. \\n testing Alert \\n testing Alert \\n testing Alert\\n testing Alert\\n testing Alert\\n testing Alert\\n testing Alert\\n testing Alert\\n testing Alert\\n testing Alert\\n testing Alert','2021-02-22','Admin','about-bg.jpg'),(8,'Eighth Blog','A blog to test the new features','dev_blog','Personal development or self improvement is a lifelong process and there will always be something we have to work on to make us a better person. This means there is no limit set on human potentials and we need to constantly work towards reaching those innate potentials in order to become the best version of ourselves. Whether you want to develop the skills required for self-development or you want to get rid of some bad habit or you just want to have a balanced life, this article is for you. I, Tara Bernardin, a strong believer in challenging oneself to improve daily. Amazingly, you do not have to do much. These are just simple conscious things you have to do every day to reach your goals towards self-development. Follow these 5 tips to improve yourself personally.\r\n\r\nNever stop learning\r\nKnowledge is power and continuous acquisition of knowledge in every area is one of the keys to avoid stagnation and reach your full potential. Continuous learning helps you to develop your skillset and develop yourself for future opportunities. Challenge your brain to learn different things every day. For this, you can take up online courses, read books on entrepreneurship, or how to kickstart a successful business. You can sign up for a musical learning class, learning a new language or another programming language. The fact is when it comes to learning, the list is endless.\r\n\r\nSet goals and work towards it\r\nWorking towards self-development starts with personal and professional goals. Which areas of your life need improvement? Financial, physical, social, or career life? Determine which areas of your life need improvement and prioritize them accordingly. It doesn’t have to be anything big, you can start by taking baby steps to work towards making your goals happen. For instance, if you need to lose some weight, you can decide to let go of carbonated drinks. If yours is financial growth, commit to setting aside some dollars for savings every month. If you desire some emotional stability, make a conscious effort to stop negative thinking but instead think positively.\r\n\r\nManage your time\r\nYou can’t be committed to self-development and still waste your time on things that do not profit much. This includes social media distractions, spending a lot of time watching movies, scrolling mindlessly on YouTube for hours, and many more. On the days when I decide to go off social media, I usually accomplish a lot of tasks. Unless your goals have something to do with being on social media, there is no point in spending hours going there seeing what others have got going with their lives. Anything that’s not moving towards your self-development is not worth your time.\r\n\r\nGet a mentor\r\nWorking with people who have already walked those paths towards success can be what you need to reach your goals faster. After all, these successful people have also had a mentor to help them along their life journey. Talk to someone you look up to who is successful in what you want to achieve. That can be a coach, an entrepreneur, a professor, or anyone that can set you up for success. Don’t be surprised many will be willing to mentor and develop anyone who is passionate about becoming better.\r\n\r\nYour greatest enemy is fear\r\nFear is the biggest enemy of being a better person and can be a great impediment to your success and glory. Therefore, to see a positive result, you need to conquer this enemy from within called fear. Whether it’s fear of failure, fear of uncertainty or fear of taking risks, or fear of embracing a change, you need to face it head-on and bring its back to the ground. If you need a mentor to walk you through overcoming your fears, get one. If you need to take that step against all odds, do it. Recognize areas of fear and see how you can work on them.\r\n\r\nI originally published this content on my website tarabernardin.com\r\n\r\nHey, it is from a dev.to blog','2021-03-17','Manzum','about-bg.jpg'),(9,'Final Demo Blog','This is the final test of this blog','final_test','Hi I am Manzum Rahman, And yeah, Welcome to the blog! <br>\r\n\r\nSo How are you! <br>\r\n\r\nThis blog has been written in order to test this blog. <br>\r\n\r\nSo the good new is that this blog is almost done and now, I am just testing it one more time :) <br>\r\n\r\n<b>PS:</b> This is the final test :)','2021-03-18','Manzum','post-bg.jpg');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-18 23:10:41
