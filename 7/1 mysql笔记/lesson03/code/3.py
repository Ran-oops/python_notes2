
#数据查询实例

import pymysql

db = pymysql.connect("localhost","root","123456","mydb")

cursor = db.cursor()

try:
	sql1 = "delete from stu where id='%d'" % (20)
	cursor.execute(sql1)
	sql2 = "insert into stu(name,age,sex,classid) values('%s','%d','%c','%d')" % ('qq133',22,'w',2)
	cursor.execute(sql2)
	db.commit()
	print("ok:%d" % (cursor.rowcount))
except:
    print("Error")
    db.rollback()
    
db.close()