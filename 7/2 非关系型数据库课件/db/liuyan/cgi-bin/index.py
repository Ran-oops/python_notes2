#!/usr/bin/env python3
import cgi,cgitb,pymysql,time

print('Content-type:text/html;charset=utf8')
print()






# 链接mysql数据库
db = pymysql.connect('127.0.0.1','root','123456','py',charset='utf8')

# 获取游标
cursor = db.cursor()



# 拼接sql
sql = 'select * from liuyan'



try:
	# 执行sql
	cursor.execute(sql)
	# 获取查询到的所有数据
	res = cursor.fetchall()
	trs = ''
	for row in res:
		abc = time.strftime("%Y-%m-%d %H:%M:%S", time.localtime(float(row[3])))
		
		trs += """
		<tr>
			<td>{id}</td>
			<td>{username}</td>
			<td>{content}</td>
			<td>{addtime}</td>
			<td>
				<a href="/cgi-bin/del.py?id={id}">删除</a>
				<br>
				<a href="/cgi-bin/edit.py?id={id}">修改</a>
			</td>
		</tr>
		""".format(id = row[0],username=row[1],content=row[2],addtime=abc)

except:
	# print("<script>alert('查询留言失败');location.href='/add.html';</script>")
	print("查询留言失败")

# 关闭数据库链接
db.close()

html = """
<!DOCTYPE html>
<html>
<head>
		<meta charset="utf-8">
	<title>留言列表</title>
</head>
<body>
	<a href="/add.html">添加留言</a>
	<table width="700" border="1">
		<tr>
			<th>ID</th>
			<th>用户名</th>
			<th>留言信息</th>
			<th>时间</th>
			<th>操作</th>
		</tr>
		{trs}
	</table>
</body>
</html>
""".format(trs = trs)


print(html)