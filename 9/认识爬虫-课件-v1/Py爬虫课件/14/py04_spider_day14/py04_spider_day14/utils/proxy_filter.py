import requests
from py04_spider_day13.utils import mydb
from py04_spider_day13 import settings

# 测试网站
class ProxyManager(object):

    base_url = 'http://www.baidu.com/s?wd=ip'

    def __init__(self):
        mysql = settings.MYSQL_INFO
        self.mysql = mydb.Mydb(mysql['MYSQL_HOST'],mysql['MYSQL_USER'],mysql['MYSQL_PASS'],mysql['MYSQL_DB'])

    def proxy_filter(self):
        sql = 'select * from xici'
        res = self.mysql.query(sql)

        for item in res:
            # 开始构建一个代理
            proxy = {
                'http' : 'http://' + item['host'] + ':' + str(item['port']),
                'https' : 'http://' + item['host'] + ':' + str(item['port'])
            }
            # 用代理发请求
            try:
                response = requests.get(self.base_url,proxies=proxy,timeout=3)
                print('可用%s %s' % (item['host'],item['port']))
            except Exception as e:
                # 如果请求异常，删除代理
                self.drop_proxy(item)
            else:
                # 如果请求正常，再判断响应码
                if not (200 <= response.status_code <= 300):
                    # 删除代理
                    self.drop_proxy(item)

    def drop_proxy(self,proxy):
        print('删除%s' % proxy['host'])
        sql = "delete from xici where host=%s"
        self.mysql.execute(sql,(proxy['host']))


if __name__ == '__main__':
    pm = ProxyManager()
    pm.proxy_filter()