# -*- coding: utf-8 -*-

# Define here the models for your scraped items
#
# See documentation in:
# http://doc.scrapy.org/en/latest/topics/items.html

import scrapy
from py03_spider_day14.models.es_type import LagouType
import hashlib

# 创建es对象  调用分词接口
from elasticsearch_dsl.connections import connections
es = connections.create_connection(LagouType._doc_type.using)


class Py03SpiderDay14Item(scrapy.Item):
    # define the fields for your item here like:
    # name = scrapy.Field()
    pass

def md5(value):
    m = hashlib.md5()
    m.update(bytes(value,'utf-8'))
    return m.hexdigest()

def get_suggest(index,info_tuple):
    # ('python工程师',5),('python职位描述',3)
    used = set() # 词去重集合
    suggests = [] # 结果返回列表
    for text,weight,analyzer in info_tuple:
        if text:
            # 调用分析器
            words = es.indices.analyze(index=index,analyzer=analyzer,body=text)
            new_words = set([item['token'] for item in words['tokens'] if len(item['token']) > 0])
            new_words = new_words - used
        else:
            new_words = set()

        if new_words:
            used = used | new_words
            suggests.append({'input':list(new_words),'weight':weight})

    return suggests


class LagouItem(scrapy.Item):
    url = scrapy.Field()
    pname = scrapy.Field()
    smoney = scrapy.Field()
    emoney = scrapy.Field()
    location = scrapy.Field()
    syear = scrapy.Field()
    eyear = scrapy.Field()
    degree = scrapy.Field()
    ptype = scrapy.Field()
    tags = scrapy.Field()
    date_pub = scrapy.Field()
    advantage = scrapy.Field()
    jobdesc = scrapy.Field()
    jobaddr = scrapy.Field()
    company = scrapy.Field()
    crawl_time = scrapy.Field()

    # 数据存入es中
    def save_to_es(self):
        type = LagouType()

        type.url = self['url']
        type._id = md5(self['url'])
        type.pname = self['pname']
        type.smoney = int(self['smoney'])
        type.emoney = int(self['emoney'])
        type.location = self['location']
        type.syear = int(self['syear'])
        type.eyear = int(self['eyear'])
        type.degree = self['degree']
        type.ptype = self['ptype']
        type.tags = self['tags']
        type.date_pub = self['date_pub']
        type.advantage = self['advantage']
        type.jobdesc = self['jobdesc']
        type.jobaddr = self['jobaddr']
        type.company = self['company']
        type.crawl_time = self['crawl_time']

        # 构建搜索建议
        # type.suggest = [{'input':['python','工程师'],'weight':5},{'input':['django','程序员'],'weight':2}]
        type.suggest = get_suggest(LagouType._doc_type.index,[(self['pname'],5,'ik_max_word'),(self['jobdesc'],2,'ik_smart')])
        type.save()

if __name__ == '__main__':
    get_suggest(LagouType._doc_type.index,[('python工程师',5),('python职位描述',3)])