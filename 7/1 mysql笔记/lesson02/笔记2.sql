
-- 一。 数据的增、删、改，查
--===============================================================================
mysql> desc stu;
+---------+---------------------+------+-----+---------+----------------+
| Field   | Type                | Null | Key | Default | Extra          |
+---------+---------------------+------+-----+---------+----------------+
| id      | int(10) unsigned    | NO   | PRI | NULL    | auto_increment |
| name    | varchar(8)          | NO   | UNI | NULL    |                |
| age     | tinyint(3) unsigned | YES  |     | NULL    |                |
| sex     | enum('w','m')       | NO   |     | m       |                |
| classid | char(8)             | YES  |     | NULL    |                |
+---------+---------------------+------+-----+---------+----------------+
5 rows in set (0.03 sec)

-- 1. 添加：
-- 格式：insert into 表名[(字段列表)] values(值列表)[,(值列表)...]
--============================================================================
-- 标准添加sql，指定所有字段，给定所有的值
mysql> insert into stu(id,name,age,sex,classid) values(1,'zhangsan',20,'m','python03');
Query OK, 1 row affected (0.08 sec)

-- 指定部分字段，给定部分值添加
mysql> insert into stu(name,age,classid) values('lisi',22,'python02');
Query OK, 1 row affected (0.02 sec)

-- 不指定字段添加值（注意顺序和个数）
mysql> insert into stu values(null,'wangwu',25,'w','python03');
Query OK, 1 row affected (0.01 sec)

mysql> select * from stu;
+----+----------+------+-----+----------+
| id | name     | age  | sex | classid  |
+----+----------+------+-----+----------+
|  1 | zhangsan |   20 | m   | python03 |
|  2 | lisi     |   22 | m   | python02 |
|  3 | wangwu   |   25 | w   | python03 |
+----+----------+------+-----+----------+
3 rows in set (0.00 sec)

-- 批量添加值
mysql> insert into stu values
    -> (null,'xiaoli',28,'m','python02'),
    -> (null,'xiaozhang',21,'w','python01'),
    -> (null,'xiaozhao',27,'m','python03'),
    -> (null,'uu01',18,'m','python03');
Query OK, 4 rows affected, 1 warning (0.02 sec)
Records: 4  Duplicates: 0  Warnings: 1

mysql> select * from stu;
+----+----------+------+-----+----------+
| id | name     | age  | sex | classid  |
+----+----------+------+-----+----------+
|  1 | zhangsan |   20 | m   | python03 |
|  2 | lisi     |   22 | m   | python02 |
|  3 | wangwu   |   25 | w   | python03 |
|  4 | xiaoli   |   28 | m   | python02 |
|  5 | xiaozhan |   21 | w   | python01 |
|  6 | xiaozhao |   27 | m   | python03 |
|  7 | uu01     |   18 | m   | python03 |
|  8 | uu02     | NULL | m   | NULL     |
|  9 | uu03     | NULL | m   | NULL     |
| 10 | uu04     | NULL | m   | NULL     |
| 11 | uu06     | NULL | m   | NULL     |
| 12 | uu08     | NULL | m   | NULL     |
+----+----------+------+-----+----------+
12 rows in set (0.00 sec)


-- 2. 删除数据
-- 格式： delete from 表名 [where 条件 [分组、排序、limit]]
--==================================================================
-- 删除id为20的信息
mysql> delete from stu where id=20;
Query OK, 0 rows affected (0.00 sec)

-- 删除id大于100的所有信息
mysql> delete from stu where id>100;
Query OK, 0 rows affected (0.00 sec)

-- 删除id是100~200的所有信息
mysql> delete from stu where id between 100 and 200;
--等价于
mysql> delete from stu where id>=100 and id<=200;
Query OK, 0 rows affected (0.00 sec)

-- 删除性别为w，年龄大于25的所有信息
mysql> delete from stu where sex='w' and age>25;
Query OK, 0 rows affected (0.00 sec)


--3. 修改数据
-- 格式：update 表名 set 字段名1=值1[,字段名2=值2,...] [where 条件...]
--============================================================================
-- 将id为9和11 的年龄age改为23，班级classid改为python03
 mysql> update stu set age=23,classid='python03' where id in(9,11);
Query OK, 2 rows affected (0.08 sec)
Rows matched: 2  Changed: 2  Warnings: 0

