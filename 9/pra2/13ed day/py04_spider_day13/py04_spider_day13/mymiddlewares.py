from fake_useragent import UserAgent
from scrapy.conf import settings
import random
import base64

class RandomUserAgent(object):
    #写一个初始化
    def __init__(self,crawler): #from_crawler中的crawler传到这了
        self.ua=UserAgent()  #这样就在初始化的时候就实例化了一个ua对象
        #全局爬虫对象
        self.crawler=crawler

    @classmethod
    def from_crawler(cls,crawler): #定义一个类方法，传入crawler对象
        return cls(crawler)       #这样实例化一个对象  #crawler可以获取api
    def process_request(self,request,spider):  #request是请求对象
        # ua_type=settings['UA_TYPE']  #导入配置文件中指定的浏览器。ua_type是字符串

        # print(self.crawler.settings['UA_TYPE'])
        # getattr获取ua对象下的某一个属性
        ua=getattr(self.ua,self.crawler.settings['UA_TYPE'])  #ua根据ua_type生成浏览器标识
        # print(dir(self.crawler))  #这是用于调试的
        #request请求对象下面有一个方法
        # request.headers.setdefault('User-Agent',ua)  #设置请求头，把ua传给User-Agent
        request.headers['User-Agent'] = ua
        #===每一次请求都会随机选一个请求头


class RandomProxy(object):
    def __init__(self,crawler):
        self.crawler=crawler

        @classmethod
        def from_crawler(cls,crawler):
            return cls(crawler)

        def process_request(self,request,spider):
            proxies=self.crawler.settings['PROXIES']
            proxy=random.choice(proxies)

            request.meta['proxy']=proxy['host']

class AuthRandomProxy(object):
    def __init__(self,crawler):
        self.crawler=crawler

        @classmethod
        def from_crawler(cls,crawler):
            return cls(crawler)

        def process_request(self,request,spider):
            #获取AUTHO_PROXIES
            proxies=self.crawler.settings['AUTH_PROXIES']
            proxy=random.choice(proxies)

            #设置认证信息（用户名和密码）
            auth=proxy['auth']
            auth=base64.b64encode(bytes(auth,'utf-8'))
            #注意下面的Basic后面有空格，这是认证信息的格式
            request.headers['Proxy-Authorization']=b'Basic '+auth

            #设置代理ip和端口号
            request.mata['proxy']=proxy['host']


