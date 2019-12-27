mysql> select * from stu;
+----+-----------+------+-----+---------+
| id | name      | age  | sex | classid |
+----+-----------+------+-----+---------+
|  1 | zhangsan  |   20 | w   |       1 |
|  2 | lisi      |   25 | m   |       2 |
|  3 | wangwu    |   22 | w   |       5 |
|  4 | zhaoliu   |   21 | m   |       4 |
|  5 | uu01      |   27 | w   |       1 |
|  6 | uu02      |   25 | m   |       2 |
|  7 | uu03      |   28 | w   |       2 |
|  8 | uu05      |   22 | m   |       4 |
|  9 | xiaoli    |   29 | w   |       2 |
| 10 | xiaozhang |   19 | w   |       1 |
| 11 | xiaoyan   |   22 | m   |       2 |
| 12 | xiaoxin   |   28 | w   |       4 |
| 13 | wangwen   |   27 | w   |       2 |
| 14 | zhangle   |   29 | m   |       5 |
+----+-----------+------+-----+---------+
14 rows in set (0.00 sec)

mysql> create table stu2 like stu;
Query OK, 0 rows affected (0.10 sec)

mysql> desc stu;
+---------+---------------------+------+-----+---------+----------------+
| Field   | Type                | Null | Key | Default | Extra          |
+---------+---------------------+------+-----+---------+----------------+
| id      | int(10) unsigned    | NO   | PRI | NULL    | auto_increment |
| name    | varchar(16)         | NO   | UNI | NULL    |                |
| age     | tinyint(3) unsigned | YES  |     | NULL    |                |
| sex     | enum('w','m')       | NO   |     | w       |                |
| classid | int(10) unsigned    | YES  |     | NULL    |                |
+---------+---------------------+------+-----+---------+----------------+
5 rows in set (0.00 sec)

mysql> desc stu2;
+---------+---------------------+------+-----+---------+----------------+
| Field   | Type                | Null | Key | Default | Extra          |
+---------+---------------------+------+-----+---------+----------------+
| id      | int(10) unsigned    | NO   | PRI | NULL    | auto_increment |
| name    | varchar(16)         | NO   | UNI | NULL    |                |
| age     | tinyint(3) unsigned | YES  |     | NULL    |                |
| sex     | enum('w','m')       | NO   |     | w       |                |
| classid | int(10) unsigned    | YES  |     | NULL    |                |
+---------+---------------------+------+-----+---------+----------------+
5 rows in set (0.00 sec)

mysql> select * from stu2;
Empty set (0.01 sec)

