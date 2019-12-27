# -*- coding: utf-8 -*-

# Define here the models for your scraped items
#
# See documentation in:
# https://doc.scrapy.org/en/latest/topics/items.html

import scrapy


class Py04SpiderDay12Item(scrapy.Item):
    # define the fields for your item here like:
    # name = scrapy.Field()
    pass

class CnblogItem(scrapy.Item):
    url_id=scrapy.Field()
    url=scrapy.Field()
    title=scrapy.Field()
    industry=scrapy.Field()
    author=scrapy.Field()
    date_pub=scrapy.Field()


























