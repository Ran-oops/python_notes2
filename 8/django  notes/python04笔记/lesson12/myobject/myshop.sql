/*
SQLyog 企业版 - MySQL GUI v7.14 
MySQL - 5.5.5-10.1.13-MariaDB : Database - myshop
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_user` */

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values (1,'contenttypes','0001_initial','2017-07-30 18:53:50'),(2,'auth','0001_initial','2017-07-30 18:53:52'),(3,'admin','0001_initial','2017-07-30 18:53:52'),(4,'admin','0002_logentry_remove_auto_add','2017-07-30 18:53:52'),(5,'contenttypes','0002_remove_content_type_name','2017-07-30 18:53:52'),(6,'auth','0002_alter_permission_name_max_length','2017-07-30 18:53:52'),(7,'auth','0003_alter_user_email_max_length','2017-07-30 18:53:52'),(8,'auth','0004_alter_user_username_opts','2017-07-30 18:53:52'),(9,'auth','0005_alter_user_last_login_null','2017-07-30 18:53:52'),(10,'auth','0006_require_contenttypes_0002','2017-07-30 18:53:52'),(11,'auth','0007_alter_validators_add_error_messages','2017-07-30 18:53:52'),(12,'auth','0008_alter_user_username_max_length','2017-07-30 18:53:53'),(13,'sessions','0001_initial','2017-07-30 18:53:53');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('1wsx5zhyekczi27024m8dw1s84erc7t9','NTRlMmJhYjA5ZmMwOTE1N2YxZGM2ZWUwODAzODIzNmY0NTM5MzAxMzp7InNob3BsaXN0Ijp7fSwidmVyaWZ5Y29kZSI6IjExOTYiLCJ2aXB1c2VyIjp7ImlkIjo2LCJ1c2VybmFtZSI6InpoYW5nc2FuIiwibmFtZSI6Ilx1NWYyMFx1NGUwOSIsInBhc3N3b3JkIjoiMjAyY2I5NjJhYzU5MDc1Yjk2NGIwNzE1MmQyMzRiNzAifX0=','2017-11-24 07:25:12'),('36azz6qh51fw4bpvryz6phat7bgscgoe','MTUxYzU4NGE5YmI5OWViMjVkN2M3NDgzNTA5ZjFlNDU5MGMwYzE4Zjp7InNob3BsaXN0Ijp7fSwidmVyaWZ5Y29kZSI6IjgyMTQifQ==','2017-11-24 07:01:40'),('4ddkl8lzla4s3fle54d8y2fgnanjkspm','ZmE1MGFhNzlmNjFmZDJmZmE5YzFlMzc0ZTUyYjdjNzMzNjhmNTkyYjp7InNob3BsaXN0Ijp7IjEiOnsiaWQiOjEsImdvb2RzIjoiXHU4MmY5XHU2NzljIiwicGljbmFtZSI6IjE1MDE1MjYwNDMuNzgxNDM2LmpwZyIsInByaWNlIjoyNjgwLjAsInN0b3JlIjoyMCwibSI6M30sIjYiOnsiaWQiOjYsImdvb2RzIjoiXHU1MzRlXHU0ZTNhXHU2MjRiXHU2NzNhIiwicGljbmFtZSI6IjE1MDkzMjc0NDQuODcxNzg5Mi5qcGciLCJwcmljZSI6MjgwMC4wLCJzdG9yZSI6MjAsIm0iOjJ9fSwidmVyaWZ5Y29kZSI6IjYyNDEifQ==','2017-11-24 07:05:59'),('acj02r61cntxpe0rr68kv37abausor3e','NGI5YjgwOWM5MTUwMTY3YzBiMWRmODdmY2EzNDQ5NTc4NTQ0MjJmOTp7InNob3BsaXN0Ijp7fSwidmVyaWZ5Y29kZSI6IjEyMTAifQ==','2017-11-24 07:05:58'),('bbfe3iu7cbhqkkbs7vdwh4j15knrarvk','YmRiODg2Y2M3NjU1NDI2ZDE5MDBhYmVhMzZjOWE5OGY3YzUyYjc1Nzp7InNob3BsaXN0Ijp7IjciOnsiaWQiOjcsImdvb2RzIjoiXHU2NWY2XHU1YzFhXHU5OGNlXHU4ODYzMjIiLCJwaWNuYW1lIjoiMTUwMTU0MDk2NS4zOTg2Nzk3LmpwZyIsInByaWNlIjoyODAuMCwic3RvcmUiOjI2LCJtIjoxfSwiMyI6eyJpZCI6MywiZ29vZHMiOiJcdTdiMTRcdThiYjBcdTY3MmNcdTc1MzVcdTgxMTEiLCJwaWNuYW1lIjoiMTUwMTUyMzg3OS4yNzczMDg1LmpwZyIsInByaWNlIjo0MjAwLjAsInN0b3JlIjo0NSwibSI6Mn19LCJ2ZXJpZnljb2RlIjoiNDYyNCJ9','2017-11-24 07:19:35'),('byqsr472126kjp1zuodq30tauoyzz8ks','YTM0N2RjNzY0MzVjM2JiMThmNzM3MzUyYmNkY2Y1MWE4ZDgzZGUxZTp7InZlcmlmeWNvZGUiOiIzNTE3Iiwic2hvcGxpc3QiOnt9fQ==','2017-11-24 07:25:14'),('ge2y0nruf61u1653ymo327yw342fh29p','NTAzZjE2ZGM0N2U5NzkzMWY2YzZkZmM0ODkyZWU0ZTk5MWMzMjBlMDp7InZlcmlmeWNvZGUiOiI1NTUzIn0=','2017-11-24 06:57:19'),('hhdchh94p1qzd15yw1lf4eye000o6050','N2VkOTZjNWU1MzFjNzJlOWJiMDhiNTg4ZTAyZDFmMzYzOWU0OWUwZTp7InNob3BsaXN0Ijp7fX0=','2017-11-24 06:57:32'),('kowdiqd6agh4tdp5yhpwbxjfg5d9y0bv','M2E0NTNiN2I4ZjQ0NGIwNTFkZTBlMzZjNTAxNDZkNDc4YTQ4ZTE0ZTp7InNob3BsaXN0Ijp7IjMiOnsiaWQiOjMsImdvb2RzIjoiXHU3YjE0XHU4YmIwXHU2NzJjXHU3NTM1XHU4MTExIiwicGljbmFtZSI6IjE1MDE1MjM4NzkuMjc3MzA4NS5qcGciLCJwcmljZSI6NDIwMC4wLCJzdG9yZSI6NDUsIm0iOjF9fX0=','2017-11-24 07:02:24'),('kr9he739fturt4b38ax1kko0dzityxh5','N2VkOTZjNWU1MzFjNzJlOWJiMDhiNTg4ZTAyZDFmMzYzOWU0OWUwZTp7InNob3BsaXN0Ijp7fX0=','2017-11-24 06:57:50'),('ky3ep9ng5ohbzbmbb18x443whg0kp385','MTZkN2FhMWYxNDZmZTM4M2VhM2ZmY2NlNmExN2Q4MDk3ZGU4MWU3Mzp7InZlcmlmeWNvZGUiOiI2NzEzIiwic2hvcGxpc3QiOnsiNiI6eyJpZCI6NiwiZ29vZHMiOiJcdTUzNGVcdTRlM2FcdTYyNGJcdTY3M2EiLCJwaWNuYW1lIjoiMTUwOTMyNzQ0NC44NzE3ODkyLmpwZyIsInByaWNlIjoyODAwLjAsInN0b3JlIjoyMCwibSI6MX0sIjgiOnsiaWQiOjgsImdvb2RzIjoiVFx1NjA2NFx1ODg2YiIsInBpY25hbWUiOiIxNTAxNTQxMDEzLjA4MDA1MTQuanBnIiwicHJpY2UiOjIwMC4wLCJzdG9yZSI6NTAsIm0iOjF9fSwidmlwdXNlciI6eyJpZCI6NiwidXNlcm5hbWUiOiJ6aGFuZ3NhbiIsIm5hbWUiOiJcdTVmMjBcdTRlMDkiLCJwYXNzd29yZCI6IjIwMmNiOTYyYWM1OTA3NWI5NjRiMDcxNTJkMjM0YjcwIn19','2017-11-24 07:01:20'),('lmnaz3rord5983zhy9ytm461n2kvs9e9','ZTdhYWM3MWVjMjFlYjE1NzkyYTlmNWQ2OTlkMGMxOThjNjU2YTQ0ODp7InNob3BsaXN0Ijp7IjEiOnsiaWQiOjEsImdvb2RzIjoiXHU4MmY5XHU2NzljIiwicGljbmFtZSI6IjE1MDE1MjYwNDMuNzgxNDM2LmpwZyIsInByaWNlIjoyNjgwLjAsInN0b3JlIjoyMCwibSI6Mn0sIjgiOnsiaWQiOjgsImdvb2RzIjoiVFx1NjA2NFx1ODg2YiIsInBpY25hbWUiOiIxNTAxNTQxMDEzLjA4MDA1MTQuanBnIiwicHJpY2UiOjIwMC4wLCJzdG9yZSI6NTAsIm0iOjJ9fSwidmVyaWZ5Y29kZSI6IjU5MTgiLCJ2aXB1c2VyIjp7ImlkIjo2LCJ1c2VybmFtZSI6InpoYW5nc2FuIiwibmFtZSI6Ilx1NWYyMFx1NGUwOSIsInBhc3N3b3JkIjoiMjAyY2I5NjJhYzU5MDc1Yjk2NGIwNzE1MmQyMzRiNzAifX0=','2017-11-24 07:24:26'),('oiqi5hbw6uikw5um22icqbv08db68yrv','NTM3MGZkOWE1ZmRjZWQ0YzljNTE1MmNlYzk4OTA2MmE5MjE3NTM5Mzp7InZlcmlmeWNvZGUiOiIwNDMzIiwiYWRtaW51c2VyIjp7ImlkIjoxLCJ1c2VybmFtZSI6ImFkbWluIiwibmFtZSI6Ilx1N2JhMVx1NzQwNlx1NTQ1OCIsInBhc3N3b3JkIjoiMjEyMzJmMjk3YTU3YTVhNzQzODk0YTBlNGE4MDFmYzMifSwic2hvcGxpc3QiOnsiMSI6eyJpZCI6MSwiZ29vZHMiOiJcdTgyZjlcdTY3OWMiLCJwaWNuYW1lIjoiMTUwMTUyNjA0My43ODE0MzYuanBnIiwicHJpY2UiOjI2ODAuMCwic3RvcmUiOjIwLCJtIjoyfSwiOSI6eyJpZCI6OSwiZ29vZHMiOiJcdTdlYTJcdTgyNzJcdThmZGVcdTg4NjNcdTg4ZDkiLCJwaWNuYW1lIjoiMTUwMTU0MTEyNC44OTYzNzE2LmpwZyIsInByaWNlIjozMjAuMCwic3RvcmUiOjMwLCJtIjozfX0sInZpcHVzZXIiOnsiaWQiOjYsInVzZXJuYW1lIjoiemhhbmdzYW4iLCJuYW1lIjoiXHU1ZjIwXHU0ZTA5IiwicGFzc3dvcmQiOiIyMDJjYjk2MmFjNTkwNzViOTY0YjA3MTUyZDIzNGI3MCJ9fQ==','2017-11-24 06:53:06'),('ruqyx3xd70c7u4z5o62e4fbw9owzfzjk','ZDkyMjc2YzkzNDUwZmY5M2EwNDhlZmU2YmIzNTI4MzcyNWYzMmQ5Mzp7InNob3BsaXN0Ijp7IjEiOnsiaWQiOjEsImdvb2RzIjoiXHU4MmY5XHU2NzljIiwicGljbmFtZSI6IjE1MDE1MjYwNDMuNzgxNDM2LmpwZyIsInByaWNlIjoyNjgwLjAsInN0b3JlIjoyMCwibSI6MX0sIjMiOnsiaWQiOjMsImdvb2RzIjoiXHU3YjE0XHU4YmIwXHU2NzJjXHU3NTM1XHU4MTExIiwicGljbmFtZSI6IjE1MDE1MjM4NzkuMjc3MzA4NS5qcGciLCJwcmljZSI6NDIwMC4wLCJzdG9yZSI6NDUsIm0iOjF9fSwidmVyaWZ5Y29kZSI6IjAzMTUifQ==','2017-11-24 07:00:20'),('sv4pq6fwsr66ws6ht4pgd3biz4ns1rc6','NjMxMzc4NTNiODgzMTNlYjA4ZWQzZjlkMTAzZGYyNGU0MDgyODU4YTp7InNob3BsaXN0Ijp7fSwidmVyaWZ5Y29kZSI6IjEyODAiLCJ2aXB1c2VyIjp7ImlkIjo2LCJ1c2VybmFtZSI6InpoYW5nc2FuIiwibmFtZSI6Ilx1NWYyMFx1NGUwOSIsInBhc3N3b3JkIjoiMjAyY2I5NjJhYzU5MDc1Yjk2NGIwNzE1MmQyMzRiNzAifX0=','2017-11-24 07:00:05'),('v1m5ys68c8doszz2zwcnsagbi9v6nycw','ZDcxODQxNjRhMDFkZTQyMjdlOTQ4NjM2OGEyYmY5ZTQ2NGJlMjY0Njp7InZlcmlmeWNvZGUiOiIxNjQwIn0=','2017-11-24 06:57:22'),('xfbsqwnrhtfmmuinxdjfu7nionjha1da','YmRkZTQ1NjM3NWRkNTMxMTk0MDYxOTUyYzQ2MjNhMzQzNmQ4OTRmYzp7InNob3BsaXN0Ijp7IjciOnsiaWQiOjcsImdvb2RzIjoiXHU2NWY2XHU1YzFhXHU5OGNlXHU4ODYzMjIiLCJwaWNuYW1lIjoiMTUwMTU0MDk2NS4zOTg2Nzk3LmpwZyIsInByaWNlIjoyODAuMCwic3RvcmUiOjI2LCJtIjoxfSwiMSI6eyJpZCI6MSwiZ29vZHMiOiJcdTgyZjlcdTY3OWMiLCJwaWNuYW1lIjoiMTUwMTUyNjA0My43ODE0MzYuanBnIiwicHJpY2UiOjI2ODAuMCwic3RvcmUiOjIwLCJtIjoxfX19','2017-11-24 06:57:27'),('yji14haugv0zr4uqxauardjgfkeldhxv','N2VkOTZjNWU1MzFjNzJlOWJiMDhiNTg4ZTAyZDFmMzYzOWU0OWUwZTp7InNob3BsaXN0Ijp7fX0=','2017-11-24 06:58:29');

