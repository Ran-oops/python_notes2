# -*- coding: utf-8 -*-

# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: https://doc.scrapy.org/en/latest/topics/item-pipeline.html
import json


class HahPipeline(object):
    #负责处理item，存入文件或者存入数据库
    def process_item(self, item, spider):
        return item
'''
class TeacherJsonPipeline(object):
    def __init__(self):
        self.f=open('teacher.json','w',encoding='utf-8')

    #处理item数据对象
    def process_item(self,item,spider):
        item['spider_name']=spider.name
        self.f.write(json.dumps(dict(item)),ensure_ascii=False+'\n')
        #return交给下一个管道文件
        return item

    def close_spider(self,spider):
        self.f.close()
'''
class TeacherJsonPipeline(object):
    def __init__(self):
        self.f=open('teacher.json','w',encoding='utf-8')

    #处理item数据对象
    def process_item(self,item,spider):
        # item['spider_name']=spider.name
        print(item['name'])
        # self.f.write(json.dumps(dict(item)),ensure_ascii=False+'\n')
        self.f.write(json.dumps(dict(item),ensure_ascii=False ) + '\n')
        #return交给下一个管道文件
        return item


class Proxy66JsonPipeline(object):
    def __init__(self):
        self.f=open('proxy.json','w',encoding='utf-8')

        #处理item数据对象
        def process_item(self,item,spider):
            self.f.write(json.dumps(dict(item),ensure_ascii=False)+'\n')
            #return交给下一个管道文件
            return item

        #爬虫结束时调用
        def class_spider(self,spider):
            self.f.close()
