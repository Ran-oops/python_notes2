import requests
from py04_spider_day13.utils import mydb
from py04_spider_day13 import settings
import threading
from queue import Queue

#全局对象
mysql = settings.MYSQL_INFO
mysql = mydb.Mydb(mysql['MYSQL_HOST'], mysql['MYSQL_USER'], mysql['MYSQL_PASS'], mysql['MYSQL_DB'])
#资源不能同时被多线程访问的时候就得加锁

# 获取数据库中所有代理ip。即是把数据全都查出来再交给多线程去删
def get_proxy():
    # 代理队列  把所有的IP数据都放在队列里，循环地去拿，拿一个就少一个
    proxy_q = Queue()  #初始化一个队列。队列默认就是带锁的，不可以同时被多线程访问
    sql = 'select * from xici'
    res = mysql.query(sql)
    # 所有ip加入队列
    for proxy in res:
        proxy_q.put(proxy)

    # 代理队列返回
    return proxy_q

class ProxyManager(threading.Thread):  #上面返回的proxy_q就传到ProxyManager类里面的初始化方法里面

    base_url = 'http://www.baidu.com/s?wd=ip'

    def __init__(self,proxy_q,lock):
        super(ProxyManager, self).__init__()  #初始化一下Thread的初始化方法。即调用Thread的初始化方法
        self.proxy_q = proxy_q  #把代理的队列就传到线程类里面了，然后执行run方法
        self.lock = lock

    def run(self):  #run方法在线程启用的时候调用,起的作用就是对IP数据进行筛选
        while not self.proxy_q.empty():  #循环应该遍历proxy_q
            item = self.proxy_q.get()
            proxy = {
                'http' : 'http://' + item['host'] + ':' + str(item['port']),
                'https' : 'http://' + item['host'] + ':' + str(item['port'])
            }
            # 用代理发请求
            try:
                response = requests.get(self.base_url,proxies=proxy,timeout=5)
                print('可用%s %s' % (item['host'],item['port']))
            except Exception as e:
                # 如果请求异常，删除代理
                with self.lock:
                    self.drop_proxy(item)
            else:
                # 如果请求正常，再判断响应码
                if not (200 <= response.status_code <= 300):
                    # 删除代理
                    with self.lock:
                        self.drop_proxy(item)

    def drop_proxy(self,proxy):
        print('删除%s' % proxy['host'])
        sql = "delete from xici where host=%s"
        mysql.execute(sql,(proxy['host']))

if __name__ == '__main__':
    proxy_q = get_proxy()  #获取代理，即所有的代理数据
    lock = threading.Lock()
    t_list = []
    for i in range(5):  #循环创建线程
        t = ProxyManager(proxy_q,lock)  #ProxyManager在实例化的时候把proxy_q传进去
        t.start() #启动线程
        t_list.append(t)

    for t in t_list:
        t.join() #会阻塞，等待所有线程运行完毕

    # 如果所有线程运行完毕，关闭数据库
    mysql.close()

