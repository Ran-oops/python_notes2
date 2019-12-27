# -*- coding: utf-8 -*-
import scrapy
from py04_spider_day11.items import TaobaoItem
import hashlib
from urllib import request
class TaobaoSpider(scrapy.Spider):
    name = 'taobao'
    allowed_domains = ['taobao.com']
    base_url='https://s.taobao.com/search?q=吉他&s=%d'
    start_urls = []
    for i in range(0, 88+1, 44):
        fullurl = base_url % i
        start_urls.append(fullurl)

    def parse(self, response):
        #生成列表页请求
        box=response.xpath('//div[@class="ctx-box J_MouseEneterLeave J_IconMoreNew"]')

        item=TaobaoItem()
        # goods_price=box.xpath('//div[@class="ctx-box J_MouseEneterLeave J_IconMoreNew"]//strong/text()')
        goods_price = box.xpath('.//strong/text()').extract()

        checkout_num=box.xpath('.//div[@class="deal-cnt"]/text()').extract()
        detail_url = box.xpath('.//div[@class="row row-2 title"]/a/@href').extract()
        detail_url=request.urljoin(response.url,detail_url)
        url_id=self.md5(detail_url)

        desc = box.xpath('.//div[@class="row row-2 title"]/a').extract()
        shop_name=box.xpath('.//div[@class="shop"]//span[2]/text()').extract()
        shop_loc=box.xpath('.//div[@class="location"]/text()').extract()
        print(goods_price)
        print(checkout_num)
        print(url_id)
        print(desc)
        print(shop_name)

        item['goods_price']=goods_price
        item['checkout_num']=checkout_num
        item['detail_url']=detail_url
        item['url_id']=url_id
        item['desc'] = desc
        item['shop_name'] = shop_name
        item['shop_loc'] = shop_loc


        yield item

    def md5(self,value):
        md5=hashlib.md5()
        md5.update(bytes(value,encoding='utf-8'))
        return md5.hexdigest()


