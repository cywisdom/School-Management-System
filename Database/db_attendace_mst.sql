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
-- Table structure for table `attendace_mst`
--

DROP TABLE IF EXISTS `attendace_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendace_mst` (
  `student_Id` int(11) NOT NULL,
  `course_Id` varchar(45) NOT NULL,
  `in_Time` time NOT NULL,
  `out_Time` time NOT NULL,
  `classroom_Id` int(11) NOT NULL,
  `date` date NOT NULL,
  `status` tinyint(4) NOT NULL,
  KEY `s_Id` (`student_Id`),
  KEY `class_Id` (`classroom_Id`),
  KEY `course_Id` (`course_Id`),
  CONSTRAINT `class_Id` FOREIGN KEY (`classroom_Id`) REFERENCES `classroom_student` (`classroom_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `course_Id` FOREIGN KEY (`course_Id`) REFERENCES `course_mst` (`course_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `s_Id` FOREIGN KEY (`student_Id`) REFERENCES `classroom_student` (`student_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendace_mst`
--

LOCK TABLES `attendace_mst` WRITE;
/*!40000 ALTER TABLE `attendace_mst` DISABLE KEYS */;
INSERT INTO `attendace_mst` VALUES (2,'5','08:00:00','10:00:00',1,'2013-07-07',1),(2,'5','08:00:00','10:00:00',1,'2013-07-08',1),(2,'5','08:00:00','10:00:00',1,'2013-07-09',0),(1,'5','08:00:00','10:00:00',1,'2013-07-08',0),(2,'5','08:00:00','10:00:00',1,'2013-07-06',1),(1,'5','08:00:00','10:00:00',1,'2013-07-06',1),(1,'5','08:00:00','10:00:00',1,'2013-07-07',1),(1,'5','08:00:00','10:00:00',1,'2013-07-09',0),(2,'9','10:00:00','11:00:00',1,'2013-12-12',1),(8,'9','10:00:00','11:00:00',1,'2013-12-12',1),(9,'9','10:00:00','11:00:00',1,'2013-12-12',1),(10,'9','10:00:00','11:00:00',1,'2013-12-12',0),(1,'9','10:00:00','11:00:00',1,'2013-12-12',0),(2,'9','09:00:00','10:00:00',1,'2013-12-11',1),(1,'9','09:00:00','10:00:00',1,'2013-12-11',1),(8,'9','09:00:00','10:00:00',1,'2013-12-11',1),(9,'9','09:00:00','10:00:00',1,'2013-12-11',0),(10,'9','09:00:00','10:00:00',1,'2013-12-11',0),(2,'6','08:00:00','09:00:00',1,'2013-12-10',1),(1,'6','08:00:00','09:00:00',1,'2013-12-10',1),(8,'6','08:00:00','09:00:00',1,'2013-12-10',1),(9,'6','08:00:00','09:00:00',1,'2013-12-10',0),(10,'6','08:00:00','09:00:00',1,'2013-12-10',0);
/*!40000 ALTER TABLE `attendace_mst` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-05-20 13:14:30