mysql> select * from stu;
+----+----------+------+-----+----------+
| id | name     | age  | sex | classid  |
+----+----------+------+-----+----------+
|  1 | zhangsan |   20 | m   | python03 |
|  2 | lisi     |   22 | m   | python02 |
|  3 | wangwu   |   25 | w   | python03 |
|  4 | xiaoli   |   28 | m   | python02 |
|  5 | xiaozhan |   21 | w   | python01 |
|  6 | xiaozhao |   27 | m   | python03 |
|  7 | uu01     |   18 | m   | python03 |
|  8 | uu02     | NULL | m   | NULL     |
|  9 | uu03     |   23 | m   | python03 |
| 10 | uu04     | NULL | m   | NULL     |
| 11 | uu06     |   23 | m   | python03 |
| 12 | uu08     | NULL | m   | NULL     |
+----+----------+------+-----+----------+
12 rows in set (0.00 sec)

-- 将id为8,10和12 的年龄age改为26，班级classid改为python02
mysql> update stu set age=26,classid='python02' where id in(8,10,12);
Query OK, 3 rows affected (0.02 sec)
Rows matched: 3  Changed: 3  Warnings: 0

mysql> select * from stu;
+----+----------+------+-----+----------+
| id | name     | age  | sex | classid  |
+----+----------+------+-----+----------+
|  1 | zhangsan |   20 | m   | python03 |
|  2 | lisi     |   22 | m   | python02 |
|  3 | wangwu   |   25 | w   | python03 |
|  4 | xiaoli   |   28 | m   | python02 |
|  5 | xiaozhan |   21 | w   | python01 |
|  6 | xiaozhao |   27 | m   | python03 |
|  7 | uu01     |   18 | m   | python03 |
|  8 | uu02     |   26 | m   | python02 |
|  9 | uu03     |   23 | m   | python03 |
| 10 | uu04     |   26 | m   | python02 |
| 11 | uu06     |   23 | m   | python03 |
| 12 | uu08     |   26 | m   | python02 |
+----+----------+------+-----+----------+
12 rows in set (0.00 sec)

mysql> update stu set sex='w' where id in(8,11,12);
Query OK, 3 rows affected (0.05 sec)
Rows matched: 3  Changed: 3  Warnings: 0

mysql> select * from stu;
+----+----------+------+-----+----------+
| id | name     | age  | sex | classid  |
+----+----------+------+-----+----------+
|  1 | zhangsan |   20 | m   | python03 |
|  2 | lisi     |   22 | m   | python02 |
|  3 | wangwu   |   25 | w   | python03 |
|  4 | xiaoli   |   28 | m   | python02 |
|  5 | xiaozhan |   21 | w   | python01 |
|  6 | xiaozhao |   27 | m   | python03 |
|  7 | uu01     |   18 | m   | python03 |
|  8 | uu02     |   26 | w   | python02 |
|  9 | uu03     |   23 | m   | python03 |
| 10 | uu04     |   26 | m   | python02 |
| 11 | uu06     |   23 | w   | python03 |
| 12 | uu08     |   26 | w   | python02 |
+----+----------+------+-----+----------+
12 rows in set (0.00 sec)

mysql>
mysql> update stu set age=age-2 where id=15;
Query OK, 1 row affected (0.05 sec)
Rows matched: 1  Changed: 1  Warnings: 0


-- 4. 查询
--===================================================
mysql> select * from stu;
+----+----------+------+-----+----------+
| id | name     | age  | sex | classid  |
+----+----------+------+-----+----------+
|  1 | zhangsan |   20 | m   | python03 |
|  2 | lisi     |   22 | m   | python02 |
|  3 | wangwu   |   25 | w   | python03 |
|  4 | xiaoli   |   28 | m   | python02 |
|  5 | xiaozhan |   21 | w   | python01 |
|  6 | xiaozhao |   27 | m   | python03 |
|  7 | uu01     |   18 | m   | python03 |
|  8 | uu02     |   26 | w   | python02 |
|  9 | uu03     |   23 | m   | python03 |
| 10 | uu04     |   26 | m   | python02 |
| 11 | uu06     |   23 | w   | python03 |
| 12 | uu08     |   26 | w   | python02 |
| 13 | qq06     | NULL | m   | NULL     |
| 14 | qq01     |   31 | m   | python01 |
| 15 | qq03     |   33 | m   | python01 |
+----+----------+------+-----+----------+
15 rows in set (0.00 sec)

mysql> select id,name,age from stu;
+----+----------+------+
| id | name     | age  |
+----+----------+------+
|  1 | zhangsan |   20 |
|  2 | lisi     |   22 |
|  3 | wangwu   |   25 |
|  4 | xiaoli   |   28 |
|  5 | xiaozhan |   21 |
|  6 | xiaozhao |   27 |
|  7 | uu01     |   18 |
|  8 | uu02     |   26 |
|  9 | uu03     |   23 |
| 10 | uu04     |   26 |
| 11 | uu06     |   23 |
| 12 | uu08     |   26 |
| 13 | qq06     | NULL |
| 14 | qq01     |   31 |
| 15 | qq03     |   33 |
+----+----------+------+
15 rows in set (0.00 sec)

