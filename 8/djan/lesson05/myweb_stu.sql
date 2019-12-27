/*
SQLyog 企业版 - MySQL GUI v7.14 
MySQL - 5.5.5-10.1.13-MariaDB : Database - myweb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*Table structure for table `myweb_stu` */

DROP TABLE IF EXISTS `myweb_stu`;

CREATE TABLE `myweb_stu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `sex` enum('m','w') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'm',
  `age` tinyint(3) unsigned DEFAULT NULL,
  `classid` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `myweb_stu` */

insert  into `myweb_stu`(`id`,`name`,`sex`,`age`,`classid`) values (1,'zhangsan','m',20,'python01'),(2,'wangwu','m',22,'python02'),(3,'lisi','w',25,'python01'),(4,'zhaoliu','m',29,'python03'),(5,'xiaofang','m',20,'python01'),(6,'laoli','m',32,'python04'),(7,'qq','m',28,'python01'),(8,'uu','w',25,'python04'),(9,'ss','m',18,'python01'),(10,'mm','w',19,'python03'),(11,'jj','m',20,'python04'),(12,'hh','w',33,'python01'),(14,'uu122','m',22,'python02'),(15,'uu132','m',22,'python01'),(16,'uu142','m',22,'python03');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
