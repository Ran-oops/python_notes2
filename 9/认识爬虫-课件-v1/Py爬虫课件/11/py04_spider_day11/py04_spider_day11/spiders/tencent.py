# -*- coding: utf-8 -*-
import scrapy
from py04_spider_day11.items import TencentItem
import hashlib
import datetime
from urllib import request

class TencentSpider(scrapy.Spider):
    name = 'tencent'
    allowed_domains = ['tencent.com']
    base_url = 'http://hr.tencent.com/position.php?start=%d'

    start_urls = []
    for i in range(0,99 + 1 ,10):
        fullurl = base_url % i
        start_urls.append(fullurl)

    # 解析start_urls里的所有请求 ,生成请求的时候，如果不指定回掉函数，则用parse做为回调
    def parse(self, response):
        # response.body # 返回btyes类型
        # response.text # 返回str类型

        job_tr = response.xpath('//tr[@class="even"] | //tr[@class="odd"]')
        for job in job_tr:
            item = TencentItem()
            job_name = job.xpath('.//td[1]/a/text()').extract()[0]
            url = job.xpath('.//td[1]/a/@href').extract()[0]
            url = request.urljoin(response.url,url)
            url_id = self.md5(url) # 主键

            type = job.xpath('.//td[2]/text()').extract()[0]
            number = job.xpath('.//td[3]/text()').extract()[0]
            location = job.xpath('.//td[4]/text()').extract()[0]
            date_time = job.xpath('.//td[5]/text()').extract()[0]

            item['job_name'] = job_name
            item['url'] = url
            item['url_id'] = url_id
            item['type'] = type
            item['number'] = number
            item['location'] = location
            item['date_time'] = date_time
            item['crawl_time'] = datetime.datetime.now().strftime('%Y-%m-%d')

            yield item

    def md5(self,value):
        md5 = hashlib.md5()
        md5.update(bytes(value,encoding='utf-8'))
        return md5.hexdigest()