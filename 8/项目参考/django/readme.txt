django==1.11.*
python == 3.5
mysql == 5.7
下载pip3 : sudo apt-get install python3-pip   (注意不要升级)
下载pymysql : pip3 install pymysql
修改settings.py  里面的databases
'default': {
    'ENGINE': 'django.db.backends.mysql',
    'NAME': 'dbname',   #数据库名
    'USER': 'username',    #用户名
    'PASSWORD': '123456',
    'HOST': 'hostname',
    'PORT': '3306',
    'CHARSET':'utf8',##设置字符集，不然会出现中文乱码
    }
建立数据库 shop
执行此命令，会提示输入mysql的root账户的密码，验证成功后，会在dbname这个数据库中执行filename.sql这个脚本，其中filename.sql文件是sql文件所在的路径。
  命令： mysql -u root -p dbname<shop.sql
  例：
    mysql -u root -p dbname</home/root/shop.sql


导入之后, 建立超级用户 python3 manage.py createsuperuser
