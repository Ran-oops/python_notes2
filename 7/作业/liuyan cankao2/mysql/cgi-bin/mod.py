import cgi,cgitb,pymysql,time
cgitb.enable()

print('Content-type:text/html;charset=utf8')
print()


#获取用户ID数据
data = cgi.FieldStorage()
uid = int(data['id'].value)
#连接数据库
db = pymysql.connect("192.168.0.202","root","123456",'pyliuyan',charset="utf8")
cursor = db.cursor()
#数据库查询指令
sql = 'select uname,content,wtime from user where uid = {num};'.format(num=uid)
#执行语句获取用户全部信息
cursor.execute(sql)
userinfo = cursor.fetchall()
for info in userinfo:
	username = info[0]
	cont = info[1]
	wtime = info[2]
#将用户信息输出至网页，并可对内容执行修改
output = '''
			<table class="table table-bordered">
				<tr>
					<td style="font-weight:bold;text-align:center">username:</td>
					<td style="text-align:center;">{name}</td>
					<td style="font-weight:bold;text-align:center">addtime:</td>
					<td style="text-align:center;">{time}</td>
				</tr>
				<tr>
					<form action="/cgi-bin/change.py" method="post">
						<td style="font-weight:bold;text-align:center">content:</td>
						<td colspan = 2>
							<textarea name ="content" style="width:300px;height:70px;">{content}</textarea>
						</td>
						<td>
							<input type="hidden" name="userID" value={ID}>
							<input type='submit' value="修改">
						</td>
					</form>
				</tr>
			</table>
			'''.format(name=username,time=wtime,ID=str(uid),content=cont)
html = """
<!DOCTYPE html>
<html>
    <head>
	   <meta charset='utf-8'>
	   <title>留言修改</title>
	   <link href="/public/css/bootstrap.min.css" rel="stylesheet">
	   <script src="/public/js/jquery-1.12.4.min.js"></script>
	   <script src="/public/js/bootstrap.min.js"></script>
    </head>
	<body>
		<center>
			<div style="width:800px;">
				<p style="text-align:left;"><a href="/add.html">返回留言列表</a></p>
				{dta}
			</div>
		</center>
	</body>
</html>
""".format(dta=output)
print(html)
#关闭数据库
db.close()

