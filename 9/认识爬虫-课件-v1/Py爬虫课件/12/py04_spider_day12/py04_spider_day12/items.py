# -*- coding: utf-8 -*-

# Define here the models for your scraped items
#
# See documentation in:
# http://doc.scrapy.org/en/latest/topics/items.html

import scrapy


class Py04SpiderDay12Item(scrapy.Item):
    # define the fields for your item here like:
    # name = scrapy.Field()
    pass

class CnblogItem(scrapy.Item):
    url_id = scrapy.Field()
    url = scrapy.Field()
    title = scrapy.Field()
    industry = scrapy.Field()
    content = scrapy.Field()
    author = scrapy.Field()
    date_pub = scrapy.Field()
    comment_num = scrapy.Field()
    view_num = scrapy.Field()
    vote_num = scrapy.Field()
    img_url = scrapy.Field()
    img_path = scrapy.Field()
    tags = scrapy.Field()
    crawl_time = scrapy.Field()