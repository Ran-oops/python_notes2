import cgi,cgitb,pymysql,time
cgitb.enable()

print('Content-type:text/html;charset=utf8')
print()


fs = cgi.FieldStorage()

a = int(fs['id'].value)

db = pymysql.connect("192.168.0.202","root","123456",'pyliuyan',charset="utf8")
cursor = db.cursor()

sql = 'delete from user where uid ={id};'.format(id=a)

try:
	cursor.execute(sql)
	db.commit()
	js = '''
		<script>
			alert('删除成功');
			location.href="/cgi-bin/index.py";
		</script>'''
	print(js)
except:
	js = '''
		<script>
			alert('删除失败');
			location.href="/cgi-bin/index.py";
		</script>'''
	print(js)
db.close()