mysql> insert into stu2 select * from stu limit 5;
Query OK, 5 rows affected (0.05 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from stu2;
+----+----------+------+-----+---------+
| id | name     | age  | sex | classid |
+----+----------+------+-----+---------+
|  1 | zhangsan |   20 | w   |       1 |
|  2 | lisi     |   25 | m   |       2 |
|  3 | wangwu   |   22 | w   |       5 |
|  4 | zhaoliu  |   21 | m   |       4 |
|  5 | uu01     |   27 | w   |       1 |
+----+----------+------+-----+---------+
5 rows in set (0.00 sec)

mysql> desc stu;
+---------+---------------------+------+-----+---------+----------------+
| Field   | Type                | Null | Key | Default | Extra          |
+---------+---------------------+------+-----+---------+----------------+
| id      | int(10) unsigned    | NO   | PRI | NULL    | auto_increment |
| name    | varchar(16)         | NO   | UNI | NULL    |                |
| age     | tinyint(3) unsigned | YES  |     | NULL    |                |
| sex     | enum('w','m')       | NO   |     | w       |                |
| classid | int(10) unsigned    | YES  |     | NULL    |                |
+---------+---------------------+------+-----+---------+----------------+
5 rows in set (0.00 sec)

mysql> create index index_age on stu(age);
Query OK, 0 rows affected (0.09 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc stu;
+---------+---------------------+------+-----+---------+----------------+
| Field   | Type                | Null | Key | Default | Extra          |
+---------+---------------------+------+-----+---------+----------------+
| id      | int(10) unsigned    | NO   | PRI | NULL    | auto_increment |
| name    | varchar(16)         | NO   | UNI | NULL    |                |
| age     | tinyint(3) unsigned | YES  | MUL | NULL    |                |
| sex     | enum('w','m')       | NO   |     | w       |                |
| classid | int(10) unsigned    | YES  |     | NULL    |                |
+---------+---------------------+------+-----+---------+----------------+
5 rows in set (0.01 sec)

mysql> drop index index_age on stu;
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc stu;
+---------+---------------------+------+-----+---------+----------------+
| Field   | Type                | Null | Key | Default | Extra          |
+---------+---------------------+------+-----+---------+----------------+
| id      | int(10) unsigned    | NO   | PRI | NULL    | auto_increment |
| name    | varchar(16)         | NO   | UNI | NULL    |                |
| age     | tinyint(3) unsigned | YES  |     | NULL    |                |
| sex     | enum('w','m')       | NO   |     | w       |                |
| classid | int(10) unsigned    | YES  |     | NULL    |                |
+---------+---------------------+------+-----+---------+----------------+
5 rows in set (0.01 sec)

mysql> alter table stu add index index_age(age);
Query OK, 0 rows affected (0.09 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc stu;
+---------+---------------------+------+-----+---------+----------------+
| Field   | Type                | Null | Key | Default | Extra          |
+---------+---------------------+------+-----+---------+----------------+
| id      | int(10) unsigned    | NO   | PRI | NULL    | auto_increment |
| name    | varchar(16)         | NO   | UNI | NULL    |                |
| age     | tinyint(3) unsigned | YES  | MUL | NULL    |                |
| sex     | enum('w','m')       | NO   |     | w       |                |
| classid | int(10) unsigned    | YES  |     | NULL    |                |
+---------+---------------------+------+-----+---------+----------------+
5 rows in set (0.00 sec)

mysql> drop index index_age on stu;
Query OK, 0 rows affected (0.05 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> 
mysql> select * from stu order by age desc limit 3;
+----+---------+------+-----+---------+
| id | name    | age  | sex | classid |
+----+---------+------+-----+---------+
| 14 | zhangle |   29 | m   |       5 |
|  9 | xiaoli  |   29 | w   |       2 |
| 12 | xiaoxin |   28 | w   |       4 |
+----+---------+------+-----+---------+
3 rows in set (0.00 sec)

mysql> create view vstu as select * from stu order by age desc limit 3;
Query OK, 0 rows affected (0.05 sec)

mysql> select * from vstu;
+----+---------+------+-----+---------+
| id | name    | age  | sex | classid |
+----+---------+------+-----+---------+
| 14 | zhangle |   29 | m   |       5 |
|  9 | xiaoli  |   29 | w   |       2 |
| 12 | xiaoxin |   28 | w   |       4 |
+----+---------+------+-----+---------+
3 rows in set (0.00 sec)

mysql> select * from vstu;
+----+---------+------+-----+---------+
| id | name    | age  | sex | classid |
+----+---------+------+-----+---------+
| 14 | zhangle |   29 | m   |       5 |
|  9 | xiaoli  |   29 | w   |       2 |
| 12 | xiaoxin |   28 | w   |       4 |
+----+---------+------+-----+---------+
3 rows in set (0.00 sec)

mysql> select * from vstu where sex="w";
+----+---------+------+-----+---------+
| id | name    | age  | sex | classid |
+----+---------+------+-----+---------+
|  9 | xiaoli  |   29 | w   |       2 |
| 12 | xiaoxin |   28 | w   |       4 |
+----+---------+------+-----+---------+
2 rows in set (0.00 sec)

mysql> select * from stu;
+----+-----------+------+-----+---------+
| id | name      | age  | sex | classid |
+----+-----------+------+-----+---------+
|  1 | zhangsan  |   20 | w   |       1 |
|  2 | lisi      |   25 | m   |       2 |
|  3 | wangwu    |   22 | w   |       5 |
|  4 | zhaoliu   |   21 | m   |       4 |
|  5 | uu01      |   27 | w   |       1 |
|  6 | uu02      |   25 | m   |       2 |
|  7 | uu03      |   28 | w   |       2 |
|  8 | uu05      |   22 | m   |       4 |
|  9 | xiaoli    |   29 | w   |       2 |
| 10 | xiaozhang |   19 | w   |       1 |
| 11 | xiaoyan   |   22 | m   |       2 |
| 12 | xiaoxin   |   28 | w   |       4 |
| 13 | wangwen   |   27 | w   |       2 |
| 14 | zhangle   |   29 | m   |       5 |
+----+-----------+------+-----+---------+
14 rows in set (0.00 sec)

mysql> update stu set age=39 where id=10;
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from vstu;
+----+-----------+------+-----+---------+
| id | name      | age  | sex | classid |
+----+-----------+------+-----+---------+
| 10 | xiaozhang |   39 | w   |       1 |
|  9 | xiaoli    |   29 | w   |       2 |
| 14 | zhangle   |   29 | m   |       5 |
+----+-----------+------+-----+---------+
3 rows in set (0.00 sec)

mysql> show tables;
+----------------+
| Tables_in_mydb |
+----------------+
| classes        |
| d1             |
| d2             |
| d3             |
| dd             |
| news           |
| ntype          |
| stu            |
| stu2           |
| type           |
| uu             |
| vstu           |
+----------------+
12 rows in set (0.00 sec)

mysql> drop table vstu;
ERROR 1051 (42S02): Unknown table 'vstu'
mysql> drop view vstu;
Query OK, 0 rows affected (0.00 sec)

mysql> 
--随机函数的应用
mysql> select * from type order by rand() desc limit 3;
+------+-----------+------+
| id   | name      | pid  |
+------+-----------+------+
|    9 | 食品      |    0 |
|    8 | 童装      |    1 |
|   12 | 休闲装    |    1 |
+------+-----------+------+
3 rows in set (0.52 sec)

mysql> select * from type order by rand() desc limit 3;
+------+--------+------+
| id   | name   | pid  |
+------+--------+------+
|    4 | 手机   |    2 |
|    7 | 女装   |    1 |
|    9 | 食品   |    0 |
+------+--------+------+
3 rows in set (0.00 sec)

mysql> select *,rand() from type order by rand() desc limit mit 3;
+------+--------+------+--------------------+
| id   | name   | pid  | rand()             |
+------+--------+------+--------------------+
|    5 | 相机   |    2 | 0.9624774539493746 |
|    2 | 数码   |    0 | 0.9208985110008144 |
|   11 | 特产   |    9 | 0.7281597077177462 |
+------+--------+------+--------------------+
3 rows in set (0.00 sec)



mysql> set autocommit=0;
Query OK, 0 rows affected (0.00 sec)

mysql> delete from stu where classid=0;
Query OK, 1 row affected (0.00 sec)

mysql> delete from stu where id>10;
Query OK, 4 rows affected (0.07 sec)

mysql> select * from stu;
+----+----------+------+-----+---------+
| id | name     | age  | sex | classid |
+----+----------+------+-----+---------+
|  1 | zhangsan |   20 | w   |       1 |
|  2 | lisi     |   25 | m   |       2 |
|  3 | wangwu   |   22 | w   |       5 |
|  4 | zhaoliu  |   21 | m   |       4 |
|  5 | uu01     |   27 | w   |       1 |
|  6 | uu02     |   25 | m   |       2 |
|  7 | uu03     |   28 | w   |       2 |
|  8 | uu05     |   22 | m   |       4 |
|  9 | xiaoli   |   29 | w   |       2 |
+----+----------+------+-----+---------+
9 rows in set (0.00 sec)

mysql> update stu sex='m';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '='m'' at line 1
mysql> update stu set sex='m';
Query OK, 5 rows affected (0.00 sec)
Rows matched: 9  Changed: 5  Warnings: 0

mysql> select * from stu;
+----+----------+------+-----+---------+
| id | name     | age  | sex | classid |
+----+----------+------+-----+---------+
|  1 | zhangsan |   20 | m   |       1 |
|  2 | lisi     |   25 | m   |       2 |
|  3 | wangwu   |   22 | m   |       5 |
|  4 | zhaoliu  |   21 | m   |       4 |
|  5 | uu01     |   27 | m   |       1 |
|  6 | uu02     |   25 | m   |       2 |
|  7 | uu03     |   28 | m   |       2 |
|  8 | uu05     |   22 | m   |       4 |
|  9 | xiaoli   |   29 | m   |       2 |
+----+----------+------+-----+---------+
9 rows in set (0.00 sec)

mysql> rollback;
Query OK, 0 rows affected (0.01 sec)

mysql> select * from stu;
+----+-----------+------+-----+---------+
| id | name      | age  | sex | classid |
+----+-----------+------+-----+---------+
|  1 | zhangsan  |   20 | w   |       1 |
|  2 | lisi      |   25 | m   |       2 |
|  3 | wangwu    |   22 | w   |       5 |
|  4 | zhaoliu   |   21 | m   |       4 |
|  5 | uu01      |   27 | w   |       1 |
|  6 | uu02      |   25 | m   |       2 |
|  7 | uu03      |   28 | w   |       2 |
|  8 | uu05      |   22 | m   |       4 |
|  9 | xiaoli    |   29 | w   |       2 |
| 10 | xiaozhang |   22 | w   |       0 |
| 11 | xiaoyan   |   22 | m   |       2 |
| 12 | xiaoxin   |   28 | w   |       4 |
| 13 | wangwen   |   27 | w   |       2 |
| 14 | zhangle   |   29 | m   |       5 |
+----+-----------+------+-----+---------+
14 rows in set (0.00 sec)

mysql> commit;
Query OK, 0 rows affected (0.00 sec)

mysql> rollback;


