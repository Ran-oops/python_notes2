# -*- coding: utf-8 -*-

# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: http://doc.scrapy.org/en/latest/topics/item-pipeline.html
import json
import pymysql


class Py03SpiderDay14Pipeline(object):
    def process_item(self, item, spider):
        return item


class LagouESPipeline(object):
    def process_item(self, item, spider):
        item.save_to_es()
        return item
