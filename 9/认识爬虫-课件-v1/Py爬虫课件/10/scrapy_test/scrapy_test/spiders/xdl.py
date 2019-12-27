# -*- coding: utf-8 -*-
import scrapy
from scrapy_test.items import TeacherItem

class XdlSpider(scrapy.Spider):
    name = 'xdl'
    allowed_domains = ['baidu.com']
    start_urls = ['http://www.itxdl.cn/activity/teacher/teacher_lieibiao/']

    def parse(self, response):
        teacher_list = response.xpath('//div[@class="php_jiangshi_liebiao"]')
        for teacher in teacher_list:
            # 实例化数据对象
            item = TeacherItem()

            # xpath规则获取数据
            # name = teacher.xpath('.//h1/text()').extract()[0]
            # industry = teacher.xpath('.//p/text()').extract()[0]

            # css选择器获取数据
            name = teacher.css('h1::text').extract()[0]
            industry = teacher.css('p::text').extract()[0]
            teacher_img = teacher.css('img::attr(src)').extract()[0]


            # 给数据对象加载数据
            item['name'] = name
            item['industry'] = industry
            item['teacher_img'] = teacher_img

            # 把item 交给管道文件
            yield item
