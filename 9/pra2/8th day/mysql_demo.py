import pymysql

try:
    conn = pymysql.connect('127.0.0.1','root','','temp',charset='utf8',cursorclass=pymysql.cursors.DictCursor)
    cursor = conn.cursor()
except Exception as e:
    print('连接失败',e)


# sql = 'insert into tencent_job(job_name,job_number,date_pub) values("全能全知全知道全战工程师",10,"2018-09-16")'
# sql = 'insert into tencent_job(job_name,job_number,date_pub) values(%s,%s,%s)'
# sql = 'update tencent_job set job_number=127 where id=3'

'''
#执行增删改
try:
    res = cursor.execute(sql)  # 返回影响行数
    # res = cursor.execute(sql,("python工程师",5,"2018-08-04")) # 返回影响行数
    conn.commit()
    print(res)
except Exception as e:
    conn.rollback()
    print('执行语句失败',e)
'''
sql = 'select * from tencent_job'

try:
    row = cursor.execute(sql) # 返回影响行数
    res = cursor.fetchall() # 拿出查询结果集
    for item in res:
        print(item)
except Exception as e:
    print('查询失败',e)
