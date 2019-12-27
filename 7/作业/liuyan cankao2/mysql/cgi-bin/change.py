import cgi,cgitb,pymysql,time
cgitb.enable()
print('Content-type:text/html;charset=utf8')
print()
#获取传来的数据
data = cgi.FieldStorage()
cont = str(data['content'].value)
num = int(data['userID'].value)
time1 = time.strftime('%Y-%m-%d %H:%M:%S')
#连接数据库
db = pymysql.connect("192.168.0.202","root","123456",'pyliuyan',charset="utf8")
cursor = db.cursor()
#sql指令
command = 'update user set content="{con}",wtime="{t1}" where uid={id}'.format(con=cont,t1=time1,id=num)
#执行修改
try:
	cursor.execute(command)
	db.commit()
	result='''
			<script>
				alert("修改成功")
				location.href='/cgi-bin/index.py'
			</script>
			'''
	print(result)
except:
	result='''
			<script>
				alert("修改失败，请重试")
				window.location.replace('http://127.0.0.1:8080/cgi-bin/index.py')
			</script>
			'''
	print(result)
#关闭数据库
db.close()