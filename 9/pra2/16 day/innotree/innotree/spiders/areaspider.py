# -*- coding: utf-8 -*-
import scrapy


class AreaspiderSpider(scrapy.Spider):
    name = 'areaspider'
    allowed_domains = ['innotree.cn']
    start_urls = ['http://innotree.cn/']

    def parse(self, response):
        pass
