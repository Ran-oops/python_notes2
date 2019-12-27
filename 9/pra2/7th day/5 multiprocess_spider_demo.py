#================demo1==========================
'''
import requests
import time
from multiprocessing import Process,Pool
headers={
    'User-Agent':'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36'
}

#进程任务函数
def foo(url):
    response=requests.get(url,headers=headers)
    print(response.status_code)

if __name__=='__main__':
    print(time.ctime())
    pool=Pool(8)
    base_url='https://hr.tencent.com/position.php?&start=%d'
    url_list=[base_url % i for i in range(0,1000+1,10)]
    for url in url_list:
        pool.apply_async(foo,args=(url,))

    pool.close()  #关闭以后就不能再创建新的进程了
    #等待所有进程池的进程运行完毕
    pool.join()
    print(time.ctime())
'''
#==========================================================================================
from multiprocessing import Process,Pool,Queue,Manager # 进程池
import time
import requests
from bs4 import BeautifulSoup

headers = {
    'User-Agent' : 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36'
}

# 进程任务函数
def foo(url,q):
    response = requests.get(url,headers=headers)
    if response.status_code == 200:
        html = response.text
        html = BeautifulSoup(html,'lxml')
        tr_list = html.select('table.tablelist tr')[1:-1]
        for tr in tr_list:
            td_list = tr.select('td')
            job_name = td_list[0].a.text
            q.put(job_name)

if __name__ == '__main__':
    print(time.ctime())
    q = Manager().Queue() # 封装了数据类型，专门做进程数据共享

    pool = Pool(8)
    base_url = 'http://hr.tencent.com/position.php?start=%d'
    url_list = [base_url % i for i in range(0,990 + 1,10)]
    for url in url_list:
        pool.apply_async(foo,args=(url,q))

    pool.close() # 关闭以后就不能再创建新的进程了

    # 等待所有进程池的进程运行完毕
    pool.join()

    # 提取数据存入文件
    with open('job','w',encoding='utf-8') as f:
        while not q.empty():
            f.write(q.get() + '\n')
    print(time.ctime())