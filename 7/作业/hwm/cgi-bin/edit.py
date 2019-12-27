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
#chaxun shujuku suoyou xinxi


tms=''

sql="select username,content from liuyan where id=%d" %(d)		
#zhixing sql
cursor.execute(sql)
db.commit()
#huoquchaxundaodesuoyoushuju
result=cursor.fetchall()
#print("id=%d,username=%s,content=%s" % (id,username,content)) 
#print(row)
for info in result:
	username=info[0]
	content=info[1]
print(username)

tms +="""

	<tr>
		<td>%d</td>
		<td>%s</td>
		<td>%s</td>								
	</tr>
	<tr>
		<form action="/cgi-bin/update.py" method="post">
			<td>
				<input type='submit' value='xiugai'>
			</td>
		</form>
	</tr>
	

	"""%(d,username,content)


db.close()
#guanbishujukulianjie



html="""
<!DOCTYPE html>
<html>
	<head>
		<meta charset='utf-8'>
		<title>update memo</title>
	</head>
	<body>
		<a href="/add.html">go back </a>
		<table width="700" border="1">
			<tr>
				<td>ID</td>
				<td>username</td>
				<td>memo</td>
				
			</tr>
			"""+tms+"""
		</table>
	</body>
</html>
"""

print(html)


