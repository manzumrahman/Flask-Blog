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
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts` (
  `Serial` int NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `email` varchar(120) NOT NULL,
  `phone_no` varchar(25) NOT NULL,
  `message` varchar(120) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`Serial`),
  UNIQUE KEY `name` (`name`,`email`,`phone_no`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES (1,'Manzum_Rahman','manzumrahman@gmail.com','01718180311','heyy','2021-01-15'),(2,'Rashida Begum','rashedabegum@gmail.com','55555555555','Hello grandson','2021-01-17'),(3,'M','dsfs','asda','sdasda','2021-01-30'),(4,'abc','abc@something.com','84573847583','heyy','2021-02-01'),(5,'Manzum','manzumrahman@gmail.com','888888888888','Testing','2021-02-20'),(6,'Manzum','abc@something.com','84573847583','Testing google mail service','2021-02-20'),(8,'Testing','Testing','Testing','Testing','2021-02-20'),(9,'testing-2','testing-2','testing-2','testing........................','2021-02-20'),(10,'hhhhhh','hhhhhhhhh','hhhhhhhhhhhhhhhhhhhhhhhh','hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh','2021-02-20'),(11,'sda','sdas','adsd','saddddddadadfdf','2021-02-20'),(12,'hrdafds','dfa nsedngeb','tfdg4rtbdf','etbdfg rtdjhfb','2021-02-20'),(13,'Manzum...................................','gfdgdfd@gmail.com','gregegrefgdf','testing.................................................','2021-03-18'),(14,'Manzum...','manzumrahman@gmail.com...','55555433','hiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii','2021-03-18'),(15,'Manzum///////////////////','manzumrahman2006@gmail.com','asdadsffsd','hiii\r\nbyeeee\r\nhiiii\r\n','2021-03-18');
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
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
