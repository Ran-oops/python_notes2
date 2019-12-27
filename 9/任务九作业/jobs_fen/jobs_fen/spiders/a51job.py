# -*- coding: utf-8 -*-
import scrapy
import datetime
from urllib import request
from jobs_fen.items import JobItem
import hashlib

class A51jobSpider(scrapy.Spider):
    name = 'a51job'
    allowed_domains = ['51job.com']
    base_url='https://search.51job.com/list/200200,000000,0000,32,9,99,%2B,2,'
    start_urls = ['https://search.51job.com/list/200200,000000,0000,32,9,99,%2B,2,1.html']

    def parse(self, response):
        # print(response.text)
        job_tr=response.xpath('//div[@class="dw_table"]//div[@class="el"]')
        # print(job_tr)
        for job in job_tr:
            item={}
            title=job.xpath('./p/span/a/@title').extract()[0]

            url=job.xpath('./p/span/a/@href').extract()[0]  #详情页的链接地址
            # md5 = hashlib.md5()
            # md5.update(bytes(url, encoding='utf-8'))
            # url_id = md5.hexdigest()
            # print(url_id)

            url_id=self.md5(url)   #对获取的详情页地址进行md5加密充当主键

            salary = job.xpath('./span[@class="t4"]/text()').extract()[0]
            company = job.xpath('./span[@class="t2"]/a/text()').extract()[0]
            address = job.xpath('./span[@class="t3"]/text()').extract()[0]
            date_time = job.xpath('./span[@class="t5"]/text()').extract()[0]

            item['title'] = title
            item['url'] = url
            item['url_id'] = url_id
            item['salary'] = salary
            item['company'] = company
            item['address'] = address
            item['date_time'] = date_time

            #发起详情页请求获取职位要求和联系方式
            yield scrapy.Request(url=url,callback=self.parse_detail,meta={'data':item})

        #创建多个分页请求
        for i in range(1, 323):
            fullurl = self.base_url + str(i) + '.html'
            yield scrapy.Request(url=fullurl,callback=self.parse)


    def parse_detail(self,response):
        #创建数据对象
        data_item=response.meta
        item=JobItem()

        detail = response.xpath('//div[@class="bmsg job_msg inbox"]/p/text()').extract()
        for i in detail:
            item['detail']=i

        for key,value in data_item['data'].items():
            item[key]=value
        # yield item
        return item


    def md5(self,value):
        md5=hashlib.md5()
        md5.update(bytes(value,encoding='utf-8'))
        return md5.hexdigest()

