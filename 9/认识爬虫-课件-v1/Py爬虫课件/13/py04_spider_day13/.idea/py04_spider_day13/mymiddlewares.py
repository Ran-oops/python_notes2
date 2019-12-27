from fake_useragent import UserAgent
from scrapy.conf import settings
import random
import base64

class RandomUserAgent(object):
    def __init__(self,cralwer):
        self.ua = UserAgent()
        # 全局爬虫对象
        self.crawler = cralwer

    @classmethod
    def from_crawler(cls,cralwer):
        return cls(cralwer)

    def process_request(self,request,spider):
        # ua_type = settings['UA_TYPE']
        # getattr 获取ua对象下的某一个属性

        ua = getattr(self.ua,self.crawler.settings['UA_TYPE'])
        # print(dir(self.crawler))
        # request.headers.setdefault('User-Agent',ua)
        request.headers['User-Agent'] = ua

class RandomProxy(object):
    def __init__(self, cralwer):
        self.crawler = cralwer

    @classmethod
    def from_crawler(cls, cralwer):
        return cls(cralwer)

    def process_request(self,request,spider):
        proxies = self.crawler.settings['PROXIES']
        proxy = random.choice(proxies)

        request.meta['proxy'] = proxy['host']

class AuthRandomProxy(object):
    def __init__(self, cralwer):
        self.crawler = cralwer

    @classmethod
    def from_crawler(cls, cralwer):
        return cls(cralwer)

    def process_request(self,request,spider):
        proxies = self.crawler.settings['AUTH_PROXIES']
        proxy = random.choice(proxies)

        # 设置认证信息 （用户名和密码）
        auth = proxy['auth']
        auth = base64.b64encode(bytes(auth,'utf-8'))
        request.headers['Proxy-Authorization'] = b'Basic ' + auth

        # 设置代理ip和端口号
        request.meta['proxy'] = proxy['host']