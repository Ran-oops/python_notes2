#!/usr/bin/env python3
import cgi,cgitb,pymysql
from bson.objectid import ObjectId
cgitb.enable()

print('Content-type:text/html;charset=utf8')
print()

fs=cgi.FieldStorage()
uid=fs['id'].value
d=int(uid)

#lianjie mysql shujuku
db=pymysql.connect('127.0.0.1','root','Avalon','py',charset='utf8')

#huoqu youbiao
cursor=db.cursor()

try:
	
	sql="delete from liuyan where id='%d' " %(d)

	#zhixing sql
	cursor.execute(sql)
	db.commit()
	print('congradulations!')

except:
	db.rollback()
	print('what a pitty, you failed!')

db.close()
