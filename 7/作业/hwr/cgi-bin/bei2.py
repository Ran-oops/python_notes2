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
			<meta charset='utf-8'>
			<title>leave memo</title>
			<link rel="stylesheet" href="./ppublic/css/bootstrap.min.css">
			<script src="./ppublic/js/jquery-1.10.2.js"></script>
			<script src="./ppublic/js/bootstrap.min.js"></script>
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
				#three{
					margin-top:30px;
				}
				#f{
					border:1px solid #ccc;
					width:390px;
					height:33px;
					margin-left:29px;
					padding-left:13px;
					border-radius:5px;
					line-height:33px;
					margin-top:7px;
				}
				#e{
					margin-left:29px;

				}
				#g{
					border:1px solid #ccc;
					width:390px;
					height:65px;
					margin-left:29px;
					padding-left:13px;
					border-radius:5px;
					margin-top:7px;
	
				}
				#h{
					margin-top:17px;
					margin-left:29px;
				}


			</style>
		</head>

		<body>
			<form action='/cgi-bin/doupdate.py' method='post'>


				<div id="one">
					<div class="container-fluid" id="two">
						<br>
						<center id="three"><h3>Message Update</h3></center>
						
						<div id=e><font size='4'>Username</font></div>
						<div  name='username' width="390" id="f">%s</div>
						
						
					
						<div id=h><font size='4'>Content</font></div>
						<div  name='content' id="g">%s</div>
					
			
						<div id='h'>
							<input type='submit' value='Update'></button>
							<input type="hidden" name="id" value=%d>
						</div>
					</div>
						
						
					
				</div>
				
			</form>
		</body>
	</html>

'''%(username,content,int(uid))


print(html)

