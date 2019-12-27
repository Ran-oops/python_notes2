# -*- coding: utf-8 -*-

# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: https://doc.scrapy.org/en/latest/topics/item-pipeline.html
import json
import pymysql

class Py04SpiderDay11Pipeline(object):
    def process_item(self, item, spider):
        return item

#第一个案例，生成tencent.json
class TencentPipeline(object):
    def __init__(self):
        self.f=open('tencent.json','w',encoding='utf-8')

    #处理item数据对象
    def process_item(self,item,spider):
        # item['spider_name']=spider.name
        print(item['job_name'])
        # self.f.write(json.dumps(dict(item)),ensure_ascii=False+'\n')
        self.f.write(json.dumps(dict(item),ensure_ascii=False ) + '\n')
        #return交给下一个管道文件
        return item
#========================================================================
#======第二个案例生成tencent1.json========================================
class Tencent1Pipeline(object):
    def __init__(self):
        self.f=open('tencent1.json','w',encoding='utf-8')

    #处理item数据对象
    def process_item(self,item,spider):
        # item['spider_name']=spider.name
        print(item['job_name'])
        # self.f.write(json.dumps(dict(item)),ensure_ascii=False+'\n')
        self.f.write(json.dumps(dict(item),ensure_ascii=False ) + '\n')
        #return交给下一个管道文件
        return item
#=========================================================================
#=======第三个案例，生成tencent2.json======================================
class JsonPipeline(object):
    def __init__(self):
        self.f=None
    def process_item(self,item,spider):
        self.f.write(json.dumps(dict(item),ensure_ascii=False)+'\n')
        return item
    def close_spider(self,spider):
        self.f.close()
class TencentJsonPipeline(JsonPipeline):
    def __init__(self):
        self.f=open('tencent2.json','w',encoding='utf-8')
#============================================================================

#===================第四个案例，将数据导入数据库===============================
class TencentMysqlPipeline(object):
    def __init__(self):
        self.conn=pymysql.connect('127.0.0.1','root','','temp',charset='utf8')
        self.cursor=self.conn.cursor()
    def process_item(self,item,spider):
        sql="insert into tencent_job() VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)"
        data = (item["job_name"], item["type"], item["number"], item["location"], item["date_time"], item["url"],item["url_id"], item["duty"], item["requirement"], item["crawl_time"])

        # try:
        self.cursor.execute(sql,data)
        self.conn.commit()
        print('数据加入数据库成功!')
        # except  Exception as e:
        #     self.conn.rollback()
        #     print('数据没有加入数据库！')
    def close_spider(self,spider):
        self.cursor.close()
        self.conn.close()

#============================================================================
class MysqlPipeline(object):
    def __init__(self):
        self.conn=pymysql.connect('127.0.0.1','root','','temp',charset='utf8')
        self.cursor=self.conn.cursor()
    def process_item(self,item,spider):
        pass
    def close_spider(self,spider):
        self.cursor.close()
        self.conn.close()

class TaobaoPipeline(MysqlPipeline):
    def process_item(self,item,spider):
        sql = "insert into goods VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s) on duplicate key update price=VALUES(price)"

        data = (item["pic_url"][0], item["detail_url"], item["shop_name"], item["goods_name"], item["view_sales"],item["item_loc"], item["price"], item['crawl_time'], item['permonth'], item['commentcon'])

        try:
            self.cursor.execute(sql,data)
            self.conn.commit()
        except Exception as e:
            print('插入失败',e)
            self.conn.rollback()

        return item

