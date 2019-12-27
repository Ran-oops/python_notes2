#!/usr/bin/python3
import cgi,cgitb,pymongo
from bson.objectid import ObjectId
cgitb.enable()



print("Content-Type: text/html;charset=utf-8")    
print()                             



# 接收用户id
fs = cgi.FieldStorage()
uid=fs['id'].value

# python 链接mongo
client = pymongo.MongoClient("192.168.0.105",27017)
db = client.liuyan
#通过id获取用户信息
data = db.user.find_one({"_id":ObjectId(uid)})

username=data['username']
content=data['content']
addtime=data['addtime']
output = '''
			<table class="table table-bordered">
				<tr>
					<td style="font-weight:bold;text-align:center">username:</td>
					<td style="text-align:center;">{name}</td>
					<td style="font-weight:bold;text-align:center">addtime:</td>
					<td style="text-align:center;">{time}</td>
				</tr>
				<tr>
					<form action="/cgi-bin/doupdate.py" method="post">
						<td style="font-weight:bold;text-align:center">content:</td>
						<td colspan = 2>
							<textarea name ="content" style="width:300px;height:70px;">{content}</textarea>
						</td>
						<td>
							<input type="hidden" name="userid" value={ID}>
							<input type='submit' value="修改">
						</td>
					</form>
				</tr>
			</table>
			'''.format(name=username,time=addtime,ID=uid,content=content)
html = '''
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
'''.format(dta=output)
print(html)

