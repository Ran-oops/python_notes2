#!/usr/bin/python3
import cgi,cgitb,redis
cgitb.enable()



print("Content-Type: text/html;charset=utf-8")    # HTML is following
print()                             # blank line, end of headers  


# python 链接redis
r = redis.Redis(host='127.0.0.1', port=6379,decode_responses=True)



# 获取所以的用户id   lrange list1 0 -1
uids = r.lrange('uids',0,-1)

trs = ''
# 循环uids获取用户数据
for row in uids:

	users = r.hgetall('user:'+row)
	# print(users)
	# print()
	trs += """
		<tr>
			<td>{uid}</td>
			<td>{name}</td>
			<td>{upass}</td>
			<td>{uemail}</td>
			<td>{uage}</td>
			<td><a href="/cgi-bin/del.py?id={uid}">删除</a>|<a href="/cgi-bin/update.py?id={uid}">修改</a></td>
		</tr>
	""".format(uid=row,name=users['username'],upass=users['password'],uemail=users['email'],uage=users['age'])



html = """
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>用户列表</title>
</head>
<body>
	<a href="/add.html">添加数据</a>
	<table width="500" border="1">
		<tr>
			<td>id</td>
			<td>用户名</td>
			<td>密码</td>
			<td>邮箱</td>
			<td>年龄</td>
			<td>操作</td>
		</tr>
		"""+trs+"""
	</table>
</body>
</html>
"""



print(html)
