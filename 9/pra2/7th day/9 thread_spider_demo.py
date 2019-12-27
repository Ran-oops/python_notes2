import threading
import requests
from bs4 import BeautifulSoup
from queue import Queue
import time

headers = {
    'User-Agent' : 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36'
}

# 进程任务函数  采集和解析都用这一个函数
def getpage(task_q,data_q):
    while not task_q.empty():
        task_q.get()#获取一个任务

        response = requests.get(url,headers=headers)
        if response.status_code == 200:
            html = response.text
            html = BeautifulSoup(html,'lxml')
            tr_list = html.select('table.tablelist tr')[1:-1]
            for tr in tr_list:
                td_list = tr.select('td')
                job_name = td_list[0].a.text

                #向数据队列增加数据
                data_q.put(job_name)

if __name__ == '__main__':
    #创建多个线程
    data_q=Queue()  #数据队列
    task_q=Queue()  #任务队列

    base_url = 'http://hr.tencent.com/position.php?start=%d'
    url_list = [base_url % i for i in range(0, 990 + 1, 10)]
    for url in url_list:
        task_q.put(url)  #向任务队列里追加一个url

    thread_list=[]
    for i in range(100):  #创建了五个线程
        t=threading.Thread(target=getpage,args=(task_q,data_q))
        t.start()
        thread_list.append(t)

    for t in thread_list:
        t.join()

    with open('job1','w',encoding='utf-8') as f:
        while not data_q.empty():
            f.write(data_q.get())


    print(time.clock())