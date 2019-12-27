# -*- coding: utf-8 -*-
import scrapy
import hashlib

class CnblogSpider(scrapy.Spider):
    name = 'cnblog'
    allowed_domains = ['cnblogs.com']
    base_url = 'https://www.cnblogs.com/sitehome/p/%d'
    start_urls = ['https://www.cnblogs.com/']

    def parse(self, response):
        # 生成列表页请求
        for i in range(1,10 + 1):
            fullurl = self.base_url % i
            yield scrapy.Request(fullurl,callback=self.parse_list)


    def parse_list(self,response):
        article_list = response.xpath('//div[@class="post_item"]')
        for article in article_list:
            url = article.xpath('.//h3/a/@href').extract()[0]
            url_id = self.md5(url)
            title = article.xpath('.//h3/a/text()').extract()[0]
            industry = article.xpath('.//p[@class="post_item_summary"]/text()').extract()[0]
            author = article.xpath('.//a[@class="lightblue"]/text()').extract()[0]
            date_pub = article.xpath('.//div[@class="post_item_foot"]/text()').extract()[0]


    def md5(self,value):
        md5 = hashlib.md5()
        md5.update(bytes(value,'utf-8'))
        return md5.hexdigest()


