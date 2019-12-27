# -*- coding: utf-8 -*-

# Define here the models for your scraped items
#
# See documentation in:
# https://doc.scrapy.org/en/latest/topics/items.html

import scrapy


class Py04SpiderDay15Item(scrapy.Item):
    # define the fields for your item here like:
    # name = scrapy.Field()
    pass

class LagouItem(scrapy.Item):
    url = scrapy.Field()    #主键url
    pname = scrapy.Field()   #职位名称
    smoney = scrapy.Field()  #薪资底限
    emoney = scrapy.Field()  #薪资上限
    location = scrapy.Field()  #地区
    syear = scrapy.Field()  #工作经验开始年限
    eyear = scrapy.Field()  #工作经验结束年限
    degree = scrapy.Field() #学历
    ptype = scrapy.Field()  #招聘类型
    tags = scrapy.Field()   #标签
    date_pub = scrapy.Field()#发布日期
    advantage = scrapy.Field() #职位诱惑
    jobdesc = scrapy.Field()  #职位描述
    jobaddr = scrapy.Field()  #地址
    company = scrapy.Field()  #公司
    crawl_time = scrapy.Field()  #爬取时间
