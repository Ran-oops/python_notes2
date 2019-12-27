# -*- coding: utf-8 -*-
import scrapy

class TencentSpider(scrapy.Spider):
    name = 'tencent'
    allowed_domains = ['tencent.com']
    start_urls = ['http://tencent.com/']
    base_url = 'http://hr.tencent.com/position.php?start=%d'

    # 自定义 设置 覆盖全局setting
    #针对TencentSpider进行设置
    custom_settings = {
        'DOWNLOADER_MIDDLEWARES'  : {
            'py04_spider_day14.middlewares.RandomProxy': 1,
        },
        'USER_AGENT' : 'kamiseach',
        'ITEM_PIPELINES' : {
           # 'py04_spider_day14.pipelines.Py04SpiderDay14Pipeline': 300,
        }
    }

    def parse(self, response):
        for i in range(0,990 + 1,10):
            fullurl = self.base_url % i
            yield scrapy.Request(fullurl,callback=self.parse_list)

    def parse_list(self,response):
        print(response.status)
        print(response.request.headers)
