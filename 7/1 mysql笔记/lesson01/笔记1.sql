
-- 使用mysql命令连接MySQL数据库
[root@localhost local]# mysql -h localhost -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 3
Server version: 5.5.48-log Source distribution

Copyright (c) 2000, 2016, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql>

-- 省略-h，默认localhost连接MySQL数据库
[root@localhost local]# mysql -u root -p123456
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 5
Server version: 5.5.48-log Source distribution

Copyright (c) 2000, 2016, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> 



-- 数据库操作
--===========================================================
-- 查看当前MySQL下的所有数据库
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| test               |
+--------------------+
4 rows in set (0.00 sec)

-- 创建一个mydb2的数据库
mysql> create database mydb2;
Query OK, 1 row affected (0.01 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mydb2              |
| mysql              |
| performance_schema |
| test               |
+--------------------+
5 rows in set (0.00 sec)

-- 删除数据库mydb2
mysql> drop database mydb2;
Query OK, 0 rows affected (0.04 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| test               |
+--------------------+
4 rows in set (0.00 sec)

mysql> 
-- 创建一个mydb数据库
mysql> create database mydb;
Query OK, 1 row affected (0.00 sec)

-- 再次常见mydb数据库会报错
mysql> create database mydb;
ERROR 1007 (HY000): Can''t create database 'mydb'; database exists

-- 尝试创建mydb数据库（若已存在则会报一个警告，不会报Error错误）
mysql> create database if not exists  mydb;
Query OK, 1 row affected, 1 warning (0.00 sec)

-- 查看mydb的建库语句
mysql> show create database mydb;
+----------+---------------------------------------------------------------+
| Database | Create Database                                               |
+----------+---------------------------------------------------------------+
| mydb     | CREATE DATABASE `mydb` /*!40100 DEFAULT CHARACTER SET utf8 */ |
+----------+---------------------------------------------------------------+
1 row in set (0.00 sec)

mysql> show create database mydb\G
*************************** 1. row ***************************
       Database: mydb
Create Database: CREATE DATABASE `mydb` /*!40100 DEFAULT CHARACTER SET utf8 */
1 row in set (0.00 sec)

-- 查看当前所有数据库位置：NULL表示没有在任何数据库中
mysql> select database();
+------------+
| database() |
+------------+
| NULL       |
+------------+
1 row in set (0.00 sec)

-- 选择进入mydb数据库
mysql> use mydb;
Database changed

-- 查看当前所在数据库的位置
mysql> select database();
+------------+
| database() |
+------------+
| mydb       |
+------------+
1 row in set (0.00 sec)

mysql> 


-- 数据表操作
--============================================
-- 查看当前数据库中的所有表
mysql> show tables;
Empty set (0.00 sec)

-- 创建一个uu表，内有三个字段id，name和age
mysql> create table uu(id int,name varchar(16),age int);
Query OK, 0 rows affected (0.09 sec)

-- 创建一个tt表，内有三个字段id，name和age
mysql> create table tt(
    -> id int,
    -> name varchar(16),
    -> age int
    -> );
Query OK, 0 rows affected (0.06 sec)

-- 查看当前库中有两个表
mysql> show tables;
+----------------+
| Tables_in_mydb |
+----------------+
| tt             |
| uu             |
+----------------+
2 rows in set (0.00 sec)

-- 查看uu表的表结构
mysql> desc uu;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| id    | int(11)     | YES  |     | NULL    |       |
| name  | varchar(16) | YES  |     | NULL    |       |
| age   | int(11)     | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

-- 查看uu表的建表语句
mysql> show create table uu\G
*************************** 1. row ***************************
       Table: uu
Create Table: CREATE TABLE `uu` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(16) DEFAULT NULL,
  `age` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8
1 row in set (0.00 sec)

-- 删除uu表
mysql> drop table uu;
Query OK, 0 rows affected (0.02 sec)

--查看库中的表
mysql> show tables;
+----------------+
| Tables_in_mydb |
+----------------+
| tt             |
+----------------+
1 row in set (0.00 sec)



--数据操作
--=============================================
mysql> desc uu; --查看表结构
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| id    | int(11)     | YES  |     | NULL    |       |
| name  | varchar(16) | YES  |     | NULL    |       |
| age   | int(11)     | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
3 rows in set (0.01 sec)

-- 添加一个数据，给定所有字段，所有的值
mysql> insert into uu(id,name,age) values(1,'zhangsan',20);
Query OK, 1 row affected (0.01 sec)

mysql> insert into uu(id,name,age) values(2,'lisi',22);
Query OK, 1 row affected (0.02 sec)

-- 不指定字段，添加值，值按默认顺序写
mysql> insert into uu values(3,'wangwu',25);
Query OK, 1 row affected (0.01 sec)

-- 批量添加值
mysql> insert into uu values(4,'zhaoliu',21),
    -> (5,'xiaoli',22),
    -> (6,'xiaozhang',19);
Query OK, 3 rows affected (0.05 sec)
Records: 3  Duplicates: 0  Warnings: 0

-- 查看uu表的所有数据
mysql> select * from uu;
+------+-----------+------+
| id   | name      | age  |
+------+-----------+------+
|    1 | zhangsan  |   20 |
|    2 | lisi      |   22 |
|    3 | wangwu    |   25 |
|    4 | zhaoliu   |   21 |
|    5 | xiaoli    |   22 |
|    6 | xiaozhang |   19 |
+------+-----------+------+
6 rows in set (0.00 sec)

-- 查看uu表中的name和age字段的所有数据
mysql> select name,age from uu;
+-----------+------+
| name      | age  |
+-----------+------+
| zhangsan  |   20 |
| lisi      |   22 |
| wangwu    |   25 |
| zhaoliu   |   21 |
| xiaoli    |   22 |
| xiaozhang |   19 |
+-----------+------+
6 rows in set (0.00 sec)

mysql> select * from uu;
+------+-----------+------+
| id   | name      | age  |
+------+-----------+------+
|    1 | zhangsan  |   20 |
|    2 | lisi      |   22 |
|    3 | wangwu    |   25 |
|    4 | zhaoliu   |   21 |
|    5 | xiaoli    |   22 |
|    6 | xiaozhang |   19 |
+------+-----------+------+
6 rows in set (0.00 sec)

-- 将id值为4的信息age改为30（修改）
mysql> update uu set age=30 where id=4;
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from uu;
+------+-----------+------+
| id   | name      | age  |
+------+-----------+------+
|    1 | zhangsan  |   20 |
|    2 | lisi      |   22 |
|    3 | wangwu    |   25 |
|    4 | zhaoliu   |   30 |
|    5 | xiaoli    |   22 |
|    6 | xiaozhang |   19 |
+------+-----------+------+
6 rows in set (0.00 sec)

-- 删除id为5的所有信息
mysql> delete from uu where id=5;
Query OK, 1 row affected (0.01 sec)

mysql> select * from uu;
+------+-----------+------+
| id   | name      | age  |
+------+-----------+------+
|    1 | zhangsan  |   20 |
|    2 | lisi      |   22 |
|    3 | wangwu    |   25 |
|    4 | zhaoliu   |   30 |
|    6 | xiaozhang |   19 |
+------+-----------+------+
5 rows in set (0.00 sec)

mysql> 

-- 数据类型：数值类型
--====================================
mysql> create table m1(
    -> id int unsigned auto_increment primary key,
    -> age tinyint unsigned,
    -> num tinyint,
    -> n1 int(4),
    -> n2 int(6) zerofill);
Query OK, 0 rows affected (0.05 sec)

mysql> desc m1;
+-------+--------------------------+------+-----+---------+----------------+
| Field | Type                     | Null | Key | Default | Extra          |
+-------+--------------------------+------+-----+---------+----------------+
| id    | int(10) unsigned         | NO   | PRI | NULL    | auto_increment |
| age   | tinyint(3) unsigned      | YES  |     | NULL    |                |
| num   | tinyint(4)               | YES  |     | NULL    |                |
| n1    | int(4)                   | YES  |     | NULL    |                |
| n2    | int(6) unsigned zerofill | YES  |     | NULL    |                |
+-------+--------------------------+------+-----+---------+----------------+
5 rows in set (0.00 sec)

mysql> insert into m1 values(1,88,-20,12345,5678);
Query OK, 1 row affected (0.05 sec)

mysql> select * from m1;
+----+------+------+-------+--------+
| id | age  | num  | n1    | n2     |
+----+------+------+-------+--------+
|  1 |   88 |  -20 | 12345 | 005678 |
+----+------+------+-------+--------+
1 row in set (0.00 sec)

mysql> insert into m1 values(2,300,128,32434,12345678);
Query OK, 1 row affected, 2 warnings (0.05 sec)

mysql> select * from m1;
+----+------+------+-------+----------+
| id | age  | num  | n1    | n2       |
+----+------+------+-------+----------+
|  1 |   88 |  -20 | 12345 |   005678 |
|  2 |  255 |  127 | 32434 | 12345678 |
+----+------+------+-------+----------+
2 rows in set (0.00 sec)

mysql> insert into m1 values(2,23,34,100,34);
ERROR 1062 (23000): Duplicate entry '2' for key 'PRIMARY'
mysql> insert into m1 values(null,23,34,100,34);
Query OK, 1 row affected (0.04 sec)

mysql> select * from m1;
+----+------+------+-------+----------+
| id | age  | num  | n1    | n2       |
+----+------+------+-------+----------+
|  1 |   88 |  -20 | 12345 |   005678 |
|  2 |  255 |  127 | 32434 | 12345678 |
|  3 |   23 |   34 |   100 |   000034 |
+----+------+------+-------+----------+
3 rows in set (0.00 sec)


-- 子串类型实例
--=====================================
mysql> create table m2(
    -> c1 char(8),
    -> c2 varchar(8),
    -> c3 text,
    -> c4 enum('y','n') not null default 'y'
    -> );
Query OK, 0 rows affected (0.05 sec)

mysql> desc m2;
+-------+---------------+------+-----+---------+-------+
| Field | Type          | Null | Key | Default | Extra |
+-------+---------------+------+-----+---------+-------+
| c1    | char(8)       | YES  |     | NULL    |       |
| c2    | varchar(8)    | YES  |     | NULL    |       |
| c3    | text          | YES  |     | NULL    |       |
| c4    | enum('y','n') | NO   |     | y       |       |
+-------+---------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> insert into m2 values('qwertyqwerwqe','qwerqwedsa','we','n');
Query OK, 1 row affected, 2 warnings (0.05 sec)

mysql> select * from m2;
+----------+----------+------+----+
| c1       | c2       | c3   | c4 |
+----------+----------+------+----+
| qwertyqw | qwerqwed | we   | n  |
+----------+----------+------+----+
1 row in set (0.00 sec)

mysql> insert into m2(c1,c2) values('abc','bcd');
Query OK, 1 row affected (0.06 sec)

mysql> select * from m2;
+----------+----------+------+----+
| c1       | c2       | c3   | c4 |
+----------+----------+------+----+
| qwertyqw | qwerqwed | we   | n  |
| abc      | bcd      | NULL | y  |
+----------+----------+------+----+
2 rows in set (0.00 sec)





-- 时间日期类型
--==================================================
mysql> create table m3(
    -> d1 date,
    -> d2 datetime,
    -> d3 timestamp);
Query OK, 0 rows affected (0.11 sec)

mysql> desc m3;
+-------+-----------+------+-----+-------------------+-----------------------------+
| Field | Type      | Null | Key | Default           | Extra                       |
+-------+-----------+------+-----+-------------------+-----------------------------+
| d1    | date      | YES  |     | NULL              |                             |
| d2    | datetime  | YES  |     | NULL              |                             |
| d3    | timestamp | NO   |     | CURRENT_TIMESTAMP | on update CURRENT_TIMESTAMP |
+-------+-----------+------+-----+-------------------+-----------------------------+
3 rows in set (0.00 sec)
mysql> insert into m3 values('2017-09-25',now(),current_timestamp());
Query OK, 1 row affected (0.06 sec)

mysql> select * from m3;
+------------+---------------------+---------------------+
| d1         | d2                  | d3                  |
+------------+---------------------+---------------------+
| 2017-09-25 | 2017-08-03 15:10:37 | 2017-08-03 15:10:37 |
+------------+---------------------+---------------------+
1 row in set (0.00 sec)




-- 表操作实战
--=================================================================
mysql> create table stu(
    -> id int unsigned not null auto_increment primary key,
    -> name varchar(8) not null unique,
    -> age tinyint unsigned,
    -> sex enum('m','w') not null default 'm',
    -> classid char(8)
    -> );
Query OK, 0 rows affected (0.05 sec)

--表结构说明：
-- id 整型int 无符号 非空 自增 主键约束
-- name 可变子串8个长度，非空 唯一性约束
-- age 非常小整型，无符号约束
-- sex 性别枚举类型m或w值，非空，默认值m
-- classid 定长子串8个长度

mysql> desc stu;
+---------+---------------------+------+-----+---------+----------------+
| Field   | Type                | Null | Key | Default | Extra          |
+---------+---------------------+------+-----+---------+----------------+
| id      | int(10) unsigned    | NO   | PRI | NULL    | auto_increment |
| name    | varchar(8)          | NO   | UNI | NULL    |                |
| age     | tinyint(3) unsigned | YES  |     | NULL    |                |
| sex     | enum('m','w')       | NO   |     | m       |                |
| classid | char(6)             | YES  |     | NULL    |                |
+---------+---------------------+------+-----+---------+----------------+
5 rows in set (0.00 sec)


mysql> show create table stu\G
*************************** 1. row ***************************
       Table: stu
Create Table: CREATE TABLE `stu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(8) NOT NULL,
  `age` tinyint(3) unsigned DEFAULT NULL,
  `sex` enum('w','m') NOT NULL DEFAULT 'm',
  `classid` char(8) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
1 row in set (0.01 sec)

mysql>



-- 数据库备份与恢复

-- 备份mydb数据库，使用mydb.sql文件存储
[root@localhost bin]# mysqldump -u root -p mydb > mydb.sql

-- 备份mydb数据库中的stu表，使用mydb.sql文件存储
[root@localhost bin]# mysqldump -u root -p mydb stu > mydb_stu.sql

-- 恢复mydb数据信息（条件是mydb库存在）
[root@localhost bin]# mysql -u root -p mydb < mydb.sql



-- 修改表结构实例
--===============================================
mysql> show create table tt\G
*************************** 1. row ***************************
       Table: tt
Create Table: CREATE TABLE `tt` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(16) DEFAULT NULL,
  `age` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8
1 row in set (0.00 sec)

mysql> desc tt;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| id    | int(11)     | YES  |     | NULL    |       |
| name  | varchar(16) | YES  |     | NULL    |       |
| age   | int(11)     | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

--1. 在tt表末尾添加一个phone字段，类型varchar(11)，无其他约束
mysql> alter table tt add phone varchar(11);

--2. 在tt表中age字段后添加一个address字段，类型varchar(100) ，无其他约束
mysql> alter table tt add address varchar(100) after age;

--3. 在tt表首位插入一个mm字段，类型int
mysql> alter table tt add mm int first;
mysql> desc tt;
+---------+--------------+------+-----+---------+-------+
| Field   | Type         | Null | Key | Default | Extra |
+---------+--------------+------+-----+---------+-------+
| mm      | int(11)      | YES  |     | NULL    |       |
| id      | int(11)      | YES  |     | NULL    |       |
| name    | varchar(16)  | YES  |     | NULL    |       |
| age     | int(11)      | YES  |     | NULL    |       |
| address | varchar(100) | YES  |     | NULL    |       |
| phone   | varchar(11)  | YES  |     | NULL    |       |
+---------+--------------+------+-----+---------+-------+
6 rows in set (0.01 sec)

--4. 删除tt表的mm字段
mysql> alter table tt drop mm;

--5. 修改字段：tt表age字段类型改为tinyint类型，unsigned not null default 20
mysql> alter table tt modify age tinyint unsigned not null default 20; 

--6. 修改name字段名为username
mysql> alter table tt change name username varchar(16);
Query OK, 0 rows affected (0.11 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc tt;
+----------+---------------------+------+-----+---------+-------+
| Field    | Type                | Null | Key | Default | Extra |
+----------+---------------------+------+-----+---------+-------+
| id       | int(11)             | YES  |     | NULL    |       |
| username | varchar(16)         | YES  |     | NULL    |       |
| age      | tinyint(3) unsigned | NO   |     | 20      |       |
| address  | varchar(100)        | YES  |     | NULL    |       |
| phone    | varchar(11)         | YES  |     | NULL    |       |
+----------+---------------------+------+-----+---------+-------+
5 rows in set (0.00 sec)






 
