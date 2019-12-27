#!/usr/bin/python3
import cgi,cgitb,redis
cgitb.enable()



print("Content-Type: text/html;charset=utf-8")    # HTML is following
print()                             # blank line, end of headers  



# 接收数据
fs = cgi.FieldStorage()
uid = fs['id'].value
# python 链接redis
r = redis.Redis(host='192.168.0.105', password='123456',port=6379,decode_responses=True)
udata = r.hgetall('user:'+uid)
username=udata['username']
content=udata['content']
addtime=udata['addtime']
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
			'''.format(name=username,time=addtime,ID=str(uid),content=content)
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

