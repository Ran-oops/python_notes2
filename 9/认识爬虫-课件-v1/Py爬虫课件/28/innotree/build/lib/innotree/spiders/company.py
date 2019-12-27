# -*- coding: utf-8 -*-
import scrapy
import json
from innotree import settings
import os
from urllib import request

class CompanySpider(scrapy.Spider):
    name = 'company'
    allowed_domains = ['innotree.com', 'innotree.cn']
    start_urls = ['https://www.innotree.cn/']
    base_urls = 'https://www.innotree.cn/inno/search/ajax/getCompanySearchResultV2?query=&areaName=%s&rounds=%s&st=%d&ps=10&sEdate=-1&sFdate=1&sRound=-1&chainName='

    # 初始化方法
    def __init__(self,**kwargs):
        # 父类初始化方法
        super(CompanySpider, self).__init__(self,**kwargs)

        with open('data.json', 'r', encoding='utf-8') as f:
            data = f.read()
            self.data = json.loads(data) # json转为数据字典

    custom_settings = {
        'DEFAULT_REQUEST_HEADERS': {
            "Host": "www.innotree.cn",
            "Connection": "keep-alive",
            "Accept": "application/json, text/javascript, */*; q=0.01",
            "X-Requested-With": "XMLHttpRequest",
            "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36",
            "Referer": "https://www.innotree.cn/inno/database/totalDatabase",
            "Accept-Encoding": "gzip, deflate, br",
            "Accept-Language": "zh-CN,zh;q=0.9",
            # "Cookie": "_user_identify_=1b196ed1-4dd8-341f-93a5-124e6061e7ff; uID=461815; sID=2e1175987b559688eb74d364c2dcc00d; JSESSIONID=aaaR6GRZANEn29kxORBcw; Hm_lvt_37854ae85b75cf05012d4d71db2a355a=1514430099,1514440395; Hm_lvt_ddf0d99bc06024e29662071b7fc5044f=1514430099,1514440395; Hm_lpvt_37854ae85b75cf05012d4d71db2a355a=1514441009; Hm_lpvt_ddf0d99bc06024e29662071b7fc5044f=1514441009",
        }
    }

    Cookie = {
        "_user_identify_": "1b196ed1-4dd8-341f-93a5-124e6061e7ff",
        "uID": "461815",
        "sID": "2e1175987b559688eb74d364c2dcc00d",
        "JSESSIONID": "aaaR6GRZANEn29kxORBcw",
        "Hm_lvt_37854ae85b75cf05012d4d71db2a355a": "1514430099,1514440395",
        "Hm_lvt_ddf0d99bc06024e29662071b7fc5044f": "1514430099,1514440395",
        "Hm_lpvt_37854ae85b75cf05012d4d71db2a355a": "1514441009",
        "Hm_lpvt_ddf0d99bc06024e29662071b7fc5044f": "1514441009",
    }

    # def start_requests(self):
    #     base_url = 'https://www.innotree.cn/inno/database/totalDatabase'
    #     yield scrapy.Request(url=base_url,headers=self.custom_settings['DEFAULT_REQUEST_HEADERS'],cookies=self.Cookie)


    def parse(self, response):
        for area in self.data['areaList']:
            fullurl = self.base_urls % (area['name'], '', 1)
            yield scrapy.Request(url=fullurl, callback=self.parse_first, cookies=self.Cookie,
                                 meta={"prov": area['name']})

    # 解析第一页
    def parse_first(self, response):
        # 获取地区名称
        prov = response.meta['prov']

        data = json.loads(response.text)['data']
        count = data['company']['count']  # 从json里获取总条数
        count = int(count)
        if count <= 10000: # 数据能够分页显示全部，构建分页请求
            for page in range(1, int(count / 10) + 1):
                # print(self.base_urls % (prov,'',page))
                yield scrapy.Request(url=self.base_urls % (prov, '', page), callback=self.parse_list)
        else:# 数据超过10000， 需要再分类
            # 循环子类（轮次）
            # 构建分页请求
            for round in self.data['roundList']:
                # for page in range(1, 999 + 1): # 分页循环
                yield scrapy.Request(url=self.base_urls % (prov, round['id'], 1), callback=self.parse_round,meta={'prov':prov,'round':round['id']})

    def parse_round(self,response):
        prov = response.meta['prov']
        round = response.meta['round']

        data = json.loads(response.text)['data']
        count = data['company']['count']  # 从json里获取总条数
        count = int(count)

        # 构建分页请求
        for page in range(1,int(count/10 + 1) + 1):
            yield scrapy.Request(url=self.base_urls % (prov,round,page),callback=self.parse_list)

    # 解析列表页
    def parse_list(self, response):

        company = json.loads(response.text)['data']['company']
        company_list = company['infos']

        detail_url = 'https://www.innotree.cn/inno/company/%s.html'

        for company in company_list:
            fullurl = detail_url % company['ncid']
            yield scrapy.Request(url=fullurl,callback=self.parse_detail)

    def parse_detail(self,response):
        title = response.xpath('//h3[@class="mech_170525_nav_h3"]/text()').extract()[0].strip()
        return {'title': title}

