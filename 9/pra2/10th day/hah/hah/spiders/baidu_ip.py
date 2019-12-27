# -*- coding: utf-8 -*-
import scrapy


class BaiduIpSpider(scrapy.Spider):
    name = 'baidu_ip'
    allowed_domains = ['www.baidu.com']
    start_urls = ['http://www.baidu.com/s?wd=ip']

    def parse(self, response):
        # print(response.body)
        print(response.status)
