import requests
from py04_spider_day13.utils import mydb
from py04_spider_day13 import settings
import threading
from queue import Queue

mysql = settings.MYSQL_INFO
mysql = mydb.Mydb(mysql['MYSQL_HOST'], mysql['MYSQL_USER'], mysql['MYSQL_PASS'], mysql['MYSQL_DB'])

# 获取数据库中所有代理ip
def get_proxy():
    # 代理队列
    proxy_q = Queue()
    sql = 'select * from xici'
    res = mysql.query(sql)
    # 所有ip加入队列
    for proxy in res:
        proxy_q.put(proxy)

    # 代理队列返回
    return proxy_q

class ProxyManager(threading.Thread):

    base_url = 'http://www.baidu.com/s?wd=ip'

    def __init__(self,proxy_q,lock):
        super(ProxyManager, self).__init__()
        self.proxy_q = proxy_q
        self.lock = lock

    def run(self):
        while not self.proxy_q.empty():
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
    proxy_q = get_proxy()
    lock = threading.Lock()
    t_list = []
    for i in range(5):
        t = ProxyManager(proxy_q,lock)
        t.start()
        t_list.append(t)

    for t in t_list:
        t.join()

    # 如果所有线程运行完毕，关闭数据库
    mysql.close()

