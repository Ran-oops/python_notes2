# -*- coding: utf-8 -*-
import scrapy
from py04_spider_day13 import settings
# from scrapy.conf import settings
import random
from py04_spider_day13.items import XiciItem


class BaiduSpider(scrapy.Spider):
    name = 'xici'
    # 允许爬虫有效域
    allowed_domains = ['baidu.com','xicidaili.com']
    start_urls = ['http://www.baidu.com/']
    # start_urls = ['http://www.xicidaili.com']
    base_url = 'http://www.xicidaili.com/nn/%d'

    def parse(self, response):
        headers = {}
        for i in range(990, 0 , -1):
            fullurl = self.base_url % i
            # print(fullurl)
            yield scrapy.Request(url=fullurl,callback=self.parse_list)

    def parse_list(self,response):

        # print(response.request.headers)
        # print(response.url)
        print(response.status)
        proxy_list = response.xpath('//table[@id="ip_list"]//tr')[1:]

        for proxy in proxy_list:
            item = XiciItem()
            info = proxy.xpath('.//td/text()').extract()
            host = info[0]
            port = info[1]
            item['host'] = host
            item['port'] = port
            yield item


