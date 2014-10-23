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
-- Table structure for table `classroom_mst`
--

DROP TABLE IF EXISTS `classroom_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classroom_mst` (
  `classroom_Id` int(11) NOT NULL AUTO_INCREMENT,
  `year` year(4) DEFAULT NULL,
  `section` char(2) DEFAULT NULL,
  `grade_Id` int(11) NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `teacher_Id` int(11) NOT NULL,
  PRIMARY KEY (`classroom_Id`),
  KEY `teacher_Id` (`teacher_Id`),
  KEY `g_id` (`grade_Id`),
  CONSTRAINT `g_id` FOREIGN KEY (`grade_Id`) REFERENCES `grade_mst` (`grade_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `teacher_Id` FOREIGN KEY (`teacher_Id`) REFERENCES `teacher_mst` (`teacher_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classroom_mst`
--

LOCK TABLES `classroom_mst` WRITE;
/*!40000 ALTER TABLE `classroom_mst` DISABLE KEYS */;
INSERT INTO `classroom_mst` VALUES (1,2013,'A',2,1,1),(2,2013,'B',2,1,1),(3,2013,'A',5,0,2),(4,2013,'B',5,1,2),(5,2013,'A',6,1,1),(6,2013,'B',6,1,2),(7,2013,'A',11,1,1);
/*!40000 ALTER TABLE `classroom_mst` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-05-20 13:14:25
