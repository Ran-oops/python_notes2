#!/usr/bin/python3
import cgi,cgitb,redis
cgitb.enable()

print("Content-Type: text/html;charset=utf-8")
print()

fs =cgi.FieldStorage()

#python lianjie redis
r=redis.Redis(host='127.0.0.1',port=6379,decode_responses=True)
i=0



#huoqu suoyou de yonghu id
uids=r.lrange('uids',0,-1)

trs=''
#xun huan uids houqu yonghushuju

for d in uids:
	users=r.hgetall('user:'+d)
	
	i+=1
	trs +="""
		<tr>
			<td>%d</td>
			<td>%s</td>
			<td>%s</td>
			<td><a href='/cgi-bin/del.py?id=%d'>delete</a>|<a href='/cgi-bin/update.py?id=%d'>update</a></td>	
		</tr>
"""%(i,users['username'],users['content'],i,i)
		


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
				"""+trs+"""
			</table>
		</div>
	</div>
</body>
</html>
"""
print(html)