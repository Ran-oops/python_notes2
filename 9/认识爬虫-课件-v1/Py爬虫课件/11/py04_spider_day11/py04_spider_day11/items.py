# -*- coding: utf-8 -*-

# Define here the models for your scraped items
#
# See documentation in:
# http://doc.scrapy.org/en/latest/topics/items.html

import scrapy


class Py04SpiderDay11Item(scrapy.Item):
    # define the fields for your item here like:
    # name = scrapy.Field()
    pass

class TencentItem(scrapy.Item):
    job_name = scrapy.Field()
    type = scrapy.Field()
    number = scrapy.Field()
    location = scrapy.Field()
    date_time = scrapy.Field() # 发布日期
    url = scrapy.Field()
    url_id = scrapy.Field() # 主键
    duty = scrapy.Field()
    requirement = scrapy.Field()
    crawl_time = scrapy.Field() # 爬虫抓取时间

class TaobaoItem(scrapy.Item):
    pic_url = scrapy.Field()
    detail_url = scrapy.Field()
    shop_name = scrapy.Field()
    goods_name = scrapy.Field()
    view_sales = scrapy.Field()
    item_loc = scrapy.Field()
    price = scrapy.Field()
    crawl_time = scrapy.Field()
    permonth = scrapy.Field()
    commentcon = scrapy.Field()
