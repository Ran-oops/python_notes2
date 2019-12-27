import cgi,cgitb,pymysql,time
cgitb.enable()


print('Content-type:text/html;charset=utf8')
print()




#先接受用户提交过来的参数
fs = cgi.FieldStorage()
uname = fs['username'].value
cont = fs['content'].value
wtime = time.strftime('%Y-%m-%d %H:%M:%S')

# 链接mysql数据库
db = pymysql.connect('192.168.0.202','root','123456','pyliuyan',charset='utf8')

# 获取游标
cursor = db.cursor()

# 拼接sql
sql = 'insert into user values(null,"{username}","{content}","{wtime}")'.format(username=uname,content=cont,wtime=wtime)

try:
	# 执行sql
	cursor.execute(sql)
	db.commit()
	print("<script>alert('添加留言成功');location.href='/cgi-bin/index.py';</script>")
except:
	db.rollback()
	print("<script>alert('添加留言失败');location.href='/add.html';</script>")

# 关闭数据库链接
db.close()
 



