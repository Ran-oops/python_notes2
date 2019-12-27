# -*- coding: utf-8 -*-
import scrapy
import datetime
from urllib import request
from jobs_fen.items import JobItem
import hashlib


class ZhonghuaSpider(scrapy.Spider):
    name = 'zhonghua'
    allowed_domains = ['chinahr.com']
    start_urls = ['http://www.chinahr.com/sou/']
    base_url=[
        'http://www.chinahr.com/sou/?page=',
        'http://www.chinahr.com/beijing/jobs/41951/',
        'http://www.chinahr.com/beijing/jobs/27577/',
        'http://www.chinahr.com/beijing/jobs/14347/',
        'http://www.chinahr.com/beijing/jobs/14284/',
        'http://www.chinahr.com/beijing/jobs/21893/',
        'http://www.chinahr.com/beijing/jobs/21888/',
        'http://www.chinahr.com/beijing/jobs/21845/',
        'http://www.chinahr.com/beijing/jobs/21890/',
        'http://www.chinahr.com/beijing/jobs/29014/',
        'http://www.chinahr.com/beijing/jobs/23272/',
        'http://www.chinahr.com/beijing/jobs/57227/'
    ]


    def parse(self, response):

        job_tr = response.xpath('//div[@class="jobList"]')
        # print(job_tr)
        for job in job_tr:
            item = {}
            title = job.xpath('.//a/text()').extract()[0]

            url = job.xpath('.//li[@class="l1"]/span[@class="e1"]/a/@href').extract()[0]  # 详情页的链接地址

            url_id = self.md5(url)  # 对获取的详情页地址进行md5加密充当主键
            address=job.xpath('//li[@class="l2"]/span[@class="e1"]/text()').extract()[0]

            salary = job.xpath('.//li[@class="l2"]/span[@class="e2"]/text()').extract()[0]
            company = job.xpath('.//li[@class="l1"]/span[@class="e3 cutWord"]/a/text()').extract()[0]

            date_time = job.xpath('.//li[@class="l1"]/span[@class="e2"]/text()').extract()[0]
            if "今天" in date_time:
                date_time=datetime.date.today()
            date_time=str(date_time)

            item['address'] = address
            item['title'] = title
            item['url'] = url
            item['url_id'] = url_id
            item['salary'] = salary
            item['company'] = company
            item['date_time'] = date_time

            # 发起详情页请求获取职位要求和联系方式
            yield scrapy.Request(url=url, callback=self.parse_detail, meta={'data': item})

        # 创建多个分页请求
        for i in range(1, 175):
            for onebase_url in self.base_url:
                fullurl = onebase_url + str(i)
            yield scrapy.Request(url=fullurl, callback=self.parse)

    def parse_detail(self, response):
        # 创建数据对象
        data_item = response.meta
        item = JobItem()
        detail = response.xpath('//div[@class="job_intro_info"]//text()').extract()
        detail=''.join(detail)
        detail=detail.strip('\r\n')
        # print(detail,type(detail))

        item['detail'] = detail
        for key, value in data_item['data'].items():
            item[key] = value
        yield item

    def md5(self, value):
        md5 = hashlib.md5()
        md5.update(bytes(value, encoding='utf-8'))
        return md5.hexdigest()

