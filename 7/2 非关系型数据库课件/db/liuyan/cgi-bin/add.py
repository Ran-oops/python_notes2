#!/usr/bin/env python3
import cgi,cgitb,pymysql,time

print('Content-type:text/html;charset=utf8')
print()



# 先接受用户提交过来的参数
fs = cgi.FieldStorage()

uname = fs['username'].value
con = fs['content'].value
addtime = time.time()

# print(uname,con,addtime)


# 链接mysql数据库
db = pymysql.connect('127.0.0.1','root','123456','py',charset='utf8')

# 获取游标
cursor = db.cursor()



# 拼接sql
sql = 'insert into liuyan values(null,"{uname}","{con}","{addtime}")'.format(uname=uname,con=con,addtime=str(addtime))


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