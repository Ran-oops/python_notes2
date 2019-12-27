#!/usr/bin/env python3
import cgi,cgitb,pymysql,time
print('Content-type:text/html;charset=utf8')
print()


#lianjie mysql shujuku
db=pymysql.connect('127.0.0.1','root','Avalon','py',charset='utf8')

#huoqu youbiao
cursor=db.cursor()

try:

	#pinjie sql
	sql='select * from liuyan '


	#zhixing sql
	cursor.execute(sql)
	db.commit()
	#huoquchaxundaodesuoyoushuju
	result=cursor.fetchall()
	#print("id=%d,username=%s,content=%s" % (id,username,content)) 
	#print(row)
	tms=''
	for row in result:
		d=row[0]
		username=row[1]
		content=row[2]


		tms +="""
			<tr>
				<td>%d</td>
				<td>%s</td>
				<td>%s</td>
				
				<td>
					<a href="/cgi-bin/del.py?id=%d">delete</a>|<a href="/cgi-bin/edit1.py?id=%d">update</a>
				</td>
			</tr>
			"""%(d,username,content,d,d)

except:
	print('chaxunliuyanshibai')


db.close()
#guanbishujukulianjie


html="""
<!DOCTYPE html>
<html>
	<head>
		<meta charset='utf-8'>
		<title>leave memo</title>
	</head>
	<body>
		<a href="/add.html">leave memo</a>
		<table width="700" border="1">
			<tr>
				<td>ID</td>
				<td>username</td>
				<td>memo</td>
				<td>operation</td>
			</tr>
			"""+tms+"""
		</table>
	</body>
</html>
"""

print(html)

