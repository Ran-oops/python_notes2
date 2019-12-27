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
			<form action='/cgi-bin/doupdate.py' method='post'>
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
'''%(username,content,int(uid))


print(html)

