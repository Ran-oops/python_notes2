# -*- coding: utf-8 -*-

# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: http://doc.scrapy.org/en/latest/topics/item-pipeline.html
import pymysql

class Py04SpiderDay13Pipeline(object):
    def process_item(self, item, spider):
        return item



class XiciPipeline(object):

    def __init__(self, cralwer):
        self.crawler = cralwer
        mysql = self.crawler.settings['MYSQL_INFO']
        self.conn = pymysql.connect(mysql['MYSQL_HOST'],mysql['MYSQL_USER'],mysql['MYSQL_PASS'],mysql['MYSQL_DB'],charset='utf8')
        self.cursor = self.conn.cursor()

    @classmethod
    def from_crawler(cls, cralwer):
        return cls(cralwer)

    def process_item(self,item,spider):
        try:
            sql = 'insert into xici(host,port) VALUES(%s,%s) on duplicate key update port=VALUES(port)'
            data = (item['host'],item['port'])
            self.cursor.execute(sql,data)
            self.conn.commit()
        except Exception as e:
            self.conn.rollback()
            print(e)

        return item