mysql> select id,name as username,age from stu;
+----+----------+------+
| id | username | age  |
+----+----------+------+
|  1 | zhangsan |   20 |
|  2 | lisi     |   22 |
|  3 | wangwu   |   25 |
|  4 | xiaoli   |   28 |
|  5 | xiaozhan |   21 |
|  6 | xiaozhao |   27 |
|  7 | uu01     |   18 |
|  8 | uu02     |   26 |
|  9 | uu03     |   23 |
| 10 | uu04     |   26 |
| 11 | uu06     |   23 |
| 12 | uu08     |   26 |
| 13 | qq06     | NULL |
| 14 | qq01     |   31 |
| 15 | qq03     |   33 |
+----+----------+------+
15 rows in set (0.01 sec)

mysql> select id,name username,age from stu;
+----+----------+------+
| id | username | age  |
+----+----------+------+
|  1 | zhangsan |   20 |
|  2 | lisi     |   22 |
|  3 | wangwu   |   25 |
|  4 | xiaoli   |   28 |
|  5 | xiaozhan |   21 |
|  6 | xiaozhao |   27 |
|  7 | uu01     |   18 |
|  8 | uu02     |   26 |
|  9 | uu03     |   23 |
| 10 | uu04     |   26 |
| 11 | uu06     |   23 |
| 12 | uu08     |   26 |
| 13 | qq06     | NULL |
| 14 | qq01     |   31 |
| 15 | qq03     |   33 |
+----+----------+------+
15 rows in set (0.00 sec)

mysql> select *,age+5 age5 from stu;
+----+----------+------+-----+----------+------+
| id | name     | age  | sex | classid  | age5 |
+----+----------+------+-----+----------+------+
|  1 | zhangsan |   20 | m   | python03 |   25 |
|  2 | lisi     |   22 | m   | python02 |   27 |
|  3 | wangwu   |   25 | w   | python03 |   30 |
|  4 | xiaoli   |   28 | m   | python02 |   33 |
|  5 | xiaozhan |   21 | w   | python01 |   26 |
|  6 | xiaozhao |   27 | m   | python03 |   32 |
|  7 | uu01     |   18 | m   | python03 |   23 |
|  8 | uu02     |   26 | w   | python02 |   31 |
|  9 | uu03     |   23 | m   | python03 |   28 |
| 10 | uu04     |   26 | m   | python02 |   31 |
| 11 | uu06     |   23 | w   | python03 |   28 |
| 12 | uu08     |   26 | w   | python02 |   31 |
| 13 | qq06     | NULL | m   | NULL     | NULL |
| 14 | qq01     |   31 | m   | python01 |   36 |
| 15 | qq03     |   33 | m   | python01 |   38 |
+----+----------+------+-----+----------+------+
15 rows in set (0.01 sec)

mysql> select *,'beijing' as city from stu;
+----+----------+------+-----+----------+---------+
| id | name     | age  | sex | classid  | city    |
+----+----------+------+-----+----------+---------+
|  1 | zhangsan |   20 | m   | python03 | beijing |
|  2 | lisi     |   22 | m   | python02 | beijing |
|  3 | wangwu   |   25 | w   | python03 | beijing |
|  4 | xiaoli   |   28 | m   | python02 | beijing |
|  5 | xiaozhan |   21 | w   | python01 | beijing |
|  6 | xiaozhao |   27 | m   | python03 | beijing |
|  7 | uu01     |   18 | m   | python03 | beijing |
|  8 | uu02     |   26 | w   | python02 | beijing |
|  9 | uu03     |   23 | m   | python03 | beijing |
| 10 | uu04     |   26 | m   | python02 | beijing |
| 11 | uu06     |   23 | w   | python03 | beijing |
| 12 | uu08     |   26 | w   | python02 | beijing |
| 13 | qq06     | NULL | m   | NULL     | beijing |
| 14 | qq01     |   31 | m   | python01 | beijing |
| 15 | qq03     |   33 | m   | python01 | beijing |
+----+----------+------+-----+----------+---------+
15 rows in set (0.00 sec)

