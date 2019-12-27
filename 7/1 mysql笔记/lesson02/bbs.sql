/*
SQLyog 企业版 - MySQL GUI v7.14 
MySQL - 5.5.5-10.1.13-MariaDB : Database - mydb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*Table structure for table `reply` */

DROP TABLE IF EXISTS `reply`;

CREATE TABLE `reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned DEFAULT NULL,
  `content` text,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `reply` */

insert  into `reply`(`id`,`tid`,`uid`,`content`,`addtime`) values (1,1,2,'真的很辛苦！都是累啊','2017-09-10 13:23:45'),(2,1,4,'一转眼过得真快！','2017-09-10 18:23:45'),(3,2,3,'时间过得挺快，工作也比较顺利！','2017-09-11 19:23:45'),(4,2,1,'到现在还没找到工作，正在努力充电中','2017-09-11 22:23:45'),(5,1,5,'大好青春就这样没有了。','2017-09-11 23:03:23'),(6,3,3,'很重要，靠他拿学位啊，不得不考。','2017-09-12 14:23:45'),(7,3,6,'其实很好过。没有难度','2017-09-12 18:23:45'),(8,1,6,'时间过得太快啦','2017-09-12 19:23:15'),(9,4,1,'一般我不信风水的','2017-09-13 18:23:45'),(10,4,5,'同意楼上，还是要靠自己的努力。','2017-09-13 19:23:35'),(11,5,2,'没有准备好就别选择创意','2017-09-14 23:23:55'),(12,5,3,'不同意楼上观点，要看又有创意。','2017-09-15 08:23:45'),(13,6,1,'学编程语言，建议python','2017-09-15 10:23:45'),(14,3,1,'这个很头疼，英语不好。','2017-09-15 12:23:45'),(15,3,2,'感觉一般。考不考都可以','2017-09-16 11:23:45');

/*Table structure for table `topic` */

DROP TABLE IF EXISTS `topic`;

CREATE TABLE `topic` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `uid` int(10) unsigned DEFAULT NULL,
  `content` text,
  `topicread` int(10) unsigned NOT NULL DEFAULT '0',
  `istop` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `topic` */

insert  into `topic`(`id`,`title`,`uid`,`content`,`topicread`,`istop`,`addtime`) values (1,'工作十年',2,'我2007年本科毕业，普通院校二本，学的市场营销专业，四年下来，不知道学到什么了，云里雾里得就毕业了。 毕业后许多人考虑五年规划，考虑十年规划，选择城市，选择行业。我没有过多考虑，一是没有很精明的头脑规划自己，二是老公那会儿已经先我一年毕业工作了的，我理所当然得投奔过来，有了现成住处，只需要找份喜欢的工作。',134,0,'2017-09-10 12:23:45'),(2,'毕业一年，大家过着怎样的生活',1,'毕业一年，大家过着怎样的生活?大家都可以说说',246,1,'2017-09-11 18:23:45'),(3,'英语四级真的很重要吗？',5,'本人自认为自己天生在英语方面是“学弱”，从大一开始到现在大三了，四级一共考了4次了，最高分才380.我为了四级也已经呕心沥血，认真搞过自习，每次失败我也在反省，是不是学习方法不对，我也在改，但每次考试就是成绩不见好。每次考试出成绩都被同学笑的要死，别人都不搞复习的都比我高，我也知道英语是可以啃老本，但是我那么努力的在赶，怎么就是没点起色呢？',29,0,'2017-09-12 08:03:45'),(4,'为什么工资一直涨不了？速度进来',3,'风声雨声读书声声声入耳，家事国事天下事事事关心。家是人们生活中最重要的空间。因此，家居环境与风水一向是人们所关心的话题。下面我们来看看阳宅风水中外形吉凶的十大吉宅。\r\n　　1.前狭后宽居之稳，富贵平安旺子孙。资财广有人口吉，金珠财宝满家门。\r\n　　译意：前狭后宽的地形造屋居住必安稳，主富贵平安子孙兴旺；资产富有人口吉祥，金银财宝充满家门。\r\n　　2.前后高山两相宜，左右两边有沙池。家豪富贵多年代，寿命延年彭祖齐。\r\n　　译意：高山两相结合为好，左右两边又有水池砂，这样的宅形主家势显赫，富贵代代相传，与彭祖一样高寿。\r\n　　3.此宅后边有高岗，南下居之第一强。子孙兴旺田蚕胜，岁岁年年有陈粮。\r\n　　译意：这种屋宅后边有高大秀丽的山岗，北高南低的地方是最适合居住的。主子孙兴旺发达，年年有余。\r\n　　4.中央正面四面高，修盖中宅福有余。牛羊六畜多兴旺，家道富贵出英豪。\r\n　　译意：中央正面四面地形高而秀丽，在此修建盖房主福有余。牛羊六畜又多又兴旺，家运富贵子孙多英豪。\r\n　　5.宅前林木在两傍，乾有丘埠艮有冈。若居此地家豪富，后代儿孙显名杨。\r\n　　译意：宅前林木分布两侧边，西北（乾）方有丘陵，东北（艮）方有山岗，居住在这种地方主家道富贵，后代子孙富贵又声名显赫。\r\n　　6.朱元龙虎四神全，男人富贵女人贤。官禄不求而自至，后代儿孙福远年。',180,0,'2017-09-13 15:43:23'),(5,'现在创业好难啊',2,'从学校出来找工作 没经验没单位要 索性自己出来创业 在淘宝开了一鞋店 已经半年了 一点生意都没有 好难做啊 希望大家有空来小店坐坐 给我增加点人气 由于不能发广告 小店名字是 爱尚精品鞋店 欢迎大家',3456,1,'2017-09-14 16:23:45'),(6,'现在学什么技术好一些？',3,'现在学什么技术好一些 ？',20,0,'2017-09-14 18:23:25');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(32) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `phone` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`id`,`email`,`password`,`name`,`phone`) values (1,'zhangsan@163.com','202cb962ac59075b964b07152d234b70','张三丰','13432423423'),(2,'lisi@sohu.com','e10adc3949ba59abbe56e057f20f883e','李四','13466587533'),(3,'wangwu@126.com','202cb962ac59075b964b07152d234b70','王五','13456784565'),(4,'zhaoliu@163.com','1c104b9c0accfca52ef21728eaf01453','赵六','13234534345'),(5,'wangyue@qq.com','e10adc3949ba59abbe56e057f20f883e','王月','13456678678'),(6,'luling@126.com','202cb962ac59075b964b07152d234b70','陆玲','13245345434');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
