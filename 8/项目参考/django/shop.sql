/*
Navicat MySQL Data Transfer

Source Server         : 123
Source Server Version : 50722
Source Host           : 192.168.56.101:3306
Source Database       : shop

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2018-06-05 11:19:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------
INSERT INTO `auth_group` VALUES ('2', '会员管理组');
INSERT INTO `auth_group` VALUES ('1', '订单管理组');

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------
INSERT INTO `auth_group_permissions` VALUES ('9', '1', '46');
INSERT INTO `auth_group_permissions` VALUES ('10', '1', '47');
INSERT INTO `auth_group_permissions` VALUES ('11', '1', '48');
INSERT INTO `auth_group_permissions` VALUES ('18', '2', '40');

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can add user', '2', 'add_user');
INSERT INTO `auth_permission` VALUES ('5', 'Can change user', '2', 'change_user');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete user', '2', 'delete_user');
INSERT INTO `auth_permission` VALUES ('7', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('8', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can add permission', '4', 'add_permission');
INSERT INTO `auth_permission` VALUES ('11', 'Can change permission', '4', 'change_permission');
INSERT INTO `auth_permission` VALUES ('12', 'Can delete permission', '4', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('17', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('19', 'Can add users', '7', 'add_users');
INSERT INTO `auth_permission` VALUES ('20', 'Can change users', '7', 'change_users');
INSERT INTO `auth_permission` VALUES ('21', 'Can delete users', '7', 'delete_users');
INSERT INTO `auth_permission` VALUES ('22', 'Can add types', '8', 'add_types');
INSERT INTO `auth_permission` VALUES ('23', 'Can change types', '8', 'change_types');
INSERT INTO `auth_permission` VALUES ('24', 'Can delete types', '8', 'delete_types');
INSERT INTO `auth_permission` VALUES ('25', 'Can add goods', '9', 'add_goods');
INSERT INTO `auth_permission` VALUES ('26', 'Can change goods', '9', 'change_goods');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete goods', '9', 'delete_goods');
INSERT INTO `auth_permission` VALUES ('28', 'Can add order info', '10', 'add_orderinfo');
INSERT INTO `auth_permission` VALUES ('29', 'Can change order info', '10', 'change_orderinfo');
INSERT INTO `auth_permission` VALUES ('30', 'Can delete order info', '10', 'delete_orderinfo');
INSERT INTO `auth_permission` VALUES ('31', 'Can add order', '11', 'add_order');
INSERT INTO `auth_permission` VALUES ('32', 'Can change order', '11', 'change_order');
INSERT INTO `auth_permission` VALUES ('33', 'Can delete order', '11', 'delete_order');
INSERT INTO `auth_permission` VALUES ('34', 'Can add address', '12', 'add_address');
INSERT INTO `auth_permission` VALUES ('35', 'Can change address', '12', 'change_address');
INSERT INTO `auth_permission` VALUES ('36', 'Can delete address', '12', 'delete_address');
INSERT INTO `auth_permission` VALUES ('37', '查看商品分类管理', '8', 'show_types');
INSERT INTO `auth_permission` VALUES ('38', '添加商品分类', '8', 'insert_types');
INSERT INTO `auth_permission` VALUES ('39', '修改商品分类', '8', 'edit_types');
INSERT INTO `auth_permission` VALUES ('40', '删除商品分类', '8', 'del_types');
INSERT INTO `auth_permission` VALUES ('41', '查看商品管理', '9', 'show_goods');
INSERT INTO `auth_permission` VALUES ('42', '添加商品', '9', 'insert_goods');
INSERT INTO `auth_permission` VALUES ('43', '修改商品', '9', 'edit_goods');
INSERT INTO `auth_permission` VALUES ('44', '删除商品', '9', 'del_goods');
INSERT INTO `auth_permission` VALUES ('45', '查看订单管理', '11', 'show_order');
INSERT INTO `auth_permission` VALUES ('46', '添加订单', '11', 'insert_order');
INSERT INTO `auth_permission` VALUES ('47', '修改订单', '11', 'edit_order');
INSERT INTO `auth_permission` VALUES ('48', '删除订单', '11', 'del_order');
INSERT INTO `auth_permission` VALUES ('49', '查看会员管理', '7', 'show_users');
INSERT INTO `auth_permission` VALUES ('50', '添加会员', '7', 'insert_users');
INSERT INTO `auth_permission` VALUES ('51', '修改会员', '7', 'edit_users');
INSERT INTO `auth_permission` VALUES ('52', '删除会员', '7', 'del_users');
INSERT INTO `auth_permission` VALUES ('53', '查看地址管理', '12', 'show_address');
INSERT INTO `auth_permission` VALUES ('54', '添加地址', '12', 'insert_address');
INSERT INTO `auth_permission` VALUES ('55', '修改地址', '12', 'edit_address');
INSERT INTO `auth_permission` VALUES ('56', '删除地址', '12', 'del_address');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES ('2', 'pbkdf2_sha256$36000$Xl6rwPpFkV3V$DaGBLM8ZI0XlBJGKV2ER7mR48vn2D8JKa3UIcPRV5uI=', '2018-05-31 15:36:42.297528', '1', 'auth003', '', '', 'auth003@qq.com', '1', '1', '2018-05-31 13:12:30.621684');
INSERT INTO `auth_user` VALUES ('10', 'pbkdf2_sha256$36000$YgXMUeqEDXuq$y2ymcJjIdlBYNlqOSAeuF9pmF+RIVjJoQOl0+BTzFT0=', '2018-06-01 23:39:26.739549', '1', 'aaaa', '', '', 'aaaa@qq.com', '1', '1', '2018-05-31 15:04:42.425815');
INSERT INTO `auth_user` VALUES ('13', 'pbkdf2_sha256$36000$kp1BfY7hxve0$WYcYxNENzCoTH3EaXNjGryn1LjEEuw9H8qhPIvX5VLg=', '2018-06-01 08:17:33.301991', '0', 'asd', '', '', 'asd@qq.com', '0', '1', '2018-06-01 08:17:16.535952');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------
INSERT INTO `auth_user_groups` VALUES ('5', '13', '2');

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
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

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
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

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('4', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('12', 'myadmin', 'address');
INSERT INTO `django_content_type` VALUES ('9', 'myadmin', 'goods');
INSERT INTO `django_content_type` VALUES ('11', 'myadmin', 'order');
INSERT INTO `django_content_type` VALUES ('10', 'myadmin', 'orderinfo');
INSERT INTO `django_content_type` VALUES ('8', 'myadmin', 'types');
INSERT INTO `django_content_type` VALUES ('7', 'myadmin', 'users');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2018-05-17 17:15:00.352329');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2018-05-17 17:15:01.133724');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2018-05-17 17:15:01.306855');
INSERT INTO `django_migrations` VALUES ('4', 'admin', '0002_logentry_remove_auto_add', '2018-05-17 17:15:01.354001');
INSERT INTO `django_migrations` VALUES ('5', 'contenttypes', '0002_remove_content_type_name', '2018-05-17 17:15:01.529796');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0002_alter_permission_name_max_length', '2018-05-17 17:15:01.617606');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0003_alter_user_email_max_length', '2018-05-17 17:15:01.697460');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0004_alter_user_username_opts', '2018-05-17 17:15:01.733944');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0005_alter_user_last_login_null', '2018-05-17 17:15:01.860750');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0006_require_contenttypes_0002', '2018-05-17 17:15:01.870707');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0007_alter_validators_add_error_messages', '2018-05-17 17:15:01.912916');
INSERT INTO `django_migrations` VALUES ('12', 'auth', '0008_alter_user_username_max_length', '2018-05-17 17:15:02.037928');
INSERT INTO `django_migrations` VALUES ('13', 'sessions', '0001_initial', '2018-05-17 17:15:02.084762');
INSERT INTO `django_migrations` VALUES ('14', 'myadmin', '0001_initial', '2018-05-17 21:03:07.365487');
INSERT INTO `django_migrations` VALUES ('15', 'myadmin', '0002_types', '2018-05-21 14:11:43.942838');
INSERT INTO `django_migrations` VALUES ('16', 'myadmin', '0003_goods', '2018-05-22 10:57:35.985097');
INSERT INTO `django_migrations` VALUES ('17', 'myadmin', '0004_auto_20180524_1631', '2018-05-24 16:32:18.826160');
INSERT INTO `django_migrations` VALUES ('18', 'myadmin', '0005_address_order_orderinfo', '2018-05-28 23:14:05.805994');
INSERT INTO `django_migrations` VALUES ('19', 'myadmin', '0006_auto_20180531_1005', '2018-05-31 10:06:08.052788');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('1lh1q2xgxd6oefuh94iypumpkrc3r0zf', 'N2FjZWUyZDllNzRkZGVmOGQ1Nzc2ZWUxYWZiMTdmNjE5NWI0ZDBkZjp7InZlcmlmeWNvZGUiOiI4MzQ5In0=', '2018-06-15 23:39:47.859004');
INSERT INTO `django_session` VALUES ('6vvy4y34r80o9hsb0xfjpx2jhfv19mfe', 'NGViYTY3ZTI4MzIwN2EyY2UwYzY5NDg5YmM5OWE2NzVkNjNkMzBiMjp7InZlcmlmeWNvZGUiOiIyMTc3Iiwib3JkZXIiOnt9LCJjYXJ0Ijp7fSwiVmlwVXNlciI6eyJ1aWQiOjg5NiwicGljIjoiL3N0YXRpYy9waWNzL2RlZmF1bHQvZGVmYXVsdC5pY28iLCJuYW1lIjoiYmJiIn19', '2018-06-14 09:07:04.256576');
INSERT INTO `django_session` VALUES ('a7a768268fc9df0bfgdl5m18nzp0zi3y', 'N2E5OTU4MTk0MmEwYTJiYTU3NmI2YzY1MmVkMzgzNjVkYTU5MjQ5ZTp7ImNhcnQiOnsiMTUiOnsicGljIjoiL3N0YXRpYy9waWNzLzE1MjY5OTI4NTAuNjQ1Mzg5MzcyNzQ2LmpwZyIsImlkIjoxNSwicHJpY2UiOiIyOTk5LjAwIiwidGl0bGUiOiJcdTVjMGZcdTdjNzNcdTc1MzVcdTg5YzYiLCJudW0iOjI1fSwiMTgiOnsicGljIjoiL3N0YXRpYy9waWNzLzE1MjY5OTI5NzcuMDY4ODIzODYxNTAxLmpwZyIsImlkIjoxOCwicHJpY2UiOiIxMjM0LjU2IiwidGl0bGUiOiJcdTZlZGFcdTdiNTJcdTZkMTdcdTg4NjNcdTY3M2EiLCJudW0iOjR9fSwiVmlwVXNlciI6eyJwaWMiOiIvc3RhdGljL3BpY3MvZGVmYXVsdC9kZWZhdWx0LmljbyIsIm5hbWUiOiJhZG1pbiIsInVpZCI6ODgzfSwidmVyaWZ5Y29kZSI6IjQzNjUiLCJBZG1pblVzZXIiOnsicGljIjoiL3N0YXRpYy9waWNzL2RlZmF1bHQvZGVmYXVsdC5pY28iLCJuYW1lIjoiYWRtaW4ifX0=', '2018-06-11 18:56:20.880595');
INSERT INTO `django_session` VALUES ('dycxrgf4agpvbp8djmrioumnmodis4cp', 'ZmQ4OTgwM2ZmOWYyYmMwMWFhMTVkYjUzY2QyM2RjNDIwMzgyZDEzOTp7IkFkbWluVXNlciI6eyJwaWMiOiIvc3RhdGljL3BpY3MvMTUyNzY3NzgyOS42MjMxNzY4NDc3MDIuanBnIiwibmFtZSI6ImFkbWluIn0sIm9yZGVyIjp7IjE4Ijp7InBpYyI6Ii9zdGF0aWMvcGljcy8xNTI2OTkyOTc3LjA2ODgyMzg2MTUwMS5qcGciLCJ0aXRsZSI6Ilx1NmVkYVx1N2I1Mlx1NmQxN1x1ODg2M1x1NjczYSIsIm51bSI6MSwicHJpY2UiOiIxMjM0LjU2IiwiaWQiOjE4fSwiMjAiOnsicGljIjoiL3N0YXRpYy9waWNzLzE1MjY5OTUyNTIuMjk2NDU2ODQzNDI4LmpwZyIsInRpdGxlIjoiXHU4OGQ5XHU1YjUwIiwibnVtIjoxLCJwcmljZSI6IjE1NS4wMCIsImlkIjoyMH19LCJ2ZXJpZnljb2RlIjoiMTE0MCIsImNhcnQiOnsiMTgiOnsicGljIjoiL3N0YXRpYy9waWNzLzE1MjY5OTI5NzcuMDY4ODIzODYxNTAxLmpwZyIsInRpdGxlIjoiXHU2ZWRhXHU3YjUyXHU2ZDE3XHU4ODYzXHU2NzNhIiwibnVtIjoxLCJwcmljZSI6IjEyMzQuNTYiLCJpZCI6MTh9LCIyMCI6eyJwaWMiOiIvc3RhdGljL3BpY3MvMTUyNjk5NTI1Mi4yOTY0NTY4NDM0MjguanBnIiwidGl0bGUiOiJcdTg4ZDlcdTViNTAiLCJudW0iOjEsInByaWNlIjoiMTU1LjAwIiwiaWQiOjIwfX0sIlZpcFVzZXIiOnsicGljIjoiL3N0YXRpYy9waWNzLzE1Mjc2Nzc4MjkuNjIzMTc2ODQ3NzAyLmpwZyIsIm5hbWUiOiJhZG1pbiIsInVpZCI6ODgzfX0=', '2018-06-13 19:43:26.981748');
INSERT INTO `django_session` VALUES ('ni36g1s303sq3xfplmidgw1f5blikn9b', 'NmJkZGJiMzNlOGExZjRlOWM4OTczMzc5ZjcwN2NjY2RjNzU2ZjkwYzp7ImNhcnQiOnsiMjAiOnsicGljIjoiL3N0YXRpYy9waWNzLzE1MjY5OTUyNTIuMjk2NDU2ODQzNDI4LmpwZyIsInRpdGxlIjoiXHU4OGQ5XHU1YjUwIiwibnVtIjoxLCJwcmljZSI6IjE1NS4wMCIsImlkIjoyMH19LCJ2ZXJpZnljb2RlIjoiMjE0NyIsIm9yZGVyIjp7IjIwIjp7InBpYyI6Ii9zdGF0aWMvcGljcy8xNTI2OTk1MjUyLjI5NjQ1Njg0MzQyOC5qcGciLCJ0aXRsZSI6Ilx1ODhkOVx1NWI1MCIsIm51bSI6MSwicHJpY2UiOiIxNTUuMDAiLCJpZCI6MjB9fSwiVmlwVXNlciI6eyJwaWMiOiIvc3RhdGljL3BpY3MvMTUyNzY4MDIwOC45MzEzMjQyNjQxMzguaWNvIiwibmFtZSI6ImFhYWEiLCJ1aWQiOjg5NX19', '2018-06-13 20:00:55.054166');
INSERT INTO `django_session` VALUES ('plesue8jabkw407ashjv47p1jp8jpq3p', 'MDRlMDhkNGMyNTIwN2NmMzBlZDM0NDYyYTdjNjA1NTc4MmU0ODE3MDp7IkFkbWluVXNlciI6eyJwaWMiOiIvc3RhdGljL3BpY3MvZGVmYXVsdC9kZWZhdWx0LmljbyIsIm5hbWUiOiJhZG1pbiJ9LCJ2ZXJpZnljb2RlIjoiOTgwOCJ9', '2018-06-06 23:03:03.864460');
INSERT INTO `django_session` VALUES ('q64bxn293dq8r6f9oez2tq1j3gs76l77', 'N2NjMGIwODA0ZjRkZDkzNTliY2Q0MjBlODlkN2UwZDgzNjgzZGQ2Yzp7InZlcmlmeWNvZGUiOiI1MTQ5IiwiQWRtaW5Vc2VyIjp7InBpYyI6Ii9zdGF0aWMvcGljcy9kZWZhdWx0L2RlZmF1bHQuaWNvIiwibmFtZSI6ImFkbWluIn19', '2018-06-06 19:53:51.051892');
INSERT INTO `django_session` VALUES ('qg58xv7xz8yi272neq1xwpj7vxkj02cd', 'MjQ3YzA5NDg3M2Y1ZDQ1MjFiYzRlNWZiNzE3YjVhMDg5NWYyZTRhZTp7Im9yZGVyIjp7IjE2Ijp7Im51bSI6MSwidGl0bGUiOiJcdTc1MzVcdTg5YzYzIiwicGljIjoiL3N0YXRpYy9waWNzLzE1MjY5OTI4ODkuMTIxNTIxNzQ3NjM0LmpwZyIsInByaWNlIjoiMTU2ODcuMDAiLCJpZCI6MTZ9LCI5Ijp7InRpdGxlIjoiXHU2ZDc3XHU3ZWY1XHU1YjlkXHU1YjlkXHU1MWIwXHU3YmIxMSIsImlkIjo5LCJwaWMiOiIvc3RhdGljL3BpY3MvMTUyNjk5MjcxMy45MTQwMTU1MTUyNTQuanBnIiwicHJpY2UiOiI5OTguMDAiLCJudW0iOjF9fSwiVmlwVXNlciI6eyJuYW1lIjoiYWRtaW4iLCJ1aWQiOjg4MywicGljIjoiL3N0YXRpYy9waWNzLzE1Mjc2Nzc4MjkuNjIzMTc2ODQ3NzAyLmpwZyJ9LCJfYXV0aF91c2VyX2lkIjoiMTAiLCJfYXV0aF91c2VyX2hhc2giOiJhMzJkZTFlMTkwMDEzNzU2ODg3YjkzZGVhMmJjNWNlZmRlNjYxOWIyIiwiY2FydCI6eyIxNiI6eyJudW0iOjEsInRpdGxlIjoiXHU3NTM1XHU4OWM2MyIsInBpYyI6Ii9zdGF0aWMvcGljcy8xNTI2OTkyODg5LjEyMTUyMTc0NzYzNC5qcGciLCJwcmljZSI6IjE1Njg3LjAwIiwiaWQiOjE2fSwiOSI6eyJ0aXRsZSI6Ilx1NmQ3N1x1N2VmNVx1NWI5ZFx1NWI5ZFx1NTFiMFx1N2JiMTEiLCJpZCI6OSwicGljIjoiL3N0YXRpYy9waWNzLzE1MjY5OTI3MTMuOTE0MDE1NTE1MjU0LmpwZyIsInByaWNlIjoiOTk4LjAwIiwibnVtIjoxfX0sIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwidmVyaWZ5Y29kZSI6IjA1NTEifQ==', '2018-06-14 16:15:39.994555');
INSERT INTO `django_session` VALUES ('qobdufoif8no26t4rg6fnu3lm2oql5kw', 'MzEzMTY1NzE3MDI4ZDZlN2I3OWUyNTg4ZGE1NGQ4Yjk0ODQ0N2FmMTp7InZlcmlmeWNvZGUiOiI2NjE2In0=', '2018-06-06 14:26:57.748446');
INSERT INTO `django_session` VALUES ('r5iwiwf00bp5w19x1po5fozeri529gbz', 'OWQxNDFiZjVjNzBmY2IxOTIwNDhjMjc1NGFlOWQ0NWQwYmQ0YjQ4MDp7IkFkbWluVXNlciI6eyJwaWMiOiIvc3RhdGljL3BpY3MvZGVmYXVsdC9kZWZhdWx0LmljbyIsIm5hbWUiOiJhZG1pbiJ9LCJ2ZXJpZnljb2RlIjoiMjAzOCJ9', '2018-06-06 23:03:33.266533');
INSERT INTO `django_session` VALUES ('unmdsmlp0dmu17c6t2hyuqj7f0fbkxeu', 'OGM5YWI2OGI1N2EyODllOTdmMWQ2YjVmMjVjYzNlMTVjOWUzN2UxOTp7InZlcmlmeWNvZGUiOiI2NjExIiwib3JkZXIiOnt9LCJjYXJ0Ijp7fSwiVmlwVXNlciI6eyJ1aWQiOjg5OSwibmFtZSI6IiIsInBpYyI6Ii9zdGF0aWMvcGljcy9kZWZhdWx0L2RlZmF1bHQuaWNvIn19', '2018-06-14 15:44:16.345219');

-- ----------------------------
-- Table structure for myadmin_address
-- ----------------------------
DROP TABLE IF EXISTS `myadmin_address`;
CREATE TABLE `myadmin_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aname` varchar(20) NOT NULL,
  `aads` varchar(255) NOT NULL,
  `aphone` varchar(11) NOT NULL,
  `status` int(11) NOT NULL,
  `uid_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myadmin_address_uid_id_79af8acf_fk_myadmin_users_id` (`uid_id`),
  CONSTRAINT `myadmin_address_uid_id_79af8acf_fk_myadmin_users_id` FOREIGN KEY (`uid_id`) REFERENCES `myadmin_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of myadmin_address
-- ----------------------------
INSERT INTO `myadmin_address` VALUES ('1', '张三', '北京1号', '10086', '0', '883');
INSERT INTO `myadmin_address` VALUES ('2', '熊大', '北京2号', '10000', '0', '883');
INSERT INTO `myadmin_address` VALUES ('3', '熊二', '北京3号', '10001', '0', '883');
INSERT INTO `myadmin_address` VALUES ('5', '红猫', '北京4号', '10003', '0', '883');
INSERT INTO `myadmin_address` VALUES ('6', '蓝兔', '北京5号', '10086', '0', '883');
INSERT INTO `myadmin_address` VALUES ('7', '蓝兔', '北京5号', '10086', '0', '883');
INSERT INTO `myadmin_address` VALUES ('8', '喜洋洋', '北京5号', '10086', '0', '883');
INSERT INTO `myadmin_address` VALUES ('11', '喜洋洋2', '北京5号2', '100862', '0', '883');
INSERT INTO `myadmin_address` VALUES ('12', '喜洋洋3', '北京5号3', '10086-3', '0', '883');
INSERT INTO `myadmin_address` VALUES ('20', 'aaaa', '北京1', '10001', '0', '895');
INSERT INTO `myadmin_address` VALUES ('21', 'aaa2', '北京2', '10086', '0', '895');
INSERT INTO `myadmin_address` VALUES ('22', 'aaaa', '北京3', '10086', '0', '895');
INSERT INTO `myadmin_address` VALUES ('23', 'aaaa', '北京3号', '10086', '0', '895');
INSERT INTO `myadmin_address` VALUES ('24', 'aaaa', '北京4号', '10086', '0', '895');
INSERT INTO `myadmin_address` VALUES ('28', 'bbb', '北京10010', '10010', '0', '896');
INSERT INTO `myadmin_address` VALUES ('29', 'ccc', '北京', '10010', '0', '897');
INSERT INTO `myadmin_address` VALUES ('30', 'dddd', '北京dddd', '10086', '0', '898');
INSERT INTO `myadmin_address` VALUES ('31', '1', '1', '1', '0', '899');
INSERT INTO `myadmin_address` VALUES ('32', 'cheshi1', '北京', '10086', '0', '903');
INSERT INTO `myadmin_address` VALUES ('33', '测试2', '北京10000', '10000', '0', '904');
INSERT INTO `myadmin_address` VALUES ('35', 'ceshi100', 'beijing', '10086', '0', '906');
INSERT INTO `myadmin_address` VALUES ('37', 'ceshi3', '北京', '10086', '0', '905');

-- ----------------------------
-- Table structure for myadmin_goods
-- ----------------------------
DROP TABLE IF EXISTS `myadmin_goods`;
CREATE TABLE `myadmin_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `storage` int(11) NOT NULL,
  `pic` varchar(255) NOT NULL,
  `info` longtext NOT NULL,
  `num` int(11) NOT NULL,
  `clicknum` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `addtime` datetime(6) NOT NULL,
  `typeid_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myadmin_goods_typeid_id_a0810d57_fk_myadmin_types_id` (`typeid_id`),
  CONSTRAINT `myadmin_goods_typeid_id_a0810d57_fk_myadmin_types_id` FOREIGN KEY (`typeid_id`) REFERENCES `myadmin_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of myadmin_goods
-- ----------------------------
INSERT INTO `myadmin_goods` VALUES ('2', '冰箱2', '1999.99', '44', '/static/pics/1527812485.95703723616.jpg', '<p>	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 		\r\n	 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;		</p><p>	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 		\r\n	 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;		</p><p>	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 		\r\n	 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;		</p><p>	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 		\r\n	 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;		</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</p><h1>冰箱2号</h1><p><img src=\"/static/media/article/20180531/20180531184117066.jpg\" title=\"20180531/20180531184117066.jpg\" alt=\"20180531/20180531184117066.jpg\"/></p><h1>风冷无双 电脑控温</h1><h1><span style=\"color: rgb(255, 0, 0);\"><em><strong>12年保修 品质保证</strong></em></span></h1>', '8', '0', '2', '2018-05-22 14:32:45.576754', '18');
INSERT INTO `myadmin_goods` VALUES ('3', '洗衣机1号', '998.99', '17', '/static/pics/1526992700.832282582880.jpg', '<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p><h1><span style=\"color: rgb(255, 0, 0);\">洗衣机1号</span></h1><p><img src=\"/static/media/article/20180531/20180531164818529.jpg\" title=\"20180531/20180531164818529.jpg\" alt=\"20180531/20180531164818529.jpg\"/></p>', '3', '2', '2', '2018-05-22 15:21:03.366934', '9');
INSERT INTO `myadmin_goods` VALUES ('9', '海绵宝宝冰箱1', '998.00', '4', '/static/pics/1526992713.914015515254.jpg', '<p>	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 		\r\n	 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;		</p><p>海绵冰箱</p>', '9', '0', '1', '2018-05-22 17:34:02.100404', '18');
INSERT INTO `myadmin_goods` VALUES ('10', '宝宝冰箱', '998.00', '4', '/static/pics/1526992732.68901364252.jpg', '<p>	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 		\r\n	 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;		</p><p>123</p>', '6', '3', '1', '2018-05-22 17:34:22.911955', '18');
INSERT INTO `myadmin_goods` VALUES ('12', '新品冰箱', '12345.60', '11', '/static/pics/1526992752.491110349331.jpg', '<p>	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 		\r\n	 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;		</p><p>	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 		\r\n	 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;		</p><p>新品冰箱</p>', '1', '0', '2', '2018-05-22 19:22:16.063904', '18');
INSERT INTO `myadmin_goods` VALUES ('13', '冰箱1', '123.46', '10', '/static/pics/1526992660.392464244743.jpg', '<p>冰箱1号</p>', '0', '0', '1', '2018-05-22 20:37:40.403086', '18');
INSERT INTO `myadmin_goods` VALUES ('14', '电视1', '999.00', '8', '/static/pics/1526992823.072288890769.jpg', '<p>	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 		\r\n	 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;		</p><p>	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 		\r\n	 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;		</p><h1>电视1</h1><p><img src=\"/static/media/article/20180531/20180531184228753.jpg\" title=\"20180531/20180531184228753.jpg\" alt=\"20180531/20180531184228753.jpg\"/></p><h1><span style=\"color: rgb(255, 0, 0);\"><strong>SHARP</strong></span></h1>', '7', '0', '1', '2018-05-22 20:40:23.075511', '19');
INSERT INTO `myadmin_goods` VALUES ('15', '小米电视', '2999.00', '46', '/static/pics/1526992850.645389372746.jpg', '<p>小米</p>', '4', '0', '1', '2018-05-22 20:40:50.648864', '19');
INSERT INTO `myadmin_goods` VALUES ('16', '电视3', '15687.00', '52', '/static/pics/1526992889.121521747634.jpg', '<p>电视3</p>', '0', '0', '1', '2018-05-22 20:41:29.124642', '19');
INSERT INTO `myadmin_goods` VALUES ('17', '品质电视', '99999.00', '5', '/static/pics/1526992931.123736470991.jpg', '<p>品质电视</p>', '0', '0', '1', '2018-05-22 20:42:11.126467', '19');
INSERT INTO `myadmin_goods` VALUES ('18', '滚筒洗衣机', '1234.56', '38', '/static/pics/1526992977.068823861501.jpg', '<p>滚筒</p>', '10', '0', '1', '2018-05-22 20:42:57.073310', '9');
INSERT INTO `myadmin_goods` VALUES ('19', '双开门冰箱', '7829.89', '2', '/static/pics/1526993039.11142553744.jpg', '<p>双开门</p>', '3', '0', '1', '2018-05-22 20:43:59.116087', '18');
INSERT INTO `myadmin_goods` VALUES ('20', '裙子', '155.00', '43', '/static/pics/1526995252.296456843428.jpg', '<p>	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 		\r\n	 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;		</p><p>	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 		\r\n	 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;		</p><p>裙子</p>', '7', '0', '2', '2018-05-22 20:46:20.471932', '6');
INSERT INTO `myadmin_goods` VALUES ('45', '热卖手机1号', '1234.00', '7', '/static/pics/1527757854.13096666381.jpg', '<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</p><h1><span style=\"color: rgb(255, 0, 0);\">魅蓝Note5</span><br/></h1><p><img src=\"/static/media/article/20180531/20180531172638472.jpg\" title=\"20180531/20180531172638472.jpg\" alt=\"20180531/20180531172638472.jpg\"/></p><h1><em><span style=\"color: rgb(255, 0, 0);\">月销量超过1800台</span></em></h1>', '3', '0', '1', '2018-05-31 17:09:12.536231', '25');
INSERT INTO `myadmin_goods` VALUES ('46', '热卖2号产品', '1830.00', '9', '/static/pics/1527763574.51075771782.jpg', '<h1><span style=\"color: rgb(0, 112, 192);\">魅族2号</span></h1><p><img src=\"/static/media/article/20180531/20180531184529207.jpg\" title=\"20180531/20180531184529207.jpg\" alt=\"20180531/20180531184529207.jpg\"/></p><h1><span style=\"text-decoration: underline; color: rgb(255, 0, 0);\">月销量超1500台</span></h1>', '1', '0', '1', '2018-05-31 18:46:14.514552', '25');
INSERT INTO `myadmin_goods` VALUES ('47', '短裙', '999.00', '10', '/static/pics/1527768529.898038917880.jpg', '<h1><span style=\"color: rgb(255, 0, 0);\">短裙</span></h1><p><img src=\"/static/media/article/20180531/20180531200826301.jpg\" title=\"20180531/20180531200826301.jpg\" alt=\"20180531/20180531200826301.jpg\"/></p><h1><span style=\"color: rgb(255, 0, 0);\">只要999</span></h1>', '0', '0', '1', '2018-05-31 20:08:49.901684', '6');
INSERT INTO `myadmin_goods` VALUES ('48', '裙子', '666.00', '43', '/static/pics/1527768667.593430543545.jpg', '<h1><span style=\"color: rgb(255, 0, 0);\">这个男人可以买</span></h1><p><img src=\"/static/media/article/20180531/20180531201053446.jpg\" title=\"20180531/20180531201053446.jpg\" alt=\"20180531/20180531201053446.jpg\"/></p><p><br/></p>', '2', '0', '1', '2018-05-31 20:11:07.607937', '5');

-- ----------------------------
-- Table structure for myadmin_order
-- ----------------------------
DROP TABLE IF EXISTS `myadmin_order`;
CREATE TABLE `myadmin_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `totalprice` double NOT NULL,
  `totalnum` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `addtime` datetime(6) NOT NULL,
  `address_id` int(11) NOT NULL,
  `uid_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myadmin_order_address_id_8f2ad596_fk_myadmin_address_id` (`address_id`),
  KEY `myadmin_order_uid_id_bcf75806_fk_myadmin_users_id` (`uid_id`),
  CONSTRAINT `myadmin_order_address_id_8f2ad596_fk_myadmin_address_id` FOREIGN KEY (`address_id`) REFERENCES `myadmin_address` (`id`),
  CONSTRAINT `myadmin_order_uid_id_bcf75806_fk_myadmin_users_id` FOREIGN KEY (`uid_id`) REFERENCES `myadmin_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of myadmin_order
-- ----------------------------
INSERT INTO `myadmin_order` VALUES ('5', '23489.67', '3', '2', '2018-05-29 10:00:36.365182', '5', '883');
INSERT INTO `myadmin_order` VALUES ('6', '3996', '4', '3', '2018-05-29 10:09:51.831640', '5', '883');
INSERT INTO `myadmin_order` VALUES ('7', '4938.24', '4', '4', '2018-05-29 10:10:15.543048', '5', '883');
INSERT INTO `myadmin_order` VALUES ('8', '998.99', '1', '5', '2018-05-29 10:15:43.242490', '5', '883');
INSERT INTO `myadmin_order` VALUES ('9', '998', '1', '1', '2018-05-29 10:19:13.931695', '5', '883');
INSERT INTO `myadmin_order` VALUES ('10', '1153', '2', '2', '2018-05-29 11:00:40.220659', '5', '883');
INSERT INTO `myadmin_order` VALUES ('11', '2995', '3', '1', '2018-05-29 11:20:17.301810', '5', '883');
INSERT INTO `myadmin_order` VALUES ('12', '6993.98', '5', '1', '2018-05-29 11:41:02.625781', '5', '883');
INSERT INTO `myadmin_order` VALUES ('13', '1308.99', '3', '1', '2018-05-29 15:14:03.691063', '8', '883');
INSERT INTO `myadmin_order` VALUES ('14', '1999.99', '1', '1', '2018-05-29 16:42:10.793281', '8', '883');
INSERT INTO `myadmin_order` VALUES ('15', '15344.59', '3', '2', '2018-05-30 19:26:53.925882', '1', '883');
INSERT INTO `myadmin_order` VALUES ('16', '1234.56', '1', '1', '2018-05-30 20:03:21.065365', '22', '895');
INSERT INTO `myadmin_order` VALUES ('17', '2999', '1', '1', '2018-05-30 20:40:58.732816', '22', '895');
INSERT INTO `myadmin_order` VALUES ('18', '3995.99', '3', '1', '2018-05-31 09:06:38.978463', '28', '896');
INSERT INTO `myadmin_order` VALUES ('19', '155', '1', '1', '2018-05-31 09:07:03.764909', '28', '896');
INSERT INTO `myadmin_order` VALUES ('20', '10231.56', '4', '1', '2018-05-31 09:12:50.349167', '29', '897');
INSERT INTO `myadmin_order` VALUES ('21', '2151', '3', '1', '2018-05-31 09:48:04.691262', '30', '898');
INSERT INTO `myadmin_order` VALUES ('22', '155', '1', '1', '2018-05-31 15:44:16.307239', '31', '899');
INSERT INTO `myadmin_order` VALUES ('23', '2997.99', '2', '1', '2018-05-31 16:19:39.936068', '32', '903');
INSERT INTO `myadmin_order` VALUES ('24', '998.99', '1', '1', '2018-05-31 16:20:05.876415', '32', '903');
INSERT INTO `myadmin_order` VALUES ('25', '1234.56', '1', '1', '2018-05-31 16:29:40.766238', '32', '903');
INSERT INTO `myadmin_order` VALUES ('26', '3064', '2', '1', '2018-05-31 19:51:38.395616', '33', '904');
INSERT INTO `myadmin_order` VALUES ('27', '3467', '3', '1', '2018-06-01 08:24:32.472169', '35', '906');
INSERT INTO `myadmin_order` VALUES ('28', '666', '1', '1', '2018-06-01 22:16:07.830303', '33', '904');
INSERT INTO `myadmin_order` VALUES ('29', '666', '1', '1', '2018-06-01 22:19:23.610377', '37', '905');
INSERT INTO `myadmin_order` VALUES ('30', '2469.12', '2', '1', '2018-06-01 23:09:28.665399', '33', '904');
INSERT INTO `myadmin_order` VALUES ('31', '1234.56', '1', '1', '2018-06-01 23:12:57.005082', '33', '904');
INSERT INTO `myadmin_order` VALUES ('32', '155', '1', '1', '2018-06-01 23:24:29.024516', '33', '904');

-- ----------------------------
-- Table structure for myadmin_orderinfo
-- ----------------------------
DROP TABLE IF EXISTS `myadmin_orderinfo`;
CREATE TABLE `myadmin_orderinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` int(11) NOT NULL,
  `price` double NOT NULL,
  `gid_id` int(11) NOT NULL,
  `orderid_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myadmin_orderinfo_gid_id_6d844ef9_fk_myadmin_goods_id` (`gid_id`),
  KEY `myadmin_orderinfo_orderid_id_9e3ed2c9_fk_myadmin_order_id` (`orderid_id`),
  CONSTRAINT `myadmin_orderinfo_gid_id_6d844ef9_fk_myadmin_goods_id` FOREIGN KEY (`gid_id`) REFERENCES `myadmin_goods` (`id`),
  CONSTRAINT `myadmin_orderinfo_orderid_id_9e3ed2c9_fk_myadmin_order_id` FOREIGN KEY (`orderid_id`) REFERENCES `myadmin_order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of myadmin_orderinfo
-- ----------------------------
INSERT INTO `myadmin_orderinfo` VALUES ('1', '3', '7829.89', '19', '5');
INSERT INTO `myadmin_orderinfo` VALUES ('2', '4', '999', '14', '6');
INSERT INTO `myadmin_orderinfo` VALUES ('3', '4', '1234.56', '18', '7');
INSERT INTO `myadmin_orderinfo` VALUES ('4', '1', '998.99', '3', '8');
INSERT INTO `myadmin_orderinfo` VALUES ('5', '1', '998', '10', '9');
INSERT INTO `myadmin_orderinfo` VALUES ('6', '1', '155', '20', '10');
INSERT INTO `myadmin_orderinfo` VALUES ('7', '1', '998', '9', '10');
INSERT INTO `myadmin_orderinfo` VALUES ('8', '2', '998', '10', '11');
INSERT INTO `myadmin_orderinfo` VALUES ('9', '1', '999', '14', '11');
INSERT INTO `myadmin_orderinfo` VALUES ('10', '2', '1999.99', '2', '12');
INSERT INTO `myadmin_orderinfo` VALUES ('11', '3', '998', '9', '12');
INSERT INTO `myadmin_orderinfo` VALUES ('12', '1', '998.99', '3', '13');
INSERT INTO `myadmin_orderinfo` VALUES ('13', '2', '155', '20', '13');
INSERT INTO `myadmin_orderinfo` VALUES ('14', '1', '1999.99', '2', '14');
INSERT INTO `myadmin_orderinfo` VALUES ('15', '1', '12345.6', '12', '15');
INSERT INTO `myadmin_orderinfo` VALUES ('16', '1', '999', '14', '15');
INSERT INTO `myadmin_orderinfo` VALUES ('17', '1', '1999.99', '2', '15');
INSERT INTO `myadmin_orderinfo` VALUES ('18', '1', '1234.56', '18', '16');
INSERT INTO `myadmin_orderinfo` VALUES ('19', '1', '2999', '15', '17');
INSERT INTO `myadmin_orderinfo` VALUES ('20', '2', '998', '9', '18');
INSERT INTO `myadmin_orderinfo` VALUES ('21', '1', '1999.99', '2', '18');
INSERT INTO `myadmin_orderinfo` VALUES ('22', '1', '155', '20', '19');
INSERT INTO `myadmin_orderinfo` VALUES ('23', '1', '1234.56', '18', '20');
INSERT INTO `myadmin_orderinfo` VALUES ('24', '3', '2999', '15', '20');
INSERT INTO `myadmin_orderinfo` VALUES ('25', '1', '155', '20', '21');
INSERT INTO `myadmin_orderinfo` VALUES ('26', '2', '998', '10', '21');
INSERT INTO `myadmin_orderinfo` VALUES ('27', '1', '155', '20', '22');
INSERT INTO `myadmin_orderinfo` VALUES ('28', '1', '998', '10', '23');
INSERT INTO `myadmin_orderinfo` VALUES ('29', '1', '1999.99', '2', '23');
INSERT INTO `myadmin_orderinfo` VALUES ('30', '1', '998.99', '3', '24');
INSERT INTO `myadmin_orderinfo` VALUES ('31', '1', '1234.56', '18', '25');
INSERT INTO `myadmin_orderinfo` VALUES ('32', '1', '1830', '46', '26');
INSERT INTO `myadmin_orderinfo` VALUES ('33', '1', '1234', '45', '26');
INSERT INTO `myadmin_orderinfo` VALUES ('34', '2', '1234', '45', '27');
INSERT INTO `myadmin_orderinfo` VALUES ('35', '1', '999', '14', '27');
INSERT INTO `myadmin_orderinfo` VALUES ('36', '1', '666', '48', '28');
INSERT INTO `myadmin_orderinfo` VALUES ('37', '1', '666', '48', '29');
INSERT INTO `myadmin_orderinfo` VALUES ('38', '2', '1234.56', '18', '30');
INSERT INTO `myadmin_orderinfo` VALUES ('39', '1', '1234.56', '18', '31');
INSERT INTO `myadmin_orderinfo` VALUES ('40', '1', '155', '20', '32');

-- ----------------------------
-- Table structure for myadmin_types
-- ----------------------------
DROP TABLE IF EXISTS `myadmin_types`;
CREATE TABLE `myadmin_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `pid` int(11) NOT NULL,
  `path` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of myadmin_types
-- ----------------------------
INSERT INTO `myadmin_types` VALUES ('1', '家电', '0', '0,');
INSERT INTO `myadmin_types` VALUES ('3', '服装', '0', '0,');
INSERT INTO `myadmin_types` VALUES ('5', '男装', '3', '0,3,');
INSERT INTO `myadmin_types` VALUES ('6', '女装', '3', '0,3,');
INSERT INTO `myadmin_types` VALUES ('9', '洗衣机', '1', '0,1,');
INSERT INTO `myadmin_types` VALUES ('10', '手机类', '0', '0,');
INSERT INTO `myadmin_types` VALUES ('18', '冰箱', '1', '0,1,');
INSERT INTO `myadmin_types` VALUES ('19', '电视', '1', '0,1,');
INSERT INTO `myadmin_types` VALUES ('25', '魅族', '10', '0,10,');
INSERT INTO `myadmin_types` VALUES ('26', '华为', '10', '0,10,');

-- ----------------------------
-- Table structure for myadmin_users
-- ----------------------------
DROP TABLE IF EXISTS `myadmin_users`;
CREATE TABLE `myadmin_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(77) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `sex` varchar(1),
  `age` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `addtime` datetime(6) NOT NULL,
  `picurl` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=907 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of myadmin_users
-- ----------------------------
INSERT INTO `myadmin_users` VALUES ('1', '张三', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'zs@qq.com', '13701383017', '男', '22', '2', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('2', '熊大', 'pbkdf2_sha256$36000$NCar8I4r0EuZ$XTvW1T0RNqBLq+w4FVpZ1NL/vO6ETD8xvvomRNtckxQ=', '123@qq.com', '17610195211', '女', '27', '3', '2018-05-18 09:08:58.000000', '/static/pics/1527729560.081853270125.ico');
INSERT INTO `myadmin_users` VALUES ('3', '熊二1', 'pbkdf2_sha256$36000$iA87yAE6xyWv$YdEVVPj5iZt/9d3keuKBVuLVFnBh8ppxVaRWaozuvWc=', 'xe@qq.com', '13701383017', '男', '22', '1', '2018-05-18 09:08:58.000000', '/static/pics/1527812390.483575858892.ico');
INSERT INTO `myadmin_users` VALUES ('4', 'zhangsan', 'pbkdf2_sha256$36000$E1qqo9rbsYJs$8NvwGexQLiKyXLoqOcfSoWoSpJBBxP+Oi/2BpK+bxSU=', 'zs@qq.com', '13701383017', '女', '21', '0', '2018-05-18 09:08:58.000000', '/static/pics/1527087477.282650751938.ico');
INSERT INTO `myadmin_users` VALUES ('5', '齐桓公', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'zs@qq.com', '13701383017', '男', '22', '2', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('6', '狐突', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'zs@qq.com', '13701383017', '男', '22', '0', '2018-05-18 09:08:58.000000', '/static/pics/1527087488.589448531638.ico');
INSERT INTO `myadmin_users` VALUES ('7', '狐偃', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'zs@qq.com', '13701383017', '男', '23', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('8', '狐毛', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'zs@qq.com', '13701383017', '男', '22', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('9', '介子推', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'zs@qq.com', '13701383017', '男', '22', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('10', '里克', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'zs@qq.com', '13701383017', '男', '22', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('11', '邳郑', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'zs@qq.com', '13701383017', '男', '22', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('12', '宋襄公', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'zs@qq.com', '13701383017', '男', '22', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('13', '秦穆公', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'zs@qq.com', '13701383017', '男', '22', '1', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('14', '楚庄王', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'zs@qq.com', '13701383017', '男', '22', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('15', '石碏', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'zs@qq.com', '13701383017', '男', '22', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('16', '石厚', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'zs@qq.com', '13701383017', '男', '22', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('17', '州吁', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'zs@qq.com', '13701383017', '男', '22', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('18', '郑突', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'zs@qq.com', '13701383017', '男', '22', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('19', '郑忽', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'zs@qq.com', '13701383017', '男', '22', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('20', '老子', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'zs@qq.com', '13701383017', '男', '22', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('21', '孔子', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'zs@qq.com', '13701383017', '男', '22', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('22', '孙武', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'zs@qq.com', '13701383017', '男', '22', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('23', '左丘明', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'zs@qq.com', '13701383017', '男', '22', '1', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('24', '伍子胥', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'zs@qq.com', '13701383017', '男', '22', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('25', '范蠡', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'zs@qq.com', '13701383017', '男', '22', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('26', '西施', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'zs@qq.com', '13701383017', '男', '22', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('27', '勾践', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'zs@qq.com', '13701383017', '男', '31', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('28', '阖闾', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'zs@qq.com', '13701383017', '男', '22', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('29', '夫差', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'zs@qq.com', '13701383017', '男', '22', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('30', '文种', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'zs@qq.com', '13701383017', '男', '31', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('31', '专诸', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'zs@qq.com', '13701383017', '男', '22', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('32', '要离', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'zs@qq.com', '13701383017', '男', '22', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('33', '庆忌', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'zs@qq.com', '13701383017', '男', '22', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('34', '吴王僚', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'zs@qq.com', '13701383017', '男', '31', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('35', '伊尹', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'zs@qq.com', '13701383017', '男', '22', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('36', '烛之武', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'zs@qq.com', '13701383017', '男', '22', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('37', '公子光', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'zs@qq.com', '13701383017', '男', '22', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('38', '魏舒', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'zs@qq.com', '13701383017', '男', '22', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('39', '晏婴', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'zs@qq.com', '13701383017', '男', '31', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('40', '庆父   战国：乐毅', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'zs@qq.com', '13701383017', '男', '22', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('41', '吴起', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'zs@qq.com', '13701383017', '男', '22', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('42', '孙膑', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'zs@qq.com', '13701383017', '男', '31', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('43', '庞涓', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'zs@qq.com', '13701383017', '男', '22', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('44', '廉颇', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'zs@qq.com', '13701383017', '男', '22', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('45', '赵牧', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'zs@qq.com', '13701383017', '男', '22', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('46', '赵奢', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'zs@qq.com', '13701383017', '男', '31', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('47', '赵括', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'zs@qq.com', '13701383017', '男', '22', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('48', '项燕', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'zs@qq.com', '13701383017', '男', '22', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('49', '田单', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'zs@qq.com', '13701383017', '男', '31', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('50', '韩非', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'zs@qq.com', '13701383017', '男', '22', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('51', '荀子', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '26', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('52', '庄子', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '31', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('53', '墨子', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '26', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('54', '惠子', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '26', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('55', '孟子', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '26', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('56', '燕丹', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '31', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('57', '荆轲', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '26', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('58', '高渐离', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '31', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('59', '樊於期', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '26', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('60', '孟尝君', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '26', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('61', '春申君', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '26', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('62', '信陵君', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '26', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('63', '平原君', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '26', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('64', '邹忌', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '26', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('65', '白起', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '26', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('66', '商鞅', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '26', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('67', '李悝', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '26', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('68', '蔺相如', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '26', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('69', '屈原', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '26', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('70', '魏斯', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '26', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('71', '乐羊', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '26', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('72', '西门豹', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '26', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('73', '孔伋', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '26', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('74', '杨朱', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '26', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('75', '聂政', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '26', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('76', '申不害', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '26', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('77', '尸佼', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '26', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('78', '赵武灵王', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '26', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('79', '匡章', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '26', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('80', '淳于髡', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '26', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('81', '张仪', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '26', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('82', '苏秦', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '26', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('83', '田辟疆', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '26', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('84', '田忌', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '26', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('85', '鬼谷子', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '26', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('86', '甘德', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '26', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('87', '石申', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '26', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('88', '李冰', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '26', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('89', '扁鹊', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '26', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('90', '范雎', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '26', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('91', '蔡泽', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '26', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('92', '郭隗', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '26', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('93', '唐蔑', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '26', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('94', '宋玉', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '26', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('95', '触龙', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '26', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('96', '毛遂', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '26', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('97', '鲁仲连', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '26', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('98', '公孙龙', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '26', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('99', '嬴政', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '26', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('100', '吕不韦', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '26', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('101', '李斯', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('102', '尉缭', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('103', '王翦', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('104', '王贲', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('105', '李信', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('106', '蒙骜', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('107', '蒙武', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('108', '蒙恬', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('109', '嬴扶苏', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('110', '嬴胡亥', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('111', '赵高', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('112', '章邯', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('113', '司马欣', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('114', '董翳', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('115', '李由', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('116', '甘罗', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('117', '嫪毐', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('118', '阳泉君', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('119', '嬴子婴', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('120', '嬴成矫', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('121', '徐福', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('122', '卢生', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('123', '陈胜', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('124', '吴广', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('125', '项梁', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('126', '项羽', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('127', '张良', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('128', '韩信', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('129', '萧何', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('130', '刘邦', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('131', '陈平', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('132', '周勃', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('133', '夏侯婴', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('134', '曹参', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('135', '范增', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('136', '项伯', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('137', '项庄', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('138', '樊哙', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('139', '英布', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('140', '彭越', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('141', '熊心', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('142', '龙且', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('143', '郦食其', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('144', '钟离昧', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('145', '周殷', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('146', '灌婴', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('147', '周章', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('148', '魏咎', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('149', '赵歇', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('150', '田儋', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('151', '田臧', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('152', '李归', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('153', '邓说', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('154', '伍徐', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('155', '张贺', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('156', '庄贾', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('157', '朱鸡石', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('158', '余樊君', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('159', '王离', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('160', '陈余', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('161', '张耳', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('162', '宋义', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('163', '涉间', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('164', '苏角', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('165', '李左车', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('166', '田荣', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('167', '殷通', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('168', '刘邦', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('169', '萧何', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('170', '曹参', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('171', '韩信', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('172', '张良', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('173', '英布', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('174', '周勃', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('175', '周亚夫', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('176', '吕雉', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('177', '吕禄', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('178', '吕产', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('179', '陈平', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('180', '灌婴', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('181', '灌夫', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('182', '郅都', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('183', '宁成', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('184', '张汤', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('185', '东方朔', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('186', '刘彻', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('187', '刘启', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('188', '刘安', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('189', '卫青', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('190', '卫子夫', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('191', '霍去病', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('192', '霍光', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('193', '刘贺', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('194', '田蚡', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('195', '窦婴', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('196', '苏建', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('197', '苏武', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('198', '司马相如', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('199', '卓文君', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('200', '司马谈', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('201', '司马迁', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('202', '扬雄', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('203', '李广', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('204', '李陵', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('205', '王莽', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('206', '赵飞燕', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('207', '赵合德', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('208', '刘秀', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('209', '马援', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('210', '邓禹', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('211', '吴汉', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('212', '盖延', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('213', '赵破奴', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('214', '张骞', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('215', '刘细君', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('216', '王昭君', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('217', '梁冀', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('218', '陈蕃', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('219', '窦武', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('220', '何进', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('221', '卢植', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('222', '皇甫嵩', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('223', '朱隽', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('224', '班超', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('225', '班固', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('226', '班昭', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('227', '董卓', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('228', '蔡邕', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('229', '袁绍', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('230', '袁术', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('231', '郑玄', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('232', '张衡', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('233', '贾谊', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('234', '晁错', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('235', '郭解', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('236', '剧孟曹操', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('237', '刘备', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('238', '孙权', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('239', '关羽', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('240', '张飞', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('241', '诸葛亮', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('242', '赵云', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('243', '黄忠', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('244', '马超', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('245', '魏延', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('246', '法正', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('247', '庞统', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('248', '周瑜', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('249', '司马懿', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('250', '徐庶', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('251', '曹丕', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('252', '曹植', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('253', '曹彰', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('254', '郭嘉', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('255', '荀彧', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('256', '荀攸', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('257', '贾诩', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('258', '程昱', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('259', '满宠', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('260', '蒋济', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('261', '韩浩', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('262', '陈群', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('263', '张辽', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('264', '徐晃', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('265', '许褚', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('266', '典韦', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('267', '张郃', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('268', '于禁', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('269', '乐进', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('270', '李典', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('271', '曹仁', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('272', '文聘', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('273', '张燕', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('274', '曹洪', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('275', '曹休', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('276', '曹真', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('277', '夏侯敦', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('278', '夏侯渊', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('279', '夏侯霸', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('280', '夏侯威', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('281', '姜维', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('282', '鲁肃', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('283', '吕蒙', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('284', '陆逊', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('285', '张昭', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('286', '张纮', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('287', '虞翻', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('288', '丁奉', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('289', '徐盛', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('290', '陈武', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('291', '潘璋', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('292', '甘宁', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('293', '太史慈', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('294', '蒋钦', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('295', '周泰', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('296', '董袭', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('297', '骆统', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('298', '廖化', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('299', '马谡', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('300', '王平', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '男', '28', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('301', '蒋琬', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('302', '刘禅', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('303', '孙亮', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('304', '凌统', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('305', '费祎', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('306', '诸葛瑾', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('307', '公孙渊', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('308', '邓艾', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('309', '钟会', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('310', '诸葛恪', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('311', '司马师', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('312', '司马昭', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('313', '孙皓', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('314', '曹髦', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('315', '司马炎', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('316', '司马衷', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('317', '贾充', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('318', '贾南风', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('319', '王祥', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('320', '羊祜', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('321', '王浑', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('322', '王浚', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('323', '陆机', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('324', '陆云', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('325', '周处', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('326', '刘琨', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('327', '谢逖', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('328', '陶侃', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('329', '孙秀', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('330', '刘渊', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('331', '石勒', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('332', '石虎', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('333', '王弥', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('334', '苟晞', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('335', '潘岳', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('336', '石崇', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('337', '左思', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('338', '王览', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('339', '王导', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('340', '嵇康', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('341', '阮籍', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('342', '阮咸', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('343', '刘伶', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('344', '王戎', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('345', '杜预', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('346', '荀勖', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('347', '何曾', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('348', '张华', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('349', '司马攸', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('350', '司马玮', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('351', '司马亮', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('352', '司马伦', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('353', '司马冏', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('354', '司马颖', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('355', '司马颙', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('356', '司马乂', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('357', '司马越', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('358', '段匹磾', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('359', '张寔', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('360', '刘曜', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('361', '刘聪', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('362', '司马睿', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('363', '王羲之', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('364', '王献之', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('365', '桓温', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('366', '谢安', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('367', '谢玄', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('368', '谢道韫', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('369', '桓玄', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('370', '苻坚', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('371', '姚苌', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('372', '慕容垂', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('373', '陶渊明', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('374', '王敦', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('375', '司马道子', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('376', '孙恩', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('377', '谢琰', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('378', '王恭', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('379', '殷仲堪', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('380', '瘐楷', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('381', '卢循', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('382', '徐道覆', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('383', '王猛', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('384', '拓跋珪', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('385', '拓跋嗣', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('386', '拓跋焘', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('387', '元雍', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('388', '元琛', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('389', '元晖', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('390', '法庆', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('391', '尔朱荣', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('392', '郦道元', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('393', '刘裕', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('394', '刘义隆', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('395', '徐羡之', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('396', '傅亮', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('397', '谢晦', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('398', '檀道济', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('399', '刘义康', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('400', '刘湛', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('401', '宇文泰', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('402', '高欢', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('403', '高洋', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('404', '宇文觉', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('405', '高长恭', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('406', '萧道成', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('407', '袁粲', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('408', '褚渊', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('409', '刘秉', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('410', '萧衍', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('411', '萧统', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('412', '陈霸先', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('413', '陈叔宝', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('414', '谢灵运', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('415', '杨大眼', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('416', '元英', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('417', '邢杲', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('418', '万俟丑奴', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('419', '阮孝绪', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('420', '王筠', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('421', '萧宝卷', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('422', '陈庆之', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('423', '萧子云', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('424', '萧子显', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('425', '杨炫之', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('426', '苏绰', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('427', '祖冲之', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('428', '贺拔岳', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('429', '贺拔允', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('430', '贺拔胜', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('431', '侯景', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('432', '魏收', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('433', '王僧辩', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('434', '萧绎', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('435', '庾信', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('436', '宇文护', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('437', '斛律光', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('438', '顾野王', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('439', '江总', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('440', '綦毋怀文', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('441', '颜之推', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('442', '施文庆', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('443', '沈客卿', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('444', '杨坚', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('445', '杨广', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('446', '杨勇', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('447', '翟让', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('448', '李密', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('449', '杨素', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('450', '杨玄感', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('451', '独孤皇后', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('452', '贺若弼', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('453', '韩擒虎', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('454', '牛弘', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('455', '史万岁', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('456', '宇文恺', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('457', '杨玄感', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('458', '宇文述', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('459', '何妥', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('460', '何稠', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('461', '裴矩', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('462', '陈棱', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('463', '宇文化及', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('464', '杨林', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('465', '王世充', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('466', '宇文智及', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('467', '宇文成都', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('468', '阴寿', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('469', '刘焯', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('470', '李春', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('471', '杨俊', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('472', '杨秀', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('473', '杨谅', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('474', '卢思道', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('475', '操天成', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('476', '明克让', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('477', '虞庆', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('478', '郑译', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('479', '梁士彦', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('480', '宇文善', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('481', '窦荣定', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('482', '长孙冕', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('483', '高颖', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('484', '智永禅师', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('485', '伍建章', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('486', '伍云召', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('487', '伍天锡', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('488', '鱼俱罗', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('489', '邱瑞', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('490', '定彦平', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('491', '魏文通', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('492', '新文礼', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('493', '李渊', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('494', '李世民', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('495', '侯君集', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('496', '李靖', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('497', '魏征', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('498', '房玄龄', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('499', '杜如晦', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('500', '柴绍', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('501', '程知节', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('502', '尉迟恭', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('503', '秦琼', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('504', '长孙无忌', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('505', '李存恭', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('506', '封德彝', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('507', '段志玄', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('508', '刘弘基', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('509', '徐世绩', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('510', '李治', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('511', '武则天', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('512', '太平公主', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('513', '韦后', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('514', '李隆基', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('515', '杨玉环', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('516', '王勃', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('517', '陈子昂', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('518', '卢照邻', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('519', '杨炯', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('520', '王之涣', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('521', '安禄山', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('522', '史思明', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('523', '张巡', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('524', '雷万春', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('525', '李白', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('526', '高力士', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('527', '杜甫', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('528', '白居易', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('529', '王维', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('530', '孟浩然', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('531', '杜牧', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('532', '李商隐', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('533', '郭子仪', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('534', '张易之', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('535', '张昌宗', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('536', '来俊臣', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('537', '杨国忠', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('538', '李林甫', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('539', '高适', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('540', '王昌龄', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('541', '孙思邈', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('542', '玄奘', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('543', '鉴真', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('544', '高骈', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('545', '狄仁杰', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('546', '黄巢', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('547', '王仙芝', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('548', '文成公主', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('549', '松赞干布', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('550', '薛涛', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('551', '鱼玄机', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('552', '贺知章', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('553', '李泌', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('554', '韩愈', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('555', '柳宗元', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('556', '上官婉儿 五代十国：朱温', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('557', '刘仁恭', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('558', '丁会', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('559', '李克用', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('560', '李存勖', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('561', '葛从周', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('562', '王建', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('563', '刘知远', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('564', '石敬瑭', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('565', '郭威', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('566', '柴荣', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('567', '孟昶', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('568', '荆浩', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('569', '刘彟', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('570', '张及之', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('571', '杜宇', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('572', '高季兴', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('573', '喻皓', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('574', '历真', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('575', '李茂贞', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('576', '朱友珪', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('577', '朱友贞', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('578', '刘守光', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('579', '卢文进', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('580', '李嗣源', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('581', '冯行袭', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('582', '康义诚', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('583', '薛贻矩', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('584', '朱弘昭', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('585', '冯赟', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('586', '李存孝', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('587', '霍存', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('588', '张归霸', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('589', '张延寿', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('590', '氏叔琮', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('591', '朱瑾', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('592', '朱珍', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('593', '张存敬', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('594', '牛存节', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('595', '李罕之', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('596', '乐从训', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('597', '王师范', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('598', '康怀英', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('599', '王彦章', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('600', '时溥', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('601', '秦宗权', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('602', '史懿', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('603', '苏逢吉', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('604', '杨邡', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('605', '桑维汉', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('606', '耶律德光', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('607', '安重荣', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('608', '边光范', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('609', '袁继忠', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('610', '李筠', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('611', '薛怀让    宋：赵匡胤', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('612', '赵匡义', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('613', '石守信', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('614', '慕容延钊', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('615', '曹彬', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('616', '潘美', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('617', '赵普', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('618', '杨业', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('619', '田重进', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('620', '王禹偁', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('621', '林逋', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('622', '杨延昭', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('623', '杨文广', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('624', '包拯', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('625', '狄青', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('626', '寇准', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('627', '范仲淹', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('628', '司马光', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('629', '欧阳修', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('630', '苏轼', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('631', '苏辙', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('632', '王安石', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('633', '吕惠卿', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('634', '曾布', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('635', '曾巩', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('636', '苏洵', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('637', '宋江', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('638', '方腊', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('639', '岳飞', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('640', '秦桧', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('641', '韩世忠', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('642', '梁红玉', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('643', '赵构', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('644', '朱熹', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('645', '柳永', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('646', '黄庭坚', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('647', '秦观', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('648', '晏殊', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('649', '晏几道', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('650', '陆游', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('651', '辛弃疾', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('652', '魏良臣', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('653', '李清照', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('654', '唐婉', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('655', '史弥远', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('656', '韩佗胄', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('657', '贾似道', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('658', '丁大全', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('659', '文天祥', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('660', '陆秀夫', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('661', '高俅', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('662', '蔡京', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('663', '杨戬', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('664', '童贯', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('665', '张叔夜', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('666', '韩锜', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('667', '岳云', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('668', '张宪', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('669', '梅尧臣', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('670', '苏舜钦', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('671', '吕文焕', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('672', '吕文德', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('673', '杨幺', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('674', '沈括', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('675', '铁木真', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('676', '术赤', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('677', '窝阔台', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('678', '察合台', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('679', '拖雷', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('680', '忽必烈', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('681', '博尔术', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('682', '博尔忽', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('683', '木华黎', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('684', '赤老温', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('685', '欧阳贞', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('686', '关汉卿', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('687', '王实甫', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('688', '白朴', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('689', '郑光祖', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('690', '周德清', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('691', '夏镇', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('692', '蒙哥', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('693', '土土哈', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('694', '床兀儿', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('695', '不花帖木儿', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('696', '燕铁木儿', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('697', '撒敦', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('698', '唐其势', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('699', '泰不花', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('700', '王保保', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('701', '伯颜', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('702', '脱脱', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('703', '陈也先', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('704', '倪云林', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('705', '司居敬', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('706', '速浑察', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('707', '相威', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('708', '黄道婆', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('709', '图帖睦尔', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('710', '雪别台', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('711', '刘杰', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('712', '杨琼', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('713', '郑露', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('714', '明玉珍', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('715', '刘福通', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('716', '陈友谅', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('717', '陈友定', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('718', '张士诚', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('719', '徐寿辉', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('720', '柯九思', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('721', '彭莹玉', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('722', '倪文俊', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('723', '张必先', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('724', '张定边', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('725', '妥欢贴睦尔', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('726', '赵孟頫', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('727', '管道升', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('728', '康里脱脱', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('729', '鲁明善', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('730', '汪汝懋', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('731', '张雨', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('732', '赛典赤·赡思丁', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('733', '盛懋', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('734', '黄公望', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('735', '察罕铁木儿', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('736', '亦黑迭儿丁', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('737', '也里迷失', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('738', '王开', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('739', '朱元璋', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('740', '刘基', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('741', '宋濂', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('742', '高启', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('743', '李善长', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('744', '徐达', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('745', '常遇春', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('746', '邓愈', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('747', '汤和', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('748', '沐英', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('749', '冯胜', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('750', '朱亮祖', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('751', '傅友德', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('752', '朱允炆', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('753', '朱棣', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('754', '郑和', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('755', '铁铉', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('756', '解缙', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('757', '姚广孝', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('758', '王景', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('759', '邹辑', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('760', '唐赛儿', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('761', '唐寅', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('762', '文征明', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('763', '祝枝山', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('764', '周文宾', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('765', '冯梦龙', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('766', '吴承恩', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('767', '汤显祖', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('768', '戚继光', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('769', '严嵩', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('770', '严世蕃', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('771', '胡宗宪', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('772', '俞大猷', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('773', '谭纶', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('774', '海瑞', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('775', '李时珍', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('776', '徐霞客', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('777', '宋应星', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('778', '王守仁', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('779', '高拱', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('780', '张居正', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('781', '冯保', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('782', '徐阶', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('783', '王振', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('784', '刘瑾', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('785', '魏忠贤', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('786', '崇祯皇帝', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('787', '正德皇帝', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('788', '天启皇帝', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('789', '王承恩', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('790', '陈圆圆', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('791', '张献忠', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('792', '李自成', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('793', '熊廷弼', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('794', '孙承宗', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('795', '袁崇焕', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('796', '毛文龙', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('797', '王世贞', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('798', '顾起元', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('799', '何可纲', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('800', '赵率教', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('801', '祖大寿', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('802', '丘睿', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('803', '柳如是', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('804', '李香君', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('805', '邓子龙', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('806', '徐渭', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('807', '王抒', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('808', '杨大中', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('809', '方孝孺', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('810', '齐泰', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('811', '黄子澄', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('812', '皇太极', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('813', '顺治', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('814', '多尔衮', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('815', '孝庄', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('816', '鳌拜', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('817', '索尼', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('818', '苏克萨哈', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('819', '遏必隆', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('820', '康熙', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('821', '洪承畴', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('822', '吴三桂', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('823', '范仁宽', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('824', '纳兰明珠', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('825', '索额图', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('826', '姚启圣', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('827', '施琅', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('828', '尚可喜', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('829', '耿精忠', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('830', '雍正', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('831', '年羹尧', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('832', '隆科多', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('833', '李卫', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('834', '乾隆', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('835', '纪晓岚', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('836', '刘墉', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('837', '和绅', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('838', '和琳', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('839', '阿贵', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('840', '福康安', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('841', '张廷玉', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('842', '周培公', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('843', '熊赐履', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('844', '李光地', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('845', '陈廷敬', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('846', '于成龙', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('847', '南怀仁', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('848', '汤若望', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('849', '林则徐', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('850', '关天培', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('851', '嘉庆', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('852', '道光', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('853', '洪秀全', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('854', '杨秀清', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('855', '萧朝贵', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('856', '冯云山', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('857', '韦昌辉', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('858', '石达开', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('859', '林凤翔', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('860', '李开芳', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('861', '陈玉成', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('862', '李秀成', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('863', '田文镜', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('864', '洪宣娇', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('865', '咸丰', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('866', '同治', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('867', '光绪', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('868', '宣统', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('869', '慈禧', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('870', '慈安', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('871', '奕昕', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('872', '左宗棠', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('873', '曾国藩', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('874', '曾国荃', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('875', '刘永福', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('876', '李鸿章', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('877', '荣禄', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('878', '张之洞', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('879', '李莲英', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('880', '邓世昌', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('881', '丁汝昌', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '1', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('882', '曹雪芹', 'pbkdf2_sha256$36000$7CrFqkOJ6yyH$jzOEhXMrmsq97M5fBtEVouVsnMeu65pc46HGjKsHI4M=', 'ww@qq.com', '13701383017', '女', '30', '0', '2018-05-18 09:08:58.000000', '/static/pics/default/default.jpg');
INSERT INTO `myadmin_users` VALUES ('883', 'admin', 'pbkdf2_sha256$36000$fcYGNFsh8uN0$EOB9vzKl7JNhhvzxgFrjHJhFzx6TpOKP4Hl6AFYmccE=', 'admin@qq.com', '10086', '男', '25', '3', '2018-05-23 12:01:06.226984', '/static/pics/1527677829.623176847702.jpg');
INSERT INTO `myadmin_users` VALUES ('884', 'admin', 'pbkdf2_sha256$36000$pMEctaHeGP1q$FWWkubuSGk6FFuYODBlWH8RdGWzY/9RwL5GKyZN02YY=', 'admin', '12', '男', '12', '2', '2018-05-23 21:09:13.265759', '/static/pics/1527082003.905897939753.ico');
INSERT INTO `myadmin_users` VALUES ('885', 'admin123', 'pbkdf2_sha256$36000$hGFxpRCjMrU7$VQVsMQfEHwHVFdDFJGthOeoQsDvB/IHH75XAizkw7oQ=', '123', '123', '女', '12', '2', '2018-05-23 21:47:59.315314', '/static/pics/default/default.ico');
INSERT INTO `myadmin_users` VALUES ('886', 'admin123', 'pbkdf2_sha256$36000$7Ko6R60MLe4V$Xwqf8FPT/wh1pC15wXViJGbcKfMIoY4Q2BGasPQk4oM=', '123', '123', '男', '12', '2', '2018-05-23 21:48:28.615400', '/static/pics/default/default.ico');
INSERT INTO `myadmin_users` VALUES ('887', '123', 'pbkdf2_sha256$36000$wxEQymGXonph$Qo5brI6v/83FYCaiV9ghwRtJRcov72fSjxZwvhASUQM=', '123', '12', '男', '12', '0', '2018-05-23 21:54:29.534546', '/static/pics/default/default.ico');
INSERT INTO `myadmin_users` VALUES ('888', '123', 'pbkdf2_sha256$36000$zpRkn7OkiLuK$79Xeca03IbxIkjeOZ6yPK7GUHgsLoG8ofNxGxAVj6HI=', '123', '123', '男', '12', '2', '2018-05-23 21:55:51.183337', '/static/pics/1527083751.127197569108.jpg');
INSERT INTO `myadmin_users` VALUES ('889', '1', 'pbkdf2_sha256$36000$djM6HfEy5ZVF$yf+Q+6DDTzRR8d8qIbtKkRaR1UwGxNO/Y0pj3tsNGVg=', '1', '1', '男', '1', '2', '2018-05-23 22:28:39.009424', '/static/pics/1527085718.94955659398.jpg');
INSERT INTO `myadmin_users` VALUES ('890', '1', 'pbkdf2_sha256$36000$kvkQKHuaZ5in$3Ff2jRl+zxMdOpCM8yOtgDG96sY7Wdxmb/jtzsIt+IM=', '1', '1', '男', '1', '2', '2018-05-23 22:29:30.031612', '/static/pics/1527085769.974943243466.jpg');
INSERT INTO `myadmin_users` VALUES ('891', '1', 'pbkdf2_sha256$36000$sp6ZgUOgYbGD$ST3FhfmU1d+mDdmiBJi4RwSNbP/15VNakCNF4rspMx0=', '1', '1', '男', '1', '2', '2018-05-23 22:30:03.889655', '/static/pics/1527085803.835277899059.jpg');
INSERT INTO `myadmin_users` VALUES ('892', 'zhaoshaugncai', 'pbkdf2_sha256$36000$sbUoyt11mRTc$ASH7L5PhzF3t+R/MnMRar5mstGVs77XmNdzqVdwc4E8=', '123456', '123456', '男', '18', '2', '2018-05-23 22:35:35.980488', '/static/pics/default/default.ico');
INSERT INTO `myadmin_users` VALUES ('893', '管理员', 'pbkdf2_sha256$36000$1Op494mAJHdf$qB4oc+S0jT5uCVgoWC7mYVy7maWMWoz7KYTR3dxQw3k=', '123456', '123456', '女', '18', '2', '2018-05-23 22:46:08.799045', '/static/pics/1527086768.745253354497.jpg');
INSERT INTO `myadmin_users` VALUES ('894', 'user001', 'pbkdf2_sha256$36000$mQ0izB4JbVb8$avbVGScbSu6Qbc64S6t+WNpAjPNMn/rPwV5p83qxFtE=', null, null, null, null, '0', '2018-05-24 16:33:36.722292', '/static/pics/default/default.ico');
INSERT INTO `myadmin_users` VALUES ('895', 'aaaa', 'pbkdf2_sha256$36000$sZLyPpu5B7NS$VUimAZd6v81E++E39oh8tZeyIZxPGwKpD7jlA9HLFH0=', 'aaaa@qq.com', '10086', '女', '18', '0', '2018-05-30 19:36:07.365879', '/static/pics/1527680208.931324264138.ico');
INSERT INTO `myadmin_users` VALUES ('896', 'bbb', 'pbkdf2_sha256$36000$qjVHk07FKfEx$ci+5gvmprkvaT9W5m25FFMJH4OQZAhu5yuTKarWO/E8=', 'bbb@qq.com', '10010', '男', '18', '0', '2018-05-31 09:04:11.902503', '/static/pics/1527728740.184522448630.ico');
INSERT INTO `myadmin_users` VALUES ('897', 'ccc', 'pbkdf2_sha256$36000$twxy0e776BF4$iuElAs6hh0YvcOcJgMnUoUX3+dhEXde3aNWeWiSLzoA=', 'ccc@qq.com', '10086', '男', '18', '0', '2018-05-31 09:10:11.796580', '/static/pics/1527730431.571035923193.ico');
INSERT INTO `myadmin_users` VALUES ('898', 'dddd', 'pbkdf2_sha256$36000$jHzQQSn3QpCH$RY/b3ai0lWdoWbE1RbCMIF8jr0RQMVMhIl5R023S8TQ=', 'dddd@qq.com', '10086', '女', '18', '0', '2018-05-31 09:44:13.111765', '/static/pics/1527731113.031046435114.ico');
INSERT INTO `myadmin_users` VALUES ('899', '', 'pbkdf2_sha256$36000$mTTC2GxU9oRj$o7TXrNdP7pNAPR2HXsJqA51Hm32/1rYB7xip3C3VOSU=', '', null, null, null, '0', '2018-05-31 12:46:07.452845', '/static/pics/default/default.ico');
INSERT INTO `myadmin_users` VALUES ('900', 'authuser1', 'pbkdf2_sha256$36000$QxFIn3gfB61t$Dczwi3uraNaY3uvKrGkUIA27tdeKxf7UYZ1f4kKBadE=', 'authuser1@qq.com', null, null, null, '0', '2018-05-31 12:49:53.814906', '/static/pics/default/default.ico');
INSERT INTO `myadmin_users` VALUES ('901', 'authuser2', 'pbkdf2_sha256$36000$HfDHVegs5S3R$gjYRiw3T8JVRFAmWni0DKDiBe0PkHc32ih/JS3m243A=', 'authuser@qq.com', null, null, null, '0', '2018-05-31 13:04:32.094594', '/static/pics/default/default.ico');
INSERT INTO `myadmin_users` VALUES ('902', 'auth001', 'pbkdf2_sha256$36000$iBHn3LEfnqZB$fVJ7Y1AhSIvRH38WGny3vjgAbhclu0bF3FTor2bSTgY=', 'zuth001@qq.com', null, null, null, '0', '2018-05-31 13:10:21.261880', '/static/pics/default/default.ico');
INSERT INTO `myadmin_users` VALUES ('903', 'ceshi1', 'pbkdf2_sha256$36000$n9eihSKXQ8en$zu72+aWSv/She5giMKR281TlrUDuFSQovp1vgkz3vgc=', null, null, '男', null, '0', '2018-05-31 16:18:57.124012', '/static/pics/default/default.ico');
INSERT INTO `myadmin_users` VALUES ('904', 'ceshi2', 'pbkdf2_sha256$36000$n9eihSKXQ8en$zu72+aWSv/She5giMKR281TlrUDuFSQovp1vgkz3vgc=', 'ceshi2@qq.come', '10086', '男', '18', '0', '2018-05-31 16:28:16.859639', '/static/pics/1527865703.732670834646.jpg');
INSERT INTO `myadmin_users` VALUES ('905', 'ceshi3', 'pbkdf2_sha256$36000$7lJNVeI2plUa$4e13PUVAAWi1U4xlKYMJnhCSN1tmPVR39zZ2dirPQy8=', 'ceshi3@qq.com', '10086', '女', '16', '0', '2018-05-31 16:35:42.257557', '/static/pics/1527755771.124360343021.ico');
INSERT INTO `myadmin_users` VALUES ('906', 'ceshi100', 'pbkdf2_sha256$36000$ViUqY7K9iqUN$AdP/mLH1uGuURmjC3aPU3jNG+i7OUzg723NlJPsdw/I=', null, null, '男', null, '0', '2018-06-01 08:22:54.891678', '/static/pics/default/default.ico');

-- ----------------------------
-- Table structure for myadmin_users1
-- ----------------------------
DROP TABLE IF EXISTS `myadmin_users1`;
CREATE TABLE `myadmin_users1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(77) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `sex` varchar(1) NOT NULL,
  `age` int(11) NOT NULL,
  `picurl` varchar(100) NOT NULL,
  `status` int(11) NOT NULL,
  `addtime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of myadmin_users1
-- ----------------------------
INSERT INTO `myadmin_users1` VALUES ('1', '张三', 'pbkdf2_sha256$36000$RnCYHZlaf8Vj$nAMo8EMv+K4YcugZNA5h1SLrz5UgL4swIvJd7OHwi40=', 'zs@qq.com', '110', '男', '10', '/static/pics/default/default.ico', '0', '2018-05-17 22:41:44.355839');
INSERT INTO `myadmin_users1` VALUES ('2', '光头强', 'pbkdf2_sha256$36000$iB2oFvoeP2eV$egd0vVLHDqVU1jt9fUH3KSusNJ502i6rKSPkKKMchDs=', 'gtq@qq.com', '120', '男', '20', '/static/pics/1526568337.931006434255.jpg', '0', '2018-05-17 22:45:38.041150');
INSERT INTO `myadmin_users1` VALUES ('3', '红兔', 'pbkdf2_sha256$36000$q09l4wInZpXv$ioGx1XtErnCy0XTMTeIWhRXTE3IQTrehl2n5gjrtmZ0=', 'ht@qq.com', '1212', '女', '18', '/static/pics/1526568421.474302534703.jpg', '0', '2018-05-17 22:47:01.545731');
INSERT INTO `myadmin_users1` VALUES ('4', '李四', 'pbkdf2_sha256$36000$zgR3vF1otSZI$Sqt61MrvHK6wzdJJJaNIbeMfqTUtwwRLrOXKh0/QJWA=', 'ls@qq.com', '10000', '女', '18', '/static/pics/1526575645.96867417762.jpg', '0', '2018-05-17 23:08:01.841280');