mysql> select *,'beijing' city from stu;
+----+----------+------+-----+----------+---------+
| id | name     | age  | sex | classid  | city    |
+----+----------+------+-----+----------+---------+
|  1 | zhangsan |   20 | m   | python03 | beijing |
|  2 | lisi     |   22 | m   | python02 | beijing |
|  3 | wangwu   |   25 | w   | python03 | beijing |
|  4 | xiaoli   |   28 | m   | python02 | beijing |
|  5 | xiaozhan |   21 | w   | python01 | beijing |
|  6 | xiaozhao |   27 | m   | python03 | beijing |
|  7 | uu01     |   18 | m   | python03 | beijing |
|  8 | uu02     |   26 | w   | python02 | beijing |
|  9 | uu03     |   23 | m   | python03 | beijing |
| 10 | uu04     |   26 | m   | python02 | beijing |
| 11 | uu06     |   23 | w   | python03 | beijing |
| 12 | uu08     |   26 | w   | python02 | beijing |
| 13 | qq06     | NULL | m   | NULL     | beijing |
| 14 | qq01     |   31 | m   | python01 | beijing |
| 15 | qq03     |   33 | m   | python01 | beijing |
+----+----------+------+-----+----------+---------+
15 rows in set (0.01 sec)

mysql> select concat(classid,":",name) from stu;
+--------------------------+
| concat(classid,":",name) |
+--------------------------+
| python03:zhangsan        |
| python02:lisi            |
| python03:wangwu          |
| python02:xiaoli          |
| python01:xiaozhan        |
| python03:xiaozhao        |
| python03:uu01            |
| python02:uu02            |
| python03:uu03            |
| python02:uu04            |
| python03:uu06            |
| python02:uu08            |
| NULL                     |
| python01:qq01            |
| python01:qq03            |
+--------------------------+
15 rows in set (0.00 sec)

mysql> 

-- where条件查询

--1. 查询班级为python03期的所有学生信息
mysql> select * from stu where classid='python03';

--2. 查询班级为python03期，并且性别为m的所有学生信息
mysql> select * from stu where classid='python03' and sex="m";

--3. 查询年龄大于20，性别为w的所有信息
mysql> select * from stu where age>20 and sex='w';

--4. 查询年龄是20~25的所有信息
mysql> select * from stu where age>=20 and age<=25;
mysql> select * from stu where age between 20 and 25;

--5. 查询年龄不在20~25的学生信息
mysql> select * from stu where age<20 or age>25;
mysql> select * from stu where age not between 20 and 25;

--6. 查询id号为1,3,5,7,9的学生信息
mysql> select * from stu where id in(1,3,5,7,9);

--7. 查询classid不为null所有信息 
mysql> select * from stu where classid is not null;

--8. 查询班级为python01和python02期所有男生（sex='m'）信息
mysql> select * from stu where (classid='python01' or classid='python02') and sex='m';
mysql> select * from stu where classid in('python01','python02') and sex='m';

--9. 查询姓名中含有an子串的所有信息
-- like 模糊查询，支持俩个特殊符号：'%'和'_'   %表示任意数量的任意字符， _表示任意一位字符
mysql> select * from stu where name like '%an%';
mysql> select * from stu where name regexp 'an';


--10. 查询姓名是有4位任意小写字符或数字构成的信息
mysql> select * from stu where name like '____';
mysql> select * from stu where name regexp '^[a-z0-9]{4}$';


-- 统计函数（聚合函数）max() min() sum() avg() count()
-- 获取最大年龄，最小年龄，年龄总和，平均年龄，总计条数
mysql> select max(age),min(age),sum(age),avg(age),count(id) from stu;
+----------+----------+----------+----------+-----------+
| max(age) | min(age) | sum(age) | avg(age) | count(id) |
+----------+----------+----------+----------+-----------+
|       33 |       18 |      371 |  24.7333 |        15 |
+----------+----------+----------+----------+-----------+
1 row in set (0.01 sec)

-- group by 字段名   分组


-- 按性别sex分组，并统计人数
mysql> select sex,count(*) from stu group by sex;
+-----+----------+
| sex | count(*) |
+-----+----------+
| w   |        5 |
| m   |       10 |
+-----+----------+
2 rows in set (0.00 sec)

-- 按班级分组统计每个班级的人数（排除班级信息为null的数据）
mysql> select classid,count(*) from stu where classid is not null  group by classid;
+----------+----------+
| classid  | count(*) |
+----------+----------+
| python01 |        3 |
| python02 |        5 |
| python03 |        6 |
+----------+----------+
3 rows in set (0.00 sec)

