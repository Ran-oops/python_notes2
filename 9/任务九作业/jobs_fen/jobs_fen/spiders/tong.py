# -*- coding: utf-8 -*-
import scrapy
import datetime
from urllib import request
from jobs_fen.items import TJobItem
import hashlib

class TongSpider(scrapy.Spider):
    name = 'tong'
    allowed_domains = ['58.com']
    # start_urls = ['http://xa.58.com/zplvyoujiudian/pn1']
    # base_url ='http://xa.58.com/zplvyoujiudian/pn'
    # start_urls = ['http://xa.58.com/tech/pn1']
    # base_url = 'http://xa.58.com/tech/pn'
    # start_urls = ['http://xa.58.com/yewu/pn1']
    # base_url = 'http://xa.58.com/yewu/pn'
    # start_urls = ['http://xa.58.com/xiaoshouzhuli/pn1']
    # base_url = 'http://xa.58.com/xiaoshouzhuli/pn'
    start_urls = ['http://xa.58.com/dianhuaxiaoshou/pn1']
    base_url = 'http://xa.58.com/dianhuaxiaoshou/pn'

    # 解析start_urls里的所有请求 ,生成请求的时候，如果不指定回掉函数，则用parse做为回调
    def parse(self, response):
        # print(response.text)
        job_tr = response.xpath('//li[@class="job_item clearfix"]')
        # print(job_tr)
        for job in job_tr:
            item = {}
            title = job.xpath('.//span[@class="name"]/text()').extract()[0]

            url = job.xpath('./div[@class="item_con job_title"]/div[@class="job_name clearfix"]/a/@href').extract()[0]  # 详情页的链接地址
            url_id = self.md5(url)  # 对获取的详情页地址进行md5加密充当主键

            salary = job.xpath('.//p[@class="job_salary"]/text()').extract()[0]
            company = job.xpath('.//div[@class="comp_name"]/a/text()').extract()[0]

            date_time = response.xpath('.//span[@class="sign"]/text()').extract()[0]
            crawl_time=datetime.date.today()
            crawl_time=str(crawl_time)
            # print(url)
            item['date_time'] = date_time
            item['title'] = title
            item['url'] = url
            item['url_id'] = url_id
            item['salary'] = salary
            item['company'] = company
            item['crawl_time']=crawl_time

            # 发起详情页请求获取职位要求和联系方式
            yield scrapy.Request(url=url,callback=self.parse_detail, meta={'data': item})

        # 创建多个分页请求
        for i in range(1,66):
            fullurl = self.base_url +str(i)
            yield scrapy.Request(url=fullurl,callback=self.parse)

    # 解析详情页
    def parse_detail(self, response):
        # 创建数据对象
        data_item = response.meta
        item = TJobItem()

        address = response.xpath('//div[@class="pos-area"]/span/text()').extract()[2:-1]
        address = ''.join(address)

        detail = response.xpath('//div[@class="des"]/text()').extract()
        detail = ''.join(detail)


        item['address'] = address
        item['detail'] = detail

        for key, value in data_item['data'].items():
            item[key] = value
        yield item

    def md5(self, value):
        md5 = hashlib.md5()
        md5.update(bytes(value, encoding='utf-8'))
        return md5.hexdigest()


