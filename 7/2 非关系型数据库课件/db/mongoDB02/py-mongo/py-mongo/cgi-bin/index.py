#!/usr/bin/env python3
import cgi,cgitb,pymongo

print('Content-type:text/html;charset=utf8')
print()

# 链接mongo
client = pymongo.MongoClient('127.0.0.1',27017)

# 选择库
db = client.py5


try:
	
	trs = ''
	for row in db.liuyan.find():
		# print(row)
		
		trs += """
		<tr>
			<td>{username}</td>
			<td>{content}</td>
			<td>
				<a href="/cgi-bin/del.py?id={id}">删除</a>
				<br>
				<a href="/cgi-bin/edit.py?id={id}">修改</a>
			</td>
		</tr>
		""".format(id = row['_id'],username=row['username'],content=row['content'])

except:
	# print("<script>alert('查询留言失败');location.href='/add.html';</script>")
	print("查询留言失败")



html = """
<!DOCTYPE html>
<html>
<head>
		<meta charset="utf-8">
	<title>留言列表</title>
</head>
<body>
	<a href="/add.html">添加留言</a>
	<br>

	<table width="700" border="1">
		<tr>
			<th>用户名</th>
			<th>留言信息</th>
			<th>操作</th>
		</tr>
		{trs}
	</table>
</body>
</html>
""".format(trs = trs)


print(html)