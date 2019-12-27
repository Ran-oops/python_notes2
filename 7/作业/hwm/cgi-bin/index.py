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
	<meta charset="utf-8">
	<title>yonghuliebiao</title>
	<link rel="stylesheet" href="./ppublic/css/bootstrap.min.css">
	<script src="./ppublic/js/jquery-1.10.2.js"></script>
	<script src="./ppublic/js/bootstrap.min.js"></script>
	<style type='text/css'>
		#one{
				border:1px solid #ccc
								
				margin-left:100px;
				
			}

			#two{
				margin-left:40px;
				margin-top:20px;
				width:620px;
					
			}
			#three{
				margin-top:30px;
			}
			a{
				text-decoration:none;
			}
	</style>
</head>
<body background="./h.jpeg">
	<div id="one">
		<div id="two">
			<br>
			<div><center id="three"><h3>DETAILES</h3></center></div>
			<table width="620" class="table table-hover" cellpadding="0" cellspacing="0" border=1px color="#ccc">
				<tr>
					<th>id</th>
					<th>username</th>
					<th>content</th>
					<th>operation</th>
				</tr>
				"""+tms+"""
			</table>
		</div>
	</div>
</body>
</html>
"""
print(html)