# -*- coding: utf-8 -*-

# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: http://doc.scrapy.org/en/latest/topics/item-pipeline.html


class Py04SpiderDay14Pipeline(object):
    def __init__(self):
        self.f = open('job','w',encoding='utf-8')
    def process_item(self, item, spider):
        print(item['title'])
        self.f.write(item['title'] + '\n')
        return item

    def close_spider(self,spider):
        self.f.close()
