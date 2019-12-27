#!/usr/bin/python3
import cgi,cgitb,redis
cgitb.enable()

print("Content-Type: text/html;charset=utf-8")
print()

fs =cgi.FieldStorage()
uid=fs['id'].value
#python lianjie redis
r=redis.Redis(host='127.0.0.1',port=6379,decode_responses=True)
data=r.hgetall('user:'+uid)

username=data['username']
content=data['content']
html='''
	<!DOCTYPE html>
	<html>
		<head>
			<meta charset="utf-8">
			<title>xiugaidiyibu</title>
		</head>

		<body>
			<form action='/cgi-bin/doupdate.py' method='post'>
				username:<input type='text' name='username' value=%s><br>
				content:
				<br>
					<textarea name='content'>%s</textarea>
				<br>
				<input type='hidden' name="id" value=%d>
				<input type='submit' name=''>
			</form>
		</body>
	</html>
'''%(username,content,int(uid))


print(html)

