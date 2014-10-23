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
-- Table structure for table `user_mst`
--

DROP TABLE IF EXISTS `user_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_mst` (
  `user_Id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `role` varchar(45) NOT NULL,
  `active_flag` tinyint(4) NOT NULL DEFAULT '0',
  `last_login_date` timestamp NULL DEFAULT NULL,
  `last_login_ip` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_Id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_mst`
--

LOCK TABLES `user_mst` WRITE;
/*!40000 ALTER TABLE `user_mst` DISABLE KEYS */;
INSERT INTO `user_mst` VALUES (2,'admin','temp','admin',1,'2013-05-19 20:28:37','0:0:0:0:0:0:0:1'),(3,'student2','temp','student',1,'2013-05-09 12:44:41','0:0:0:0:0:0:0:1'),(13,'teacher','temp','teacher',1,'2013-05-19 18:29:44','0:0:0:0:0:0:0:1'),(19,'abc@abc.com','asd','parent',1,'2013-05-19 22:13:51','0:0:0:0:0:0:0:1'),(27,'student','temp','student',1,'2013-05-19 22:14:31','0:0:0:0:0:0:0:1'),(28,'teacher2','asd','teacher',1,'2013-05-19 14:53:36','0:0:0:0:0:0:0:1'),(29,'student3','asd','student',1,'2013-05-11 16:29:16','0:0:0:0:0:0:0:1'),(30,'student4','asd','student',1,'2013-05-15 05:04:00','0:0:0:0:0:0:0:1'),(38,'student5','temp','student',1,'2013-04-24 18:23:02','0:0:0:0:0:0:0:1'),(39,'student6','temp','student',1,'2013-04-24 15:49:56','0:0:0:0:0:0:0:1'),(40,'student7','temp','student',1,'2013-04-24 16:43:49','0:0:0:0:0:0:0:1'),(41,'student8','temp','student',1,'2013-04-25 11:15:28','0:0:0:0:0:0:0:1'),(42,'kishan','kishan','student',1,NULL,NULL);
/*!40000 ALTER TABLE `user_mst` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-05-20 13:14:22
