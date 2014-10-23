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
-- Table structure for table `teacher_mst`
--

DROP TABLE IF EXISTS `teacher_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher_mst` (
  `teacher_Id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(10) NOT NULL,
  `mname` varchar(10) NOT NULL,
  `lname` varchar(15) NOT NULL,
  `email` varchar(45) NOT NULL,
  `dob` date NOT NULL,
  `gender` varchar(7) NOT NULL,
  `address1` varchar(200) NOT NULL,
  `address2` varchar(200) DEFAULT NULL,
  `pfax` char(15) DEFAULT NULL,
  `pmno` char(15) DEFAULT NULL,
  `phno` char(15) DEFAULT NULL,
  `user_Image` varchar(200) NOT NULL DEFAULT 'Images/teacher.png',
  `joining_Year` int(11) NOT NULL,
  `about` varchar(300) DEFAULT NULL,
  `interest` varchar(200) DEFAULT NULL,
  `qualification` varchar(100) NOT NULL,
  `user_Id` int(11) NOT NULL,
  PRIMARY KEY (`teacher_Id`),
  UNIQUE KEY `user_Id_UNIQUE` (`user_Id`),
  KEY `userid` (`user_Id`),
  CONSTRAINT `userid` FOREIGN KEY (`user_Id`) REFERENCES `user_mst` (`user_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_mst`
--

LOCK TABLES `teacher_mst` WRITE;
/*!40000 ALTER TABLE `teacher_mst` DISABLE KEYS */;
INSERT INTO `teacher_mst` VALUES (1,'Ashish','S','Surti','ashishs@ymail.cpm','1980-07-01','male','',NULL,NULL,NULL,NULL,'Images/teacher.png',2012,NULL,NULL,'M.A.',13),(2,'Taral','K','Shah','taralshash@gmail.com','1984-03-02','male','',NULL,NULL,NULL,NULL,'Images/teacher.png',2013,NULL,NULL,'B.ed.',28);
/*!40000 ALTER TABLE `teacher_mst` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-05-20 13:14:13