-- 按班级分组，并统计每个班级的男生和女生人数（排除班级信息为null的数据）
mysql> select classid,sex,count(*) from stu where classid is not null  group by classid,sex;
+----------+-----+----------+
| classid  | sex | count(*) |
+----------+-----+----------+
| python01 | w   |        1 |
| python01 | m   |        2 |
| python02 | w   |        2 |
| python02 | m   |        3 |
| python03 | w   |        2 |
| python03 | m   |        4 |
+----------+-----+----------+
6 rows in set (0.00 sec)

-- 在上面的查询中，加入过滤条件(人数大于等于3的信息）
mysql> select classid,sex,count(*) num from stu where classid is not null  group by classid,sex having num>=3;
+----------+-----+-----+
| classid  | sex | num |
+----------+-----+-----+
| python02 | m   |   3 |
| python03 | m   |   4 |
+----------+-----+-----+
2 rows in set (0.00 sec)


-- 排序：order by 字段名 asc(默认升序)|desc（降序）
-------------------------------------------------------------
mysql> select * from stu order by age;
+----+----------+------+-----+----------+
| id | name     | age  | sex | classid  |
+----+----------+------+-----+----------+
|  7 | uu01     |   18 | m   | python03 |
|  1 | zhangsan |   20 | m   | python03 |
|  5 | xiaozhan |   21 | w   | python01 |
|  2 | lisi     |   22 | m   | python02 |
| 13 | qq06     |   22 | m   | NULL     |
| 11 | uu06     |   23 | w   | python03 |
|  9 | uu03     |   23 | m   | python03 |
|  3 | wangwu   |   25 | w   | python03 |
| 12 | uu08     |   26 | w   | python02 |
| 10 | uu04     |   26 | m   | python02 |
|  8 | uu02     |   26 | w   | python02 |
|  6 | xiaozhao |   27 | m   | python03 |
|  4 | xiaoli   |   28 | m   | python02 |
| 14 | qq01     |   31 | m   | python01 |
| 15 | qq03     |   33 | m   | python01 |
+----+----------+------+-----+----------+
15 rows in set (0.00 sec)

mysql> select * from stu order by age asc;
+----+----------+------+-----+----------+
| id | name     | age  | sex | classid  |
+----+----------+------+-----+----------+
|  7 | uu01     |   18 | m   | python03 |
|  1 | zhangsan |   20 | m   | python03 |
|  5 | xiaozhan |   21 | w   | python01 |
|  2 | lisi     |   22 | m   | python02 |
| 13 | qq06     |   22 | m   | NULL     |
| 11 | uu06     |   23 | w   | python03 |
|  9 | uu03     |   23 | m   | python03 |
|  3 | wangwu   |   25 | w   | python03 |
| 12 | uu08     |   26 | w   | python02 |
| 10 | uu04     |   26 | m   | python02 |
|  8 | uu02     |   26 | w   | python02 |
|  6 | xiaozhao |   27 | m   | python03 |
|  4 | xiaoli   |   28 | m   | python02 |
| 14 | qq01     |   31 | m   | python01 |
| 15 | qq03     |   33 | m   | python01 |
+----+----------+------+-----+----------+
15 rows in set (0.00 sec)

mysql> select * from stu order by age desc;
+----+----------+------+-----+----------+
| id | name     | age  | sex | classid  |
+----+----------+------+-----+----------+
| 15 | qq03     |   33 | m   | python01 |
| 14 | qq01     |   31 | m   | python01 |
|  4 | xiaoli   |   28 | m   | python02 |
|  6 | xiaozhao |   27 | m   | python03 |
| 12 | uu08     |   26 | w   | python02 |
| 10 | uu04     |   26 | m   | python02 |
|  8 | uu02     |   26 | w   | python02 |
|  3 | wangwu   |   25 | w   | python03 |
|  9 | uu03     |   23 | m   | python03 |
| 11 | uu06     |   23 | w   | python03 |
| 13 | qq06     |   22 | m   | NULL     |
|  2 | lisi     |   22 | m   | python02 |
|  5 | xiaozhan |   21 | w   | python01 |
|  1 | zhangsan |   20 | m   | python03 |
|  7 | uu01     |   18 | m   | python03 |
+----+----------+------+-----+----------+
15 rows in set (0.00 sec)

mysql> select * from stu order by classid desc;
+----+----------+------+-----+----------+
| id | name     | age  | sex | classid  |
+----+----------+------+-----+----------+
|  1 | zhangsan |   20 | m   | python03 |
|  3 | wangwu   |   25 | w   | python03 |
| 11 | uu06     |   23 | w   | python03 |
|  6 | xiaozhao |   27 | m   | python03 |
|  7 | uu01     |   18 | m   | python03 |
|  9 | uu03     |   23 | m   | python03 |
| 12 | uu08     |   26 | w   | python02 |
| 10 | uu04     |   26 | m   | python02 |
|  8 | uu02     |   26 | w   | python02 |
|  4 | xiaoli   |   28 | m   | python02 |
|  2 | lisi     |   22 | m   | python02 |
|  5 | xiaozhan |   21 | w   | python01 |
| 14 | qq01     |   31 | m   | python01 |
| 15 | qq03     |   33 | m   | python01 |
| 13 | qq06     |   22 | m   | NULL     |
+----+----------+------+-----+----------+
15 rows in set (0.00 sec)

mysql> select * from stu order by classid asc;
+----+----------+------+-----+----------+
| id | name     | age  | sex | classid  |
+----+----------+------+-----+----------+
| 13 | qq06     |   22 | m   | NULL     |
| 15 | qq03     |   33 | m   | python01 |
| 14 | qq01     |   31 | m   | python01 |
|  5 | xiaozhan |   21 | w   | python01 |
| 12 | uu08     |   26 | w   | python02 |
| 10 | uu04     |   26 | m   | python02 |
|  8 | uu02     |   26 | w   | python02 |
|  4 | xiaoli   |   28 | m   | python02 |
|  2 | lisi     |   22 | m   | python02 |
|  7 | uu01     |   18 | m   | python03 |
|  9 | uu03     |   23 | m   | python03 |
|  6 | xiaozhao |   27 | m   | python03 |
| 11 | uu06     |   23 | w   | python03 |
|  3 | wangwu   |   25 | w   | python03 |
|  1 | zhangsan |   20 | m   | python03 |
+----+----------+------+-----+----------+
15 rows in set (0.01 sec)

mysql> select * from stu order by classid asc,age desc;
+----+----------+------+-----+----------+
| id | name     | age  | sex | classid  |
+----+----------+------+-----+----------+
| 13 | qq06     |   22 | m   | NULL     |
| 15 | qq03     |   33 | m   | python01 |
| 14 | qq01     |   31 | m   | python01 |
|  5 | xiaozhan |   21 | w   | python01 |
|  4 | xiaoli   |   28 | m   | python02 |
| 12 | uu08     |   26 | w   | python02 |
| 10 | uu04     |   26 | m   | python02 |
|  8 | uu02     |   26 | w   | python02 |
|  2 | lisi     |   22 | m   | python02 |
|  6 | xiaozhao |   27 | m   | python03 |
|  3 | wangwu   |   25 | w   | python03 |
|  9 | uu03     |   23 | m   | python03 |
| 11 | uu06     |   23 | w   | python03 |
|  1 | zhangsan |   20 | m   | python03 |
|  7 | uu01     |   18 | m   | python03 |
+----+----------+------+-----+----------+
15 rows in set (0.00 sec)

mysql> 

--获取部分数据：limit
-- 分页公式： limit (页号-1)*页大小,页大小
--------------------------------------------------
mysql> select * from stu limit 0,3;
+----+----------+------+-----+----------+
| id | name     | age  | sex | classid  |
+----+----------+------+-----+----------+
|  1 | zhangsan |   20 | m   | python03 |
|  2 | lisi     |   22 | m   | python02 |
|  3 | wangwu   |   25 | w   | python03 |
+----+----------+------+-----+----------+
3 rows in set (0.00 sec)

mysql> select * from stu limit 3,3;
+----+----------+------+-----+----------+
| id | name     | age  | sex | classid  |
+----+----------+------+-----+----------+
|  4 | xiaoli   |   28 | m   | python02 |
|  5 | xiaozhan |   21 | w   | python01 |
|  6 | xiaozhao |   27 | m   | python03 |
+----+----------+------+-----+----------+
3 rows in set (0.01 sec)

mysql> select * from stu limit 6,3;
+----+------+------+-----+----------+
| id | name | age  | sex | classid  |
+----+------+------+-----+----------+
|  7 | uu01 |   18 | m   | python03 |
|  8 | uu02 |   26 | w   | python02 |
|  9 | uu03 |   23 | m   | python03 |
+----+------+------+-----+----------+
3 rows in set (0.00 sec)

mysql> select * from stu limit 9,3;
+----+------+------+-----+----------+
| id | name | age  | sex | classid  |
+----+------+------+-----+----------+
| 10 | uu04 |   26 | m   | python02 |
| 11 | uu06 |   23 | w   | python03 |
| 12 | uu08 |   26 | w   | python02 |
+----+------+------+-----+----------+
3 rows in set (0.00 sec)


-- 综合查询练习

--1. 查询python03期所有学员，按年龄降序排序
mysql> select * from stu where classid='python03' order by age desc;

--2. 查询python03期，年龄最大的3位学员信息
mysql> select * from stu where classid='python03' order by age desc limit 3;

--3. 统计每个班级人数，并按人数降序排序（排除班级信息为null的数据）
mysql> select classid,count(*) m from stu where classid is not null group by classid order by m desc;

--4. 统计每个班级年龄在20~30的学员人数信息，并按人数降序排序（排除班级信息为null的数据）
mysql> select classid,count(*) m from stu where classid is not null and age between 20 and 30
    -> group by classid order by m desc
    
--5. 统计每个班级男女生人数最多3条记录信息。（排除班级信息为null的数据）
mysql> select classid,sex,count(*) m from stu where classid is not null
    -> group by classid,sex order by m desc limit 3;
    
    
    
-- 多表查询：
--====================================================
-- 1. 嵌套查询 （一个查询的结果是另外查询的条件）

-- 2. where关联查询

-- 3. join连接查询：内联inner join，左联 left join，右联right join

-- 1. 嵌套查询：
-------------------------------------------------------------------------------------
-- 查询年龄最大的学生信息
mysql> select * from stu where age=(select max(age) from stu);
+----+------+------+-----+----------+
| id | name | age  | sex | classid  |
+----+------+------+-----+----------+
| 15 | qq03 |   33 | m   | python01 |
+----+------+------+-----+----------+
1 row in set (0.00 sec)

-- 查询帖子标题为'工作十年'的发帖人信息
mysql> select * from users where id in(select uid from topic where title='工作十年');
+----+---------------+----------------------------------+--------+-------------+
| id | email         | password                         | name   | phone       |
+----+---------------+----------------------------------+--------+-------------+
|  2 | lisi@sohu.com | e10adc3949ba59abbe56e057f20f883e | 李四   | 13466587533 |
+----+---------------+----------------------------------+--------+-------------+
1 row in set (0.00 sec)

-- 2. where关联查询
----------------------------------------------------------------
-- 查询帖子信息，并关联发帖人姓名信息
mysql> select t.id,t.title,t.addtime,u.name from topic t,users u where t.uid=u.id;
+----+-----------------------------------------------+---------------------+-----------+
| id | title                                         | addtime             | name      |
+----+-----------------------------------------------+---------------------+-----------+
|  1 | 工作十年                                      | 2017-09-10 12:23:45 | 李四      |
|  2 | 毕业一年，大家过着怎样的生活                  | 2017-09-11 18:23:45 | 张三丰    |
|  3 | 英语四级真的很重要吗？                        | 2017-09-12 08:03:45 | 王月      |
|  4 | 为什么工资一直涨不了？速度进来                | 2017-09-13 15:43:23 | 王五      |
|  5 | 现在创业好难啊                                | 2017-09-14 16:23:45 | 李四      |
|  6 | 现在学什么技术好一些？                        | 2017-09-14 18:23:25 | 王五      |
+----+-----------------------------------------------+---------------------+-----------+
6 rows in set (0.00 sec)

-- 使用where管理，统计每个用户的发帖量信息
mysql> select u.id,u.name,count(*)  from users u,topic t where u.id=t.uid group by u.id;
+----+-----------+----------+
| id | name      | count(*) |
+----+-----------+----------+
|  1 | 张三丰    |        1 |
|  2 | 李四      |        2 |
|  3 | 王五      |        2 |
|  5 | 王月      |        1 |
+----+-----------+----------+
4 rows in set (0.00 sec)

mysql> select u.id,u.name,count(*) num  from users u,topic t where u.id=t.uid group by u.id order by num desc limit 10;
+----+-----------+-----+
| id | name      | num |
+----+-----------+-----+
|  2 | 李四      |   2 |
|  3 | 王五      |   2 |
|  5 | 王月      |   1 |
|  1 | 张三丰    |   1 |
+----+-----------+-----+
4 rows in set (0.01 sec)

mysql> 




-- join 连接查询
----------------------------------------------------------------------------
-- 以左联为主，user信息为主，右侧topic表信息没有的补null
mysql> select u.id,u.name,t.id,t.title from users u left join topic t on u.id=t.uid;
+----+-----------+------+-----------------------------------------------+
| id | name      | id   | title                                         |
+----+-----------+------+-----------------------------------------------+
|  1 | 张三丰    |    2 | 毕业一年，大家过着怎样的生活                  |
|  2 | 李四      |    1 | 工作十年                                      |
|  2 | 李四      |    5 | 现在创业好难啊                                |
|  3 | 王五      |    4 | 为什么工资一直涨不了？速度进来                |
|  3 | 王五      |    6 | 现在学什么技术好一些？                        |
|  4 | 赵六      | NULL | NULL                                          |
|  5 | 王月      |    3 | 英语四级真的很重要吗？                        |
|  6 | 陆玲      | NULL | NULL                                          |
+----+-----------+------+-----------------------------------------------+
8 rows in set (0.00 sec)

-- 右联查询，以topic为主，左侧users没有对应信息的补null
mysql> select u.id,u.name,t.id,t.title from users u right join topic t on u.id=t.uid;
+------+-----------+----+-----------------------------------------------+
| id   | name      | id | title                                         |
+------+-----------+----+-----------------------------------------------+
|    2 | 李四      |  1 | 工作十年                                      |
|    1 | 张三丰    |  2 | 毕业一年，大家过着怎样的生活                  |
|    5 | 王月      |  3 | 英语四级真的很重要吗？                        |
|    3 | 王五      |  4 | 为什么工资一直涨不了？速度进来                |
|    2 | 李四      |  5 | 现在创业好难啊                                |
|    3 | 王五      |  6 | 现在学什么技术好一些？                        |
| NULL | NULL      |  8 | aaaaaaaa                                      |
+------+-----------+----+-----------------------------------------------+
7 rows in set (0.00 sec)

-- 内联（等价于where管理），求的是两侧交集的数据
mysql> select u.id,u.name,t.id,t.title from users u inner join topic t on u.id=t.uid;
+----+-----------+----+-----------------------------------------------+
| id | name      | id | title                                         |
+----+-----------+----+-----------------------------------------------+
|  1 | 张三丰    |  2 | 毕业一年，大家过着怎样的生活                  |
|  2 | 李四      |  1 | 工作十年                                      |
|  2 | 李四      |  5 | 现在创业好难啊                                |
|  3 | 王五      |  4 | 为什么工资一直涨不了？速度进来                |
|  3 | 王五      |  6 | 现在学什么技术好一些？                        |
|  5 | 王月      |  3 | 英语四级真的很重要吗？                        |
+----+-----------+----+-----------------------------------------------+
6 rows in set (0.00 sec)

-- 统计每个用户的发帖量信息，包含没有发帖的用户统计
mysql> select u.id,u.name,count(t.id) num from users u left join  topic t on u.id=t.uid  group by u.id order by num desc limit 10;
+----+-----------+-----+
| id | name      | num |
+----+-----------+-----+
|  3 | 王五      |   2 |
|  2 | 李四      |   2 |
|  5 | 王月      |   1 |
|  1 | 张三丰    |   1 |
|  6 | 陆玲      |   0 |
|  4 | 赵六      |   0 |
+----+-----------+-----+
6 rows in set (0.01 sec)





-- 查询实战

--1. 查询帖子id号为1的所有评论信息，要求管理评论人信息
-- 显示字段：评论id，帖子id，评论人id，评论人姓名，评论内容
-- 要求使用：where关联，inner jion和left join各执行一次

mysql> select r.id,r.tid,r.uid,u.name,r.content from reply r,users u where r.uid = u.id and r.tid=1;

mysql> select r.id,r.tid,r.uid,u.name,r.content from reply r inner join users u on r.uid = u.id where r.tid=1;

mysql> select r.id,r.tid,r.uid,u.name,r.content from reply r left join users u on r.uid = u.id where r.tid=1;



-- 2. 查询帖子信息，并关联输出发帖人信息
-- 显示字段：帖子id，帖子标题，发帖时间，发帖人id，发帖人姓名
-- 要求使用：where关联，inner jion和left join各执行一次

mysql> select t.id,t.title,t.addtime,t.uid,u.name from topic t,users u where t.uid=u.id;

mysql> select t.id,t.title,t.addtime,t.uid,u.name from topic t inner join users u on t.uid=u.id;

mysql> select t.id,t.title,t.addtime,t.uid,u.name from topic t left join users u on t.uid=u.id;

-- 3. 查询id号为3的单条评论信息，关联帖子和用户信息
-- 显示字段：评论id，帖子id，帖子标题，评论人id，评论人姓名，评论内容，评论时间
mysql> select r.id,r.tid,t.title,r.uid,u.name,r.content,r.addtime from reply r,topic t,users u where r.tid=t.id and r.uid=u.id and r.id=3;
--左联查
mysql> select r.id,r.tid,t.title,r.uid,u.name,r.content,r.addtime 
    -> from reply r left join topic t on r.tid=t.id 
    -> left join users u on r.uid=u.id where r.id=3\G