/*Table structure for table `myweb_detail` */

DROP TABLE IF EXISTS `myweb_detail`;

CREATE TABLE `myweb_detail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `orderid` int(11) unsigned DEFAULT NULL,
  `goodsid` int(11) unsigned DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `price` double(6,2) DEFAULT NULL,
  `num` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

/*Data for the table `myweb_detail` */

insert  into `myweb_detail`(`id`,`orderid`,`goodsid`,`name`,`price`,`num`) values (18,18,7,'时尚风衣',380.00,1),(19,18,6,'华为手机',2800.00,1),(20,19,6,'华为手机',2800.00,1),(21,19,3,'笔记本电脑',4200.00,1),(22,21,7,'时尚风衣',380.00,1),(23,21,6,'华为手机',2800.00,1),(24,22,7,'时尚风衣',380.00,1),(25,22,6,'华为手机',2800.00,1),(26,23,7,'时尚风衣',380.00,1),(27,23,6,'华为手机',2800.00,1),(28,24,3,'笔记本电脑',4200.00,1),(29,25,7,'时尚风衣',380.00,1),(30,25,6,'华为手机',2800.00,1),(31,26,15,'条文T恤衫',220.00,1),(32,26,14,'黑色儿童套装',320.00,1),(33,27,8,'T恤衫',200.00,3),(34,27,3,'笔记本电脑',4200.00,3),(35,28,15,'条文T恤衫',220.00,4),(36,28,9,'红色连衣裙',320.00,1),(37,29,7,'时尚风衣',380.00,1),(38,30,16,'游戏专配笔记本',9999.99,1),(39,31,11,'数码相机',800.00,1),(40,31,16,'游戏专配笔记本',9999.99,1),(41,32,1,'苹果',2680.00,1),(42,33,8,'T恤衫',200.00,1),(43,34,7,'时尚风衣',380.00,1),(44,35,8,'T恤衫',200.00,1),(45,35,3,'笔记本电脑',4200.00,1),(46,36,6,'华为手机',2800.00,1),(47,37,1,'苹果',2680.00,1),(48,38,8,'T恤衫',200.00,1);

/*Table structure for table `myweb_goods` */

DROP TABLE IF EXISTS `myweb_goods`;

CREATE TABLE `myweb_goods` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `typeid` int(11) unsigned DEFAULT NULL,
  `goods` varchar(32) DEFAULT NULL,
  `company` varchar(50) DEFAULT NULL,
  `descr` text,
  `price` double(6,2) DEFAULT NULL,
  `picname` varchar(255) DEFAULT NULL,
  `state` tinyint(1) DEFAULT '1',
  `store` int(11) unsigned DEFAULT '0',
  `num` int(11) unsigned DEFAULT '0',
  `clicknum` int(11) unsigned DEFAULT '0',
  `addtime` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `typeid` (`typeid`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

/*Data for the table `myweb_goods` */

insert  into `myweb_goods`(`id`,`typeid`,`goods`,`company`,`descr`,`price`,`picname`,`state`,`store`,`num`,`clicknum`,`addtime`) values (1,16,'苹果','苹果公司','苹果公司				',2680.00,'1501526043.781436.jpg',2,20,0,30,1501510200),(3,3,'笔记本电脑','小米公司','笔记本电脑',4200.00,'1501523879.2773085.jpg',2,45,0,41,1501521162),(6,16,'华为手机','华为公司','华为公司的华为手机				',2800.00,'1509327444.8717892.jpg',2,20,0,21,1501540875),(7,5,'时尚风衣22','衣多米舒','衣多米舒的时尚风衣			',280.00,'1501540965.3986797.jpg',1,26,0,49,1501540965),(8,4,'T恤衫','七匹狼','七匹狼的T恤衫',200.00,'1501541013.0800514.jpg',1,50,0,46,1501541013),(9,5,'红色连衣裙','佰可衣','佰可衣的红色连衣裙				',320.00,'1501541124.8963716.jpg',1,30,0,29,1501541124),(10,5,'时尚连衣裙','GAP','GAP的时尚连衣裙				',180.00,'1501541216.215219.jpg',2,40,0,15,1501541216),(11,15,'数码相机','尼康','尼康的数码相机，2000千万像素，自动变焦，超大存储空间。',800.00,'1501541325.8870907.jpg',1,30,0,5,1501541325),(12,15,'数码相机','佳能','佳能的数码相机，3000像素。				',1000.00,'1501541383.3515506.jpg',2,48,0,1,1501541383),(13,8,'粉色儿童套装','哈比豆','哈比豆的粉色儿童套装。				',260.00,'1501541454.112759.jpg',1,30,0,4,1501541454),(14,8,'黑色儿童套装','灰太狼','灰太狼的黑色儿童套装',320.00,'1501541523.0172803.jpg',1,50,0,15,1501541523),(15,4,'条文T恤衫','啄木鸟','啄木鸟的条文T恤衫			',220.00,'1501541581.3563178.jpg',1,42,0,16,1501541581),(16,3,'游戏专配笔记本','外星人','外星人的游戏专配笔记本。\r\nCPU：英特尔i8（3.2Ghz）\r\n内存：16G（双通道）\r\n硬盘：2T固态硬盘\r\n显卡：显神XK8200（8G高速缓存）',9999.99,'1501541956.4921198.jpg',1,12,0,5,1501541956),(19,17,'辣条','老干妈','                    ',10.00,'1510280170.6533663.jpg',1,200,0,0,1510280170);

/*Table structure for table `myweb_orders` */

DROP TABLE IF EXISTS `myweb_orders`;

CREATE TABLE `myweb_orders` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned DEFAULT NULL,
  `linkman` varchar(32) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `code` char(6) DEFAULT NULL,
  `phone` varchar(16) DEFAULT NULL,
  `addtime` int(11) unsigned DEFAULT NULL,
  `total` double(8,2) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

/*Data for the table `myweb_orders` */

insert  into `myweb_orders`(`id`,`uid`,`linkman`,`address`,`code`,`phone`,`addtime`,`total`,`status`) values (18,6,'张三','北京市羽绒教育园区兄弟连楼','100086','11234567889',1508744741,3180.00,0),(19,6,'张三','北京市羽绒教育园区兄弟连楼','100086','11234567889',1508745195,7000.00,0),(20,6,'张三','北京市羽绒教育园区兄弟连楼','100086','11234567889',1508745342,3180.00,0),(21,6,'张三','北京市羽绒教育园区兄弟连楼','100086','11234567889',1508745375,3180.00,0),(22,6,'张三','北京市羽绒教育园区兄弟连楼','100086','11234567889',1508745450,3180.00,0),(23,6,'张三','北京市羽绒教育园区兄弟连楼','100086','11234567889',1508745472,3180.00,0),(24,6,'张三','北京市羽绒教育园区兄弟连楼','100086','11234567889',1508745578,4200.00,0),(25,6,'张三','北京市羽绒教育园区兄弟连楼','100086','11234567889',1508745663,3180.00,0),(26,6,'张三','北京市羽绒教育园区兄弟连楼','100086','11234567889',1508745749,540.00,0),(27,6,'张三','北京市羽绒教育园区兄弟连楼','100086','11234567889',1508746672,13200.00,0),(28,6,'张三','北京市羽绒教育园区兄弟连楼','100086','11234567889',1508748624,1200.00,0),(29,1,'管理员','wu','100086','12345678901',1508749663,380.00,0),(30,6,'张三','北京市羽绒教育园区兄弟连楼','100086','11234567889',1508749926,9999.99,0),(31,6,'张三','北京市羽绒教育园区兄弟连楼','100086','11234567889',1508750514,10799.99,0),(32,6,'张三','北京市羽绒教育园区兄弟连楼','100086','11234567889',1508750613,2680.00,0),(33,6,'张三','北京市羽绒教育园区兄弟连楼','100086','11234567889',1508751030,200.00,0),(34,6,'张三','北京市羽绒教育园区兄弟连楼','100086','11234567889',1508806563,380.00,0),(35,6,'张三','北京市羽绒教育园区兄弟连楼','100086','11234567889',1508807439,4400.00,0),(36,6,'张三','北京市羽绒教育园区兄弟连楼','100086','11234567889',1508826128,2800.00,0),(37,6,'张三','北京市羽绒教育园区兄弟连楼','100086','11234567889',1508826719,2680.00,0),(38,1,'管理员','wu','100086','12345678901',1508911109,200.00,0);

/*Table structure for table `myweb_type` */

DROP TABLE IF EXISTS `myweb_type`;

CREATE TABLE `myweb_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `pid` int(11) unsigned DEFAULT '0',
  `path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

/*Data for the table `myweb_type` */

insert  into `myweb_type`(`id`,`name`,`pid`,`path`) values (1,'服装',0,'0,'),(2,'数码',0,'0,'),(3,'电脑',2,'0,2,'),(4,'男装',1,'0,1,'),(5,'女装',1,'0,1,'),(15,'相机',2,'0,2,'),(7,'食品',0,'0,'),(8,'儿童装',1,'0,1,'),(9,'地方特产',7,'0,7,'),(16,'手机',2,'0,2,'),(17,'小吃',7,'0,7,'),(20,'老年装',1,'0,1,'),(21,'AAA',0,'0,'),(22,'BBB',21,'0,21,'),(23,'CCC',22,'0,21,22,'),(24,'DDD',22,'0,21,22,'),(25,'EEE',23,'0,21,22,23,');

/*Table structure for table `myweb_users` */

DROP TABLE IF EXISTS `myweb_users`;

CREATE TABLE `myweb_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `name` varchar(16) DEFAULT NULL,
  `password` char(32) NOT NULL,
  `sex` tinyint(1) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `code` char(6) DEFAULT NULL,
  `phone` varchar(16) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `state` tinyint(1) DEFAULT '1',
  `addtime` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `myweb_users` */

insert  into `myweb_users`(`id`,`username`,`name`,`password`,`sex`,`address`,`code`,`phone`,`email`,`state`,`addtime`) values (1,'admin','管理员','21232f297a57a5a743894a0e4a801fc3',1,'wu','100086','12345678901','admin@126.com',0,1234567809),(6,'zhangsan','张三','202cb962ac59075b964b07152d234b70',0,'北京市羽绒教育园区兄弟连楼','100086','11234567889','zhangsan@163.com',0,1502037835);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
