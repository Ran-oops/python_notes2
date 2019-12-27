# -*- coding: utf-8 -*-
import random
import scrapy
#导入配置文件的方法一：模块导入
from py04_spider_day13 import settings
#方法二：
# from scrapy.conf import settings


class BaiduSpider(scrapy.Spider):
    name = 'xici'
    #允许爬虫有效域
    allowed_domains = ['baidu.com','xicidaili.com']
    start_urls = ['http://www.baidu.com']
    base_url='http://www.xicidaili.com/nn/%d'

    def parse(self, response):
        headers={}
        for i in range(1,10+1):
            fullurl=self.base_url % i

            yield scrapy.Request(url=fullurl,callback=self.parse_list)

    def parse_list(self,response):
        print(response.status)

