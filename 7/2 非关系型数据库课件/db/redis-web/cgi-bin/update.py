#!/usr/bin/python3
import cgi,cgitb,redis
cgitb.enable()



print("Content-Type: text/html;charset=utf-8")    # HTML is following
print()                             # blank line, end of headers  



# 接收数据
fs = cgi.FieldStorage()

uid = fs['id'].value



# python 链接redis
r = redis.Redis(host='127.0.0.1', port=6379,decode_responses=True)


res = r.hgetall('user:'+uid)


html = '''
	<!DOCTYPE html>
	<html>
	<head>
		<meta charset="utf-8">
		<title>用户编辑</title>
	</head>
	<body>
		<form action="/cgi-bin/doupdate.py" method="post">
			用户名:<input type="text" name="username" value="{uname}"><br>
			密码:<input type="password" name="password" value="{upass}"><br>
			邮箱:<input type="text" name="email" value="{uemail}"><br>
			年龄:<input type="text" name="age" value="{uage}"><br>
			
			<br>
			<input type="hidden" name="id" value="{uid}">
			<input type="submit">

		</form>
	</body>
	</html>

'''.format(uname=res['username'],upass=res['password'],uemail=res['email'],uage=res['age'],uid=uid)

print(html)

