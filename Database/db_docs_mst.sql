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
-- Table structure for table `docs_mst`
--

DROP TABLE IF EXISTS `docs_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `docs_mst` (
  `doc_Id` int(11) NOT NULL AUTO_INCREMENT,
  `user_Id` int(11) NOT NULL,
  `title` varchar(40) NOT NULL,
  `doc_name` varchar(200) NOT NULL,
  `upload_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`doc_Id`),
  KEY `docuserid` (`user_Id`),
  CONSTRAINT `docuserid` FOREIGN KEY (`user_Id`) REFERENCES `user_mst` (`user_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docs_mst`
--

LOCK TABLES `docs_mst` WRITE;
/*!40000 ALTER TABLE `docs_mst` DISABLE KEYS */;
INSERT INTO `docs_mst` VALUES (26,28,'C language tutorial','838630400.pdf','2013-05-15 04:14:30'),(27,28,'Exam Schedule','401990385.pdf','2013-05-15 04:20:24'),(28,28,'Maths Exam paper july 2011','923783483.pdf','2013-05-15 04:20:56'),(29,28,'English Exam paper july 2011','752082532.pdf','2013-05-15 04:21:17'),(30,28,'Project titles','97822124.pdf','2013-05-15 04:21:55'),(31,28,'c# book','337813132.pdf','2013-05-15 04:23:11'),(32,28,'C# Examples','792392574.pdf','2013-05-15 04:23:59'),(33,13,'Report format','615632382.pdf','2013-05-15 04:26:24'),(34,13,'Resume Format','556263290.doc','2013-05-15 04:26:55'),(35,13,'File download','973899053.ppt','2013-05-15 04:27:19'),(36,13,'Maths Examples','478851509.pdf','2013-05-15 04:27:32'),(37,13,'Guidelines for DCR','908842282.doc','2013-05-15 04:28:20'),(38,13,'Header & Footer Format','520010360.doc','2013-05-15 04:28:35'),(39,13,'Java.A.Beginners.Guide','18509593.pdf','2013-05-15 04:29:51'),(40,13,'Database System Concepts Korth','194296384.pdf','2013-05-15 04:30:07'),(41,13,'project profile','618063759.pdf','2013-05-16 15:34:15'),(42,13,'new','152713439.pdf','2013-05-19 14:51:05');
/*!40000 ALTER TABLE `docs_mst` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-05-20 13:14:14
