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
cursor=db.cursor()


sql="select username,content from liuyan where id='%d' " %(d)
#zhixing sql
cursor.execute(sql)
db.commit()
result=cursor.fetchall()
#print("id=%d,username=%s,content=%s" % (id,username,content)) 
#print(row)
for i in result:
	uname=i[0]
	con=i[1]



html='''
	<!DOCTYPE html>
		<html>
			<head>
				<meta charset="utf-8">
				<title>xiugaidiyibu</title>
				<style type='text/css'>
					#one{
							border:1px solid #ccc
							height:552px;
							width:450px;
							margin-top:62px;
							margin-left:130px;
							margin-bottom:82px;
						}

					#two{
						height:552px;
						width:450px;
						box-shadow:0px 0px 10px 5px #aaa;
					}
					#a{
						margin-top:10px;
					}
				</style>
			</head>

			<body>
				<form action='/cgi-bin/update.py' method='post'>
					<div id="one">
						<div id='two' class="container-fluid">
							<br>
							<br>
							<br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size='4'>username:</font>
							
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type='text' class='form-control' name='username' value=%s><br>
								<br>
							
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size='4'>content:</font>
							
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea class='form-control' rows="3" name='content'>%s</textarea>
							<br>
							<br>
							
							<input type='hidden' name="id" value=%d>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type='submit' name='' value='Update'>
						</div>
					</div>
					</form>
			</body>
		</html>
'''%(uname,con,d)

db.close()
print(html)