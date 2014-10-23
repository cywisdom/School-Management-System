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
-- Table structure for table `timetable_mst`
--

DROP TABLE IF EXISTS `timetable_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timetable_mst` (
  `week_Day` int(11) NOT NULL,
  `course_Id` varchar(45) NOT NULL,
  `classroom_Id` int(11) NOT NULL,
  `teacher_Id` int(11) NOT NULL,
  `in_Time` time NOT NULL,
  `out_Time` time NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `year_month` varchar(8) DEFAULT NULL,
  `location` varchar(10) DEFAULT NULL,
  KEY `course` (`course_Id`),
  KEY `class` (`classroom_Id`),
  KEY `teacherid` (`teacher_Id`),
  KEY `week_day` (`week_Day`),
  CONSTRAINT `class` FOREIGN KEY (`classroom_Id`) REFERENCES `classroom_mst` (`classroom_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `course` FOREIGN KEY (`course_Id`) REFERENCES `course_mst` (`course_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `teacherid` FOREIGN KEY (`teacher_Id`) REFERENCES `teacher_mst` (`teacher_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `week_day` FOREIGN KEY (`week_Day`) REFERENCES `week_day` (`idweek_day`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timetable_mst`
--

LOCK TABLES `timetable_mst` WRITE;
/*!40000 ALTER TABLE `timetable_mst` DISABLE KEYS */;
INSERT INTO `timetable_mst` VALUES (1,'7',2,2,'11:00:00','12:00:00',1,NULL,NULL),(2,'6',1,2,'07:00:00','08:00:00',1,NULL,NULL),(2,'6',2,2,'10:00:00','11:00:00',1,NULL,NULL),(3,'7',2,2,'10:00:00','11:00:00',1,NULL,NULL),(4,'9',2,2,'10:00:00','11:00:00',1,NULL,NULL),(1,'1',3,2,'07:00:00','08:00:00',1,NULL,NULL),(3,'1',3,1,'09:00:00','10:00:00',1,NULL,NULL);
/*!40000 ALTER TABLE `timetable_mst` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-05-20 13:14:11
