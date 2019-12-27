# -*- coding: utf-8 -*-
import scrapy
from hah.items import TeacherItem

class XdlSpider(scrapy.Spider):
    name = 'xdl'
    allowed_domains = ['http://www.itxdl.cn/']
    start_urls = ['http://www.itxdl.cn/activity/teacher/teacher_lieibiao/']

    def parse(self, response):
        teacher_list=response.xpath('//div[@class="php_jiangshi_liebiao"]')

        for teacher in teacher_list:
            #实例化数据对象
            item=TeacherItem()

            #xpath规则获取数据
            name=teacher.xpath('.//h1/text()').extract()[0]
            industry=teacher.xpath('.//p/text()').extract()[0]

            #给数据对象加载数据
            item['name']=name
            item['industry']=industry

            #把item交给管道文件
            yield item


