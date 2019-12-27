#!/usr/bin/env python3
import cgi,cgitb,pymysql,time

print('Content-type: text/html;charset=utf8')
print()

#xian jieshou yonghu tijiao guolai de canshu
fs=cgi.FieldStorage()
uname=fs['username'].value
con=fs['content'].value



#print(uname,con)


#lian jie dao mysql shujuku
db=pymysql.connect(host='localhost',port=3306,user='root',passwd='Avalon',db='py',charset='utf8')

#huoqu youbiao
cursor=db.cursor()
sql1='select count(*) from liuyan'
cursor.execute(sql1)
db.commit()
result=cursor.fetchall()
for row in result:
	i=row[0]

i+=1	

#pinjie sql
sql="insert into liuyan(id,username,content) values('%d','%s','%s')" % (i,uname,con)

try:
	#zhi xing sql
	cursor.execute(sql)
	db.commit()


	print("<script>alert('tianjialiuyanchenggong');location.href='/cgi-bin/index.py';</script>")
except:
	db.rollback()
	print("<script>alert('tianjia liuyanshibai');location.href='/add.html';</script>")

#guanbishujukulianjie
db.close()
