import requests
from py04_spider_day13.utils import mydb
from py04_spider_day13 import settings


# 测试网站
class ProxyManager(object):
    base_url = 'http://www.baidu.com/s?wd=ip'

    def __init__(self):
        mysql = settings.MYSQL_INFO
        # 配置文件中的MYSQL_INFO.
        # 叫做属性self.mysql
        self.mysql = mydb.Mydb(mysql['MYSQL_HOST'], mysql['MYSQL_USER'], mysql['MYSQL_PASS'], mysql['MYSQL_DB'])

    def proxy_filter(self):
        sql = 'select * from xici'
        # query封装方法。res是字典格式
        res = self.mysql.query(sql)

        for item in res:
            # 开始构建一个代理
            proxy = {
                'http': 'http://' + item['host'] + ':' + str(item['port']),
                'https': 'http://' + item['host'] + ':' + str(item['port'])
            }
            # 用代理发请求
            try:
                response = requests.get(self.base_url, proxies=proxy, timeout=3)  # 如果超过三秒，就是异常
                print('可用%s %s' % (item['host'], item['port']))
            except Exception as e:
                # 如果请求异常，删除代理
                self.drop_proxy(item)
            else:
                # 如果请求正常，再判断响应码
                if not (200 <= response.status_code <= 300):
                    # 删除代理
                    self.drop_proxy(item)

    # 构建一个删除代理的方法，一调用就可以了
    def drop_proxy(self, proxy):
        print('删除%s' % proxy['host'])
        sql = "delete from xici where host=%s"
        self.mysql.execute(sql, (proxy['host']))  # 这个地方的host对应的值就传给43行的%s了。


if __name__ == '__main__':
    pm = ProxyManager()  # 实例化pm
    pm.proxy_filter()  # pm调用一下proxy_filter