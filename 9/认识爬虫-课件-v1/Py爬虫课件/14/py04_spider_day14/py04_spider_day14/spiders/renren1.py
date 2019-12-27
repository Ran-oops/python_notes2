# -*- coding: utf-8 -*-
import scrapy


class Renren1Spider(scrapy.Spider):
    name = 'renren1'
    allowed_domains = ['renren.com']
    # start_urls = ['http://renren.com/']
    login_url = 'http://www.renren.com/PLogin.do'

    custom_settings = {
        'COOKIES_ENABLED' : True
    }

    # 默认会把start_urls 的地址全部转化为scrapy.Request对象
    def start_requests(self):
        # 发送post请求
        data = {
            'email' : '1752570559@qq.com',
            'password' : '1234qwer'
        }
        # 不指定回调则待用parse
        yield scrapy.FormRequest(url=self.login_url,formdata=data)

    def parse(self, response):
        print(response.text)
