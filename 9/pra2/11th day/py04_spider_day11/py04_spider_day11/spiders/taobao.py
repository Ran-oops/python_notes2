# -*- coding: utf-8 -*-
import scrapy
from py04_spider_day11.items import TaobaoItem
import hashlib
from urllib import request
import re
import json
import jsonpath
import datetime

class TaobaoSpider(scrapy.Spider):
    name = 'taobao'
    allowed_domains = ['taobao.com']
    base_url='https://s.taobao.com/search?q=电子琴&s=%d'
    start_urls = ['https://www.taobao.com']

    def parse(self,response):
        #生成列表页请求
        for i in range(0,1,44):
            fullurl=self.base_url % i
            #yield会让它加入到队列里面
            yield scrapy.Request(fullurl,callback=self.parselist,meta={'phantomjs':False})

    #解析列表页
    def parselist(self,response):
        html=response.text
        data_pat=re.compile(r'g_page_config = (.*)\n')
        res=data_pat.search(html)
        if res is not None:
            item=TaobaoItem()
            data=res.group(1).strip(';')  #把后面的分号去掉
            data=json.loads(data)
            res=jsonpath.jsonpath(data,'$..auctions.*')
            #格式化
            # print(json.dumps(res,ensure_ascii=False,indent=4))
            #print(res)
            for goods in res:
                shop_name=goods['nick']
                goods_name=goods['raw_title']

                view_sales=goods['view_sales']
                view_sales=self.get_number(view_sales)  #获取数字

                detail_url=goods['detail_url']
                detail_url=request.urljoin(response.url,detail_url)
                item_loc=goods['item_loc']
                price=goods['view_price']

                pic_url=goods['pic_url']
                pic_url=request.urljoin(response.url,pic_url)
                # print(item)
                # print(pic_url)
                # print(detail_url)
                # print(shop_name,goods_name,view_sales,item_loc,price)
                # 加载数据到数据模型中
                item["pic_url"] = [pic_url]
                item["detail_url"] = detail_url
                item["shop_name"] = shop_name
                item["goods_name"] = goods_name
                item["view_sales"] = view_sales
                item["item_loc"] = item_loc
                item["price"] = price
                item['crawl_time'] = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')

            # print(len(res))
                yield scrapy.Request(url=detail_url,callback=self.parse_detail,meta={'data':item,'phantomjs':True},dont_filter=True)
                #dont_filter=True写这个是为了允许重复请求。因为默认是请求地址不允许重复
                #priority是设置优先级

    def parse_detail(self,response):
        # print(response.body)
        #要想办法插入selenium，这样才可以获取到月销量。但是要注意的是现在response已经响应了。
        #通过中间件的干涉现在可以得到selenium获取的内容了
        #提取月销量，现在就可以按照淘宝详情页面的内容进行提取了
        item=response.request.meta['data']

        if 'tm-count' in response.text:  # 天猫页面
            info = response.xpath('//span[@class="tm-count"]/text()').extract()
            permonth = info[0]
            commentcon = info[1]
            # print('天猫',permonth, commentcon)

        else:  # 淘宝页面
            permonth = response.xpath('//strong[@id="J_SellCounter"]/text()').extract()[0]
            commentcon = response.xpath('//strong[@id="J_RateCounter"]/text()').extract()[0]

            # print('淘宝',permonth, commentcon)

        item['permonth']=permonth
        item['commentcon']=commentcon

        yield item

    def get_number(self,value):
        number_get=re.compile(r'\d+')
        res=number_get.search(value)
        if res is not None:
            return res.group()
        else:
            return 0
