from selenium import webdriver
from scrapy.http.response.html import HtmlResponse
import time

class PhantomjsMiddleware(object):
    def __init__(self):
        self.browser = webdriver.PhantomJS(executable_path=r"D:\安装包\fantomjs\phantomjs-2.1.1-windows\bin\phantomjs.exe")  # 需要配置phantom环境变量
    def process_request(self,request,spider):
        '''
        :param request: 请求对象
        :param spider: 蜘蛛对象
        :return:
        '''
        if request.meta.get('phantomjs',None):
            # print(request.url)
            # browser = webdriver.PhantomJS() # 需要配置phantom环境变量
            self.browser.get(request.url)
            time.sleep(1)
            html = self.browser.page_source
            # browser.quit()
            # print(html)
            response = HtmlResponse(url=request.url,encoding='utf-8',body=html,request=request)

            return response


