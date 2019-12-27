# -*- coding: utf-8 -*-
import scrapy


class BaiduIpSpider(scrapy.Spider):
    name = 'baidu_ip' # 爬虫名称
    allowed_domains = ['www.baidu.com'] # 爬虫有效域名
    start_urls = ['http://www.baidu.com/s?wd=ip']  # 起始url地址

    def parse(self, response):
        # print(response.body)
        print(response.status)
