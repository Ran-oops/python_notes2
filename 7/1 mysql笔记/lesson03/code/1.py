
# 测试数据连接
import pymysql

db = pymysql.connect("localhost","root","123456","mydb")

cursor = db.cursor()

cursor.execute("select version()")

data = cursor.fetchone()


print("Database info:%s" % data)

db.close()
