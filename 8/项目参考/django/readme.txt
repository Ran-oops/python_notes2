django==1.11.*
python == 3.5
mysql == 5.7
����pip3 : sudo apt-get install python3-pip   (ע�ⲻҪ����)
����pymysql : pip3 install pymysql
�޸�settings.py  �����databases
'default': {
    'ENGINE': 'django.db.backends.mysql',
    'NAME': 'dbname',   #���ݿ���
    'USER': 'username',    #�û���
    'PASSWORD': '123456',
    'HOST': 'hostname',
    'PORT': '3306',
    'CHARSET':'utf8',##�����ַ�������Ȼ�������������
    }
�������ݿ� shop
ִ�д��������ʾ����mysql��root�˻������룬��֤�ɹ��󣬻���dbname������ݿ���ִ��filename.sql����ű�������filename.sql�ļ���sql�ļ����ڵ�·����
  ��� mysql -u root -p dbname<shop.sql
  ����
    mysql -u root -p dbname</home/root/shop.sql


����֮��, ���������û� python3 manage.py createsuperuser
