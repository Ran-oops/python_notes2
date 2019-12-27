from selenium import webdriver
import time
from scrapy.http import HtmlResponse

class PhantomjsMiddleware(object):

    def __init__(self):
        #实例化浏览器
        self.browser=webdriver.PhantomJS(executable_path=r"D:\安装包\fantomjs\phantomjs-2.1.1-windows\bin\phantomjs.exe")  #需要配置phantom环境变量

    #这个process_request方法与pipelines.py里面的方法相对应。不能是item,只能是request,因为是请求对象.在pipelines.py中是def process_item(self,item,spider):
    #是item
    def process_request(self,request,spider):
        '''
        :param request:   #请求对象
        :param spider:    #蜘蛛对象
        :return:
        '''
        if request.meta.get('phantomjs',None):#如果是true
            #用这种方法就是不用自带的scrapy.request获取内容，就不要taobao.py中parse_detail中的响应的
            #response了

            #这个是调用浏览器，发送一个请求
            self.browser.get(request.url)#request.url是在taobao.py中传入的值yield scrapy.Request(url=detail_url,callback=self.parse_detail,meta={'data':item})
            time.sleep(1)
            html=self.browser.page_source  #响应的html内容
            # browser.quit()
            #print(html)

            #要做一个和taobao.py 的def parse_detail(self,response)中的response对象一模一样。然后就可以在taobao.py 的def parse_detail(self,response)
            #中获取到传入的这些内容
            return HtmlResponse(request.url,encoding='utf-8',body=html,request=request) #传入响应的html内容,请求对象也可以传
            #如果传了请求对象，那么就可以在taobao.py的def parse_detail(self,response):下面写response.request进行调用。
            #本来scrapy是默认全部内容都传到taobao.py的def parse_detail(self,response):。现在咱们是自己构造响应对象

