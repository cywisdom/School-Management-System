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
-- Table structure for table `gallery_mst`
--

DROP TABLE IF EXISTS `gallery_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gallery_mst` (
  `image_Id` int(11) NOT NULL AUTO_INCREMENT,
  `album_name` varchar(45) NOT NULL,
  `image_path` varchar(200) NOT NULL,
  `upload_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`image_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery_mst`
--

LOCK TABLES `gallery_mst` WRITE;
/*!40000 ALTER TABLE `gallery_mst` DISABLE KEYS */;
INSERT INTO `gallery_mst` VALUES (13,'Bridge','417989556.jpg','2013-05-11 12:12:51'),(14,'Bridge','597413126.jpg','2013-05-11 12:12:51'),(15,'Bridge','300418455.jpg','2013-05-11 12:12:51'),(16,'Bridge','964457043.jpg','2013-05-11 12:12:51'),(17,'Bridge','624797216.jpg','2013-05-11 12:12:51'),(18,'Bridge','816441789.jpg','2013-05-11 12:12:51'),(20,'Animal','41703739.jpg','2013-05-11 12:13:58'),(21,'Animal','899609972.jpg','2013-05-11 12:13:58'),(22,'Animal','642606173.jpg','2013-05-11 12:13:58'),(23,'Animal','808670773.jpg','2013-05-11 12:13:58'),(24,'Animal','165243763.jpg','2013-05-11 12:13:58'),(25,'Animal','361420654.jpg','2013-05-11 12:13:58'),(26,'Super cars','498785425.jpg','2013-05-11 12:29:14'),(27,'Super cars','578192814.jpg','2013-05-11 12:29:14'),(28,'Super cars','124902816.jpg','2013-05-11 12:29:14'),(29,'Super cars','607188388.jpg','2013-05-11 12:29:14'),(30,'Super cars','423643680.jpg','2013-05-11 12:29:14'),(31,'Super cars','688953109.jpg','2013-05-11 12:29:14'),(32,'World wonders','899637633.jpg','2013-05-11 12:29:53'),(33,'World wonders','257080176.jpg','2013-05-11 12:29:53'),(34,'World wonders','595604442.jpg','2013-05-11 12:29:53'),(35,'World wonders','393059682.jpg','2013-05-11 12:29:53'),(36,'World wonders','258123039.jpg','2013-05-11 12:29:53'),(37,'World wonders','142190525.jpg','2013-05-11 12:29:53'),(38,'World wonders','957981359.jpg','2013-05-11 12:29:53'),(39,'World wonders','559369569.jpg','2013-05-11 12:29:53'),(41,'abstract','796752984.jpg','2013-05-11 12:38:24'),(42,'abstract','586313160.jpg','2013-05-11 12:38:24'),(43,'abstract','28003440.jpg','2013-05-11 12:38:24'),(44,'abstract','569889613.jpg','2013-05-11 12:38:24'),(45,'abstract','654023014.jpg','2013-05-11 12:38:24'),(46,'abstract','817262311.jpg','2013-05-11 12:38:24');
/*!40000 ALTER TABLE `gallery_mst` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-05-20 13:14:20
