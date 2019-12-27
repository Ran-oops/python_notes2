import gevent
from gevent import monkey
import time
from queue import Queue
import requests
from bs4 import BeautifulSoup
from mydb import Mydb
import threading
# 打补丁，替换系统标准库中的模块
monkey.patch_all()

headers = {
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36'
}

# 协程函数
def foo1(task_q):
    while not task_q.empty():
        url = task_q.get()
        response = requests.get(url,headers=headers)
        html = response.text
        html = BeautifulSoup(html,'lxml')
        tr_list = html.select('table.tablelist tr')[1:-1]
        for tr in tr_list:
            info = tr.select('td')
            job_name = info[0].a.text
            job_number = info[2].text
            date_pub = info[4].text
            sql = 'insert into tencent_job(job_name,job_number,date_pub) VALUES(%s,%s,%s)'

            # 数据库插入
            lock.acquire()
            mydb.execute(sql,(job_name,job_number,date_pub))
            lock.release()


if __name__ == '__main__':
    mydb = Mydb('127.0.0.1','root','123456','temp')
    lock = threading.Lock()

    task_q = Queue()
    base_url = 'http://hr.tencent.com/position.php?start=%d'
    # 创建任务
    for i in range(0,990 + 1,10):
        fullurl = base_url % i
        task_q.put(fullurl)

    g_list = []
    for i in range(10):
        g = gevent.spawn(foo1,task_q)
        g_list.append(g)

    print(time.ctime())
    gevent.joinall(g_list)
    print(time.ctime())
