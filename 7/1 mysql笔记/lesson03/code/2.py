
#数据查询实例

import pymysql

db = pymysql.connect("localhost","root","123456","mydb")

cursor = db.cursor()

#sql = "select * from stu"
sql = "select * from stu limit %d" % (3)

try:
    cursor.execute(sql)

    result = cursor.fetchall()

    for row in result:
        id = row[0]
        name = row[1]
        age = row[2]
        sex = row[3]
        classid = row[4]
        print("id=%d, name=%s, age=%d, sex=%c, classid=%d" % (id,name,age,sex,classid))

except:
    print("Error")

db.close()
