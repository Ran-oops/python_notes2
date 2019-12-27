#!/usr/bin/env python3
import cgi,cgitb,pymysql
from bson.objectid import ObjectId
cgitb.enable()

print('Content-type:text/html;charset=utf8')
print()

fs=cgi.FieldStorage()

uid=fs['id'].value
d=int(uid)
username=str(fs['username'].value)
content=str(fs['content'].value)
#print(username)
#print(content)


#lianjie mysql shujuku
db=pymysql.connect('127.0.0.1','root','Avalon','py',charset='utf8')
cursor=db.cursor()

sql="update liuyan set username='%s', content='%s' where id='%d'"%(username,content,d)
#zhixingxiugai
try:
	cursor.execute(sql)
	db.commit()
	result='''
		<script>
			alert("congratulations, you succeed!")
			location.href='/cgi-bin/index.py'
		</script>
	'''
	print(result)
except:
	result='''
		<script>
			alert('what a pity, you failed!')
			window.location.replace('http://127.0.0.1:8080/cgi-bin/index.py')
		</script>
	'''
	print(result)

db.close()