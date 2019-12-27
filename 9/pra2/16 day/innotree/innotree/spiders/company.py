# -*- coding: utf-8 -*-
import scrapy


class CompanySpider(scrapy.Spider):
    name = 'company'
    allowed_domains = ['innotree.cn']
    start_urls = ['http://innotree.cn/']

    def parse(self, response):
        pass
