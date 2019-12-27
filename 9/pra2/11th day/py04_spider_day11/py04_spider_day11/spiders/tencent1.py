# -*- coding: utf-8 -*-
import scrapy
from py04_spider_day11.items import TencentItem
from urllib import request
import hashlib
import datetime


class TencentSpider(scrapy.Spider):
    name = 'tencent1'
    allowed_domains = ['tencent.com']
    base_url='http://hr.tencent.com/position.php?start=%d'
    start_urls = ['http://hr.tencent.com/position.php?start=0']

    headers={

    }

    cookies={

    }

    #解析start_urls里的所有请求，生成请求的时候，如果不指定回调函数，则用parse作为回调
    def parse(self, response):
        job_tr=response.xpath('//tr[@class="even"] | //tr[@class="odd"]')
        for job in job_tr:
            item=TencentItem()
            #//[td][1]   这种写法说明 td有很多兄弟标签  [1] 代表第一个[td]
            job_name=job.xpath('.//td[1]/a/text()').extract()[0]
            url=job.xpath('.//td[1]/a/@href').extract()[0]

            #通过response获取url,然后将获取的url与url进行拼接
            url=request.urljoin(response.url,url)

            #md5() 这个函数是在类里定义的 调用又是在类里面调用的 所以加self
            url_id=self.md5(url)  #主键

            type=job.xpath('.//td[2]/text()').extract()[0]
            number = job.xpath('.//td[3]/text()').extract()[0]
            location = job.xpath('.//td[4]/text()').extract()[0]
            date_time = job.xpath('.//td[5]/text()').extract()[0]

            item['job_name']=job_name
            item['url'] =url
            item['url_id'] =url_id
            item['type'] =type
            item['number'] =number
            item['location'] =location
            item['date_time'] =date_time
            item['crawl_time'] =datetime.datetime.now().strftime('%Y-%m-%d')

            yield item
        #获取下一页链接
        next_url=response.xpath('//a[@id="next"]/@href').extract()[0]
        next_url=request.urljoin(response.url,next_url)
        print(next_url)

        #生成下一页请求
        if next_url.split('=')[-1] !='100#a':
            yield scrapy.Request(url=next_url,headers=self.headers,cookies=self.cookies,callback=self.parse)

    def md5(self,value):
        md5=hashlib.md5()
        md5.update(bytes(value,encoding='utf-8'))
        return md5.hexdigest()

    def getvalue(self,value):
        return value[0] if value else ''
