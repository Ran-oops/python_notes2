#coding=utf-8
import cgi,cgitb,pymysql,time
cgitb.enable()

print('Content-type:text/html;charset=utf-8')
print()



#连接数据库，编写查询指令
db = pymysql.connect("192.168.0.202","root","123456",'pyliuyan',charset="utf8")
cursor = db.cursor()
sql = 'select * from user;'
#执行查找，并将数据输出
try:
	cursor.execute(sql)
	data = cursor.fetchall()
	result = ''
	i=0
	for row in data:
		i+=1
		result+='''
			<tr>
				<td>{id1}</td>
				<td>{username}</td>
				<td>{content}</td>
				<td>{addtime}</td>
				<td>
					<a href="/cgi-bin/delete.py?id={uid}">删除</a>
					<br>
					<a href="/cgi-bin/mod.py?id={uid}">修改</a>
				</td>
			</tr>'''.format(id1=i,uid=row[0],username=row[1],content=row[2],addtime=row[3])
		
except:
	print("<script>alert('查询留言失败');location.href='/add.html';</script>")
#关闭数据库
db.close()
#网页输出文件
html = '''
        <!DOCTYPE html>
        <html>
                <head>
                        <meta charset='utf-8'>
                        <title>留言列表</title>
                        <link href="/public/css/bootstrap.min.css" rel="stylesheet">
    					<script src="/public/js/jquery-1.12.4.min.js"></script>
    					<script src="/public/js/bootstrap.min.js"></script>
                </head>
                <body>
                	<center>
                		<div style="width:900px;">
	                        <p style="text-align:left;"><a href="/add.html" >添加留言</a></p>
	                        <table class="table table-bordered">
	                                <tr>
	                                        <th>ID</th>
	                                        <th>用户名</th>
	                                        <th>留言信息</th>
	                                        <th>时间</th>
	                                        <th>操作</th>
	                                </tr>
	                                        {dta}
	                        </table>
                        </div>
                    </center>
                 </body>
         </html>
        '''.format(dta=result)


print(html)



