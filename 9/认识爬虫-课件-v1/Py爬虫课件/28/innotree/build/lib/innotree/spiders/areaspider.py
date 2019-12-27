# -*- coding: utf-8 -*-
import scrapy
import json
from innotree import settings
import os

class AreaspiderSpider(scrapy.Spider):
    name = 'area'
    allowed_domains = ['innotree.cn']
    base_url = 'https://www.innotree.cn/inno/screening/ajax/getAllScreeningsForInvestDB'

    headers = {
        "Host": "www.innotree.cn",
        "Connection": "keep-alive",
        "Accept": "application/json, text/javascript, */*; q=0.01",
        "X-Requested-With": "XMLHttpRequest",
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36",
        "Referer": "https://www.innotree.cn/inno/database/totalDatabase",
        "Accept-Encoding": "gzip, deflate, br",
        "Accept-Language": "zh-CN,zh;q=0.9",
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

    def start_requests(self):
        yield scrapy.Request(url=self.base_url,headers=self.headers,cookies=self.Cookie)

    def parse(self, response):
        data = json.loads(response.text)['data']

        with open("data.json",'w',encoding='utf-8') as f:
            data = json.dumps(data,ensure_ascii=False,indent=4)
            f.write(data)




