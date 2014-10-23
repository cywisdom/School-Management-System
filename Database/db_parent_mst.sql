CREATE DATABASE  IF NOT EXISTS `db` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `db`;
-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: localhost    Database: db
-- ------------------------------------------------------
-- Server version	5.5.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `parent_mst`
--

DROP TABLE IF EXISTS `parent_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parent_mst` (
  `parent_Id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(10) NOT NULL,
  `mname` varchar(10) NOT NULL,
  `lname` varchar(15) NOT NULL,
  `dob` date NOT NULL,
  `email` varchar(45) NOT NULL,
  `student_reg_no` varchar(10) NOT NULL,
  `gender` varchar(7) NOT NULL,
  `address1` varchar(150) NOT NULL,
  `pfax` char(15) DEFAULT NULL,
  `pmno` char(15) DEFAULT NULL,
  `phno` char(15) DEFAULT NULL,
  `address2` varchar(45) DEFAULT NULL,
  `user_Image` varchar(250) DEFAULT 'Images/parent.jpg',
  `user_Id` int(11) NOT NULL,
  PRIMARY KEY (`parent_Id`),
  UNIQUE KEY `student_reg_no_UNIQUE` (`student_reg_no`),
  UNIQUE KEY `user_Id_UNIQUE` (`user_Id`),
  KEY `student_regno` (`student_reg_no`),
  KEY `user` (`user_Id`),
  CONSTRAINT `student_regno` FOREIGN KEY (`student_reg_no`) REFERENCES `student_mst` (`regno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user` FOREIGN KEY (`user_Id`) REFERENCES `user_mst` (`user_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parent_mst`
--

LOCK TABLES `parent_mst` WRITE;
/*!40000 ALTER TABLE `parent_mst` DISABLE KEYS */;
INSERT INTO `parent_mst` VALUES (3,'Babubhai','C','Kotadiya','1970-02-02','abc@abc.com','09dce094','male','asd','34534543534','6543223465','13876543222','asd','D:/apache-tomcat-7.0.37/webapps/sms/WebContent/users/original images21.jpg',19);
/*!40000 ALTER TABLE `parent_mst` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-05-20 13:14:17
