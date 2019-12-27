# -*- coding: utf-8 -*-
import scrapy
from py04_spider_day11.items import TencentItem
import hashlib
import datetime
from urllib import request

class TencentSpider(scrapy.Spider):
    name = 'tencent2'
    allowed_domains = ['tencent.com']
    base_url = 'http://hr.tencent.com/position.php?start=%d'
    start_urls = ['http://hr.tencent.com/position.php?start=0']
    headers = {

    }

    cookies = {

    }

    # 解析start_urls里的所有请求 ,生成请求的时候，如果不指定回掉函数，则用parse做为回调
    def parse(self, response):

        job_tr = response.xpath('//tr[@class="even"] | //tr[@class="odd"]')
        for job in job_tr:
            item = {}
            job_name = job.xpath('.//td[1]/a/text()').extract()[0]
            url = job.xpath('.//td[1]/a/@href').extract()[0]
            url = request.urljoin(response.url,url)
            url_id = self.md5(url) # 主键

            type = job.xpath('.//td[2]/text()').extract()
            type = self.getvalue(type)

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

            # 发起详情页请求
            yield scrapy.Request(url=url,callback=self.parse_detal,meta={'data' : item})

        # 创建多个分页请求
        for i in range(0,99 + 1,10):
            fullurl = self.base_url % i
            yield scrapy.Request(url=fullurl,callback=self.parse)

    # 解析详情页
    def parse_detal(self,response):
        # 创建数据对象
        data_item = response.meta

        item = TencentItem()

        duty = response.xpath('//tr[@class="c"][1]//li/text()').extract() # 返回列表
        duty = ''.join(duty)

        requirement = response.xpath('//tr[@class="c"][2]//li/text()').extract()
        requirement = ''.join(requirement)

        item['duty'] = duty
        item['requirement'] = requirement
        for key,value in data_item['data'].items():
            item[key] = value
        yield item

    def md5(self,value):
        md5 = hashlib.md5()
        md5.update(bytes(value,encoding='utf-8'))
        return md5.hexdigest()

    def getvalue(self,value):
        return value[0] if value else ''
