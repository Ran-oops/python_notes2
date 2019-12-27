-- MySQL dump 10.13  Distrib 5.5.48, for Linux (i686)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	5.5.48-log

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
-- Table structure for table `m1`
--

DROP TABLE IF EXISTS `m1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m1` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `age` tinyint(3) unsigned DEFAULT NULL,
  `num` tinyint(4) DEFAULT NULL,
  `n1` int(4) DEFAULT NULL,
  `n2` int(6) unsigned zerofill DEFAULT NULL,
  `f1` double(6,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m1`
--

LOCK TABLES `m1` WRITE;
/*!40000 ALTER TABLE `m1` DISABLE KEYS */;
INSERT INTO `m1` VALUES (1,88,-20,12345,005678,0.00),(2,255,127,32434,12345678,9999.99),(3,23,34,100,000034,1234.56);
/*!40000 ALTER TABLE `m1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m2`
--

DROP TABLE IF EXISTS `m2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m2` (
  `c1` char(8) DEFAULT NULL,
  `c2` varchar(8) DEFAULT NULL,
  `c3` text,
  `c4` enum('y','n') NOT NULL DEFAULT 'y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m2`
--

LOCK TABLES `m2` WRITE;
/*!40000 ALTER TABLE `m2` DISABLE KEYS */;
INSERT INTO `m2` VALUES ('qwertyqw','qwerqwed','we','n'),('abc','bcd',NULL,'y');
/*!40000 ALTER TABLE `m2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m3`
--

DROP TABLE IF EXISTS `m3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m3` (
  `d1` date DEFAULT NULL,
  `d2` datetime DEFAULT NULL,
  `d3` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m3`
--

LOCK TABLES `m3` WRITE;
/*!40000 ALTER TABLE `m3` DISABLE KEYS */;
INSERT INTO `m3` VALUES ('2017-09-25','2017-08-03 15:10:37','2017-08-03 07:10:37');
/*!40000 ALTER TABLE `m3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stu`
--

DROP TABLE IF EXISTS `stu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(8) NOT NULL,
  `age` tinyint(3) unsigned DEFAULT NULL,
  `sex` enum('w','m') NOT NULL DEFAULT 'm',
  `classid` char(8) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stu`
--

LOCK TABLES `stu` WRITE;
/*!40000 ALTER TABLE `stu` DISABLE KEYS */;
/*!40000 ALTER TABLE `stu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tt`
--

DROP TABLE IF EXISTS `tt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tt` (
  `id` int(11) DEFAULT NULL,
  `username` varchar(16) DEFAULT NULL,
  `age` tinyint(3) unsigned NOT NULL DEFAULT '20',
  `address` varchar(100) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tt`
--

LOCK TABLES `tt` WRITE;
/*!40000 ALTER TABLE `tt` DISABLE KEYS */;
/*!40000 ALTER TABLE `tt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uu`
--

DROP TABLE IF EXISTS `uu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uu` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(16) DEFAULT NULL,
  `age` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uu`
--

LOCK TABLES `uu` WRITE;
/*!40000 ALTER TABLE `uu` DISABLE KEYS */;
INSERT INTO `uu` VALUES (1,'zhangsan',20),(2,'lisi',22),(3,'wangwu',25),(4,'zhaoliu',30),(6,'xiaozhang',19);
/*!40000 ALTER TABLE `uu` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-03 16:35:28
