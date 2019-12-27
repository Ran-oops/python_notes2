# -*- coding: utf-8 -*-

# Define here the models for your scraped items
#
# See documentation in:
# http://doc.scrapy.org/en/latest/topics/items.html

import scrapy


class ScrapyTestItem(scrapy.Item):
    # define the fields for your item here like:
    # name = scrapy.Field()
    pass

class TeacherItem(scrapy.Item):
    name = scrapy.Field()# 姓名
    industry = scrapy.Field() # 简介
    teacher_img = scrapy.Field() # 头像地址
    spider_name = scrapy.Field() # 爬虫名称

class Proxy66Item(scrapy.Item):
    host = scrapy.Field()
    port = scrapy.Field()