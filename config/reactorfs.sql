-- MySQL dump 10.13  Distrib 5.5.23, for osx10.6 (i386)
--
-- Host: localhost    Database: reactorfs
-- ------------------------------------------------------
-- Server version	5.5.23

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
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `files` (
  `file_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `storage_id` int(11) DEFAULT NULL,
  `file_path` text,
  `file_name` text,
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` VALUES (14,1,NULL,NULL),(15,2,'/test/','README'),(16,1,'/test/','README.mp3'),(17,1,'/','123.456'),(18,1,'/test/','123.456'),(19,2,'/test/123/','README'),(20,2,'/test/123/','README'),(21,2,'/test/909/','hello.txt'),(22,2,'/test/909/','hello.txt'),(23,2,'/pics/','c3w-day13.png');
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storage`
--

DROP TABLE IF EXISTS `storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storage` (
  `storage_id` int(11) NOT NULL AUTO_INCREMENT,
  `storage_type_id` int(11) DEFAULT NULL,
  `storage_host` varchar(255) DEFAULT NULL,
  `storage_domain` varchar(255) DEFAULT NULL,
  `read_only` enum('Y','N') DEFAULT NULL,
  PRIMARY KEY (`storage_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storage`
--

LOCK TABLES `storage` WRITE;
/*!40000 ALTER TABLE `storage` DISABLE KEYS */;
INSERT INTO `storage` VALUES (1,1,'localhost','reactor1',NULL),(2,NULL,'127.0.0.1','reactor2',NULL);
/*!40000 ALTER TABLE `storage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storage_tags`
--

DROP TABLE IF EXISTS `storage_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storage_tags` (
  `storage_tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `storage_id` int(11) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`storage_tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storage_tags`
--

LOCK TABLES `storage_tags` WRITE;
/*!40000 ALTER TABLE `storage_tags` DISABLE KEYS */;
INSERT INTO `storage_tags` VALUES (1,1,'mp3');
/*!40000 ALTER TABLE `storage_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storage_types`
--

DROP TABLE IF EXISTS `storage_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storage_types` (
  `storage_type_id` int(11) NOT NULL,
  `storage_type` varchar(45) DEFAULT NULL,
  `storage_command` text,
  PRIMARY KEY (`storage_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storage_types`
--

LOCK TABLES `storage_types` WRITE;
/*!40000 ALTER TABLE `storage_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `storage_types` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-05-06 17:23:17
