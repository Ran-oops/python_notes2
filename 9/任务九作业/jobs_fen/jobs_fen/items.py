# -*- coding: utf-8 -*-

# Define here the models for your scraped items
#
# See documentation in:
# https://doc.scrapy.org/en/latest/topics/items.html

import scrapy


class JobsFenItem(scrapy.Item):
    # define the fields for your item here like:
    # name = scrapy.Field()
    pass

class JobItem(scrapy.Item):
    url = scrapy.Field()  # 职位信息
    url_id = scrapy.Field()  # 职位信息
    title=scrapy.Field()  #职位名称
    salary=scrapy.Field()  #薪资
    company=scrapy.Field()  #公司名称
    address=scrapy.Field()  #公司地址
    detail = scrapy.Field()  #职位信息
    date_time = scrapy.Field()  # 职位信息


class TJobItem(scrapy.Item):
    url = scrapy.Field()  # 职位信息
    url_id = scrapy.Field()  # 职位信息
    title=scrapy.Field()  #职位名称
    salary=scrapy.Field()  #薪资
    company=scrapy.Field()  #公司名称
    address=scrapy.Field()  #公司地址
    detail = scrapy.Field()  #职位信息
    date_time = scrapy.Field()  # 职位信息
    crawl_time=scrapy.Field()

