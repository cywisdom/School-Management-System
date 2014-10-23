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
-- Table structure for table `student_mst`
--

DROP TABLE IF EXISTS `student_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_mst` (
  `student_Id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(10) NOT NULL,
  `mname` varchar(10) NOT NULL,
  `lname` varchar(10) NOT NULL,
  `email` varchar(35) DEFAULT NULL,
  `parent_Id` int(11) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(7) NOT NULL,
  `grade` int(11) NOT NULL,
  `pfax` char(15) DEFAULT NULL,
  `address1` varchar(200) NOT NULL,
  `address2` varchar(200) DEFAULT NULL,
  `phno` char(15) DEFAULT NULL,
  `pmno` char(15) DEFAULT NULL,
  `regno` varchar(20) NOT NULL,
  `user_Image` varchar(250) DEFAULT 'Images/user.png',
  `joining_Year` int(11) NOT NULL,
  `about` varchar(300) DEFAULT NULL,
  `interest` varchar(200) DEFAULT NULL,
  `status` varchar(45) NOT NULL DEFAULT 'Enrolled',
  `user_Id` int(11) NOT NULL,
  PRIMARY KEY (`student_Id`),
  UNIQUE KEY `regno_UNIQUE` (`regno`),
  UNIQUE KEY `user_Id_UNIQUE` (`user_Id`),
  KEY `parent_Id` (`parent_Id`),
  KEY `user_Id` (`user_Id`),
  CONSTRAINT `parent_Id` FOREIGN KEY (`parent_Id`) REFERENCES `parent_mst` (`parent_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user_Id` FOREIGN KEY (`user_Id`) REFERENCES `user_mst` (`user_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_mst`
--

LOCK TABLES `student_mst` WRITE;
/*!40000 ALTER TABLE `student_mst` DISABLE KEYS */;
INSERT INTO `student_mst` VALUES (1,'Karan','B ','Kular','karan@gmail.com',NULL,'1992-02-02','male',2,NULL,'',NULL,NULL,NULL,'1235','users/original images/DSC_0124.jpg',2013,NULL,NULL,'Enrolled',3),(2,'Meet','R','Sanghavi','meet@aol.in',NULL,'1992-02-02','male',2,'','C-304, Vandematram City','Chandloadiya, Ahmendabad','079262345','9876544323','1234','Images/user.png',2013,'I am a student.','Cricket, Computers, Hockey','Enrolled',27),(5,'Abhi','H','Pabari','abhi@yahoo.com',NULL,'1992-02-02','male',2,'','',NULL,'','','student3','users/original images/teacher.png',2013,'',NULL,'Enrolled',29),(6,'Ravi','N','Sapariya','ravisp@ymail.com',NULL,'1992-02-02','male',2,'','',NULL,'','','12345','Images/user.png',2013,'',NULL,'Enrolled',30),(8,'Kishan','Babubhai','Kotadiya','kishan.kotadiya@ymail.com',3,'1992-02-02','male',2,'','',NULL,'','','09dce094','Images/user.png',2013,'',NULL,'Enrolled',38),(9,'Deep','C','Mirchandai','deep@gmail.com',NULL,'1992-02-02','male',2,'','',NULL,'','','asd','Images/user.png',2013,'',NULL,'Enrolled',39),(10,'Viral','M','Munjapara','pipariyadipesh@gmail.com',NULL,'1992-02-02','male',2,'','asdasasdas','asasdadasds','','','7653211','Images/user.png',2013,'',NULL,'Enrolled',40);
/*!40000 ALTER TABLE `student_mst` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-05-20 13:14:24
