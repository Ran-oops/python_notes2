# -*- coding: utf-8 -*-

# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: https://doc.scrapy.org/en/latest/topics/item-pipeline.html

import pymysql
import json

class JobsFenPipeline(object):
    def process_item(self, item, spider):
        return item

class Job51Pipeline(object):
    def __init__(self):
        self.conn=pymysql.connect('127.0.0.1','root','','jobs',charset='utf8')
        self.cursor=self.conn.cursor()

    def process_item(self,item,spider):
        sql='insert into job51(url_id,date_time,salary,title,company,address,detail) VALUES (%s,%s,%s,%s,%s,%s,%s)'\
        'on duplicate key update url_id=VALUES(url_id)'
        data=(item['url_id'],item['date_time'],item['salary'],item['title'],item['company'],item['address'],item['detail'])
        # try:
        self.cursor.execute(sql,data)
        self.conn.commit()
        print('插入数据成功！')
        # except Exception as e:
        #     self.conn.rollback()
        return item
    def close_spider(self,spider):
        self.cursor.close()
        self.conn.close()

class Job51JsonPipeline(object):
    def __init__(self):
        self.f=open('job51.json','w',encoding='utf-8')
    def process_item(self,item,spider):
        self.f.write(json.dumps(dict(item),ensure_ascii=False)+'\n')
        return item
    def close_spider(self,spider):
        self.f.close()

class LJobPipeline(object):
    def __init__(self):
        self.conn=pymysql.connect('127.0.0.1','root','','jobs',charset='utf8')
        self.cursor=self.conn.cursor()

    def process_item(self,item,spider):
        sql='insert into lagou(url_id,date_time,salary,title,company,address,detail) VALUES (%s,%s,%s,%s,%s,%s,%s)'\
        'on duplicate key update url_id=VALUES(url_id)'
        data=(item['url_id'],item['date_time'],item['salary'],item['title'],item['company'],item['address'],item['detail'])
        # try:
        self.cursor.execute(sql,data)
        self.conn.commit()
        print('插入数据成功！')
        # except Exception as e:
        #     self.conn.rollback()
        return item
    def close_spider(self,spider):
        self.cursor.close()
        self.conn.close()

class LJobJsonPipeline(object):
    def __init__(self):
        self.f=open('Z.json','w',encoding='utf-8')
    def process_item(self,item,spider):
        self.f.write(json.dumps(dict(item),ensure_ascii=False)+'\n')
        return item
    def close_spider(self,spider):
        self.f.close()

class ZJobPipeline(object):
    def __init__(self):
        self.conn=pymysql.connect('127.0.0.1','root','','jobs',charset='utf8')
        self.cursor=self.conn.cursor()

    def process_item(self,item,spider):
        sql='insert into zhonghua(url_id,date_time,salary,title,company,address,detail) VALUES (%s,%s,%s,%s,%s,%s,%s)'\
        'on duplicate key update url_id=VALUES(url_id)'
        data=(item['url_id'],item['date_time'],item['salary'],item['title'],item['company'],item['address'],item['detail'])
        # try:
        self.cursor.execute(sql,data)
        self.conn.commit()
        print('插入数据成功！')
        # except Exception as e:
        #     self.conn.rollback()
        return item
    def close_spider(self,spider):
        self.cursor.close()
        self.conn.close()

class TJobPipeline(object):
    def __init__(self):
        self.conn=pymysql.connect('127.0.0.1','root','','jobs',charset='utf8')
        self.cursor=self.conn.cursor()

    def process_item(self,item,spider):
        sql='insert into tongcheng(url_id,date_time,salary,title,company,address,detail,crawl_time) VALUES (%s,%s,%s,%s,%s,%s,%s,%s)'\
        'on duplicate key update url_id=VALUES(url_id)'
        data=(item['url_id'],item['date_time'],item['salary'],item['title'],item['company'],item['address'],item['detail'],item['crawl_time'])
        # try:
        self.cursor.execute(sql,data)
        self.conn.commit()
        print('插入数据成功！')
        # except Exception as e:
        #     self.conn.rollback()
        return item
    def close_spider(self,spider):
        self.cursor.close()
        self.conn.close()