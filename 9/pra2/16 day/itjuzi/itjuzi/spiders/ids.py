# -*- coding: utf-8 -*-
import scrapy
import json

class IdsSpider(scrapy.Spider):
    name = 'ids'
    allowed_domains = ['itjuzi.com']
    start_urls = ['https://www.itjuzi.com/company?scope=1']
    ids = {
        'scope_list' : [],
        'subscope_list' : {
        }
    }

    custom_settings = {
        'DEFAULT_REQUEST_HEADERS' : {
            "Host": "www.itjuzi.com",
            "Connection": "keep-alive",
            "Pragma": "no-cache",
            "Cache-Control": "no-cache",
            "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36",
            "Upgrade-Insecure-Requests": "1",
            "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8",
            #"Accept-Encoding": "gzip, deflate, br",
            "Accept-Language": "zh-CN,zh;q=0.9",
            # "Cookie": "gr_user_id=8fb1d17c-9a25-43b9-a986-17805d4f96d0; _ga=GA1.2.1559810615.1514384305; _gid=GA1.2.951578547.1514384305; acw_tc=AQAAAETcpEKwGA4AM09FeWpvRnuY2lyd; Hm_lvt_1c587ad486cdb6b962e94fc2002edf89=1514384305,1514421589; gr_session_id_eee5a46c52000d401f969f4535bdaa78=5d83c3e7-139e-42dc-b0db-c07621c1c5c3; gr_cs1_5d83c3e7-139e-42dc-b0db-c07621c1c5c3=user_id%3A; session=4e59ba6e20f82cb6ae5c6d31fb5ff821b32997f9; Hm_lpvt_1c587ad486cdb6b962e94fc2002edf89=1514423773; _gat=1",
        }
    }

    def parse(self, response):
        # 获取所有行业id
        scope_ids = response.xpath('//ul[@class="ui-filterui"]/li[1]//a/@href').extract()[2:]
        scope_ids = [id.split('=')[-1] for id in scope_ids]
        self.ids['scope_list'] = scope_ids

        # 获投状态id
        fund_ids = response.xpath('//ul[@class="ui-filterui"]/li[3]//a/@href').extract()[1:]
        print(fund_ids)
        fund_ids = [id.split('=')[-1] for id in fund_ids]
        self.ids['fund_ids'] = fund_ids
        # 地区
        scope_ids = response.xpath('//ul[@class="ui-filterui"]/li[4]//a/@href').extract()[1:]
        scope_ids = [id.split('=')[-1] for id in scope_ids]
        self.ids['scope_list'] = scope_ids
        # 阶段
        prov_ids = response.xpath('//ul[@class="ui-filterui"]/li[5]//a/@href').extract()[1:]
        prov_ids = [id.split('=')[-1] for id in prov_ids]
        self.ids['prov_ids'] = prov_ids
        # 融资需求
        fund_needs_ids = response.xpath('//ul[@class="ui-filterui"]/li[6]//a/@href').extract()[1:]
        fund_needs_ids = [id.split('=')[-1] for id in fund_needs_ids]
        self.ids['fund_needs_ids'] = fund_needs_ids
        # 成立时间
        born_year_ids = response.xpath('//ul[@class="ui-filterui"]/li[7]//a/@href').extract()[1:]
        born_year_ids = [id.split('=')[-1] for id in born_year_ids]
        self.ids['born_year_ids'] = born_year_ids
        # 状态
        status_ids = response.xpath('//ul[@class="ui-filterui"]/li[8]//a/@href').extract()[1:]
        status_ids = [id.split('=')[-1] for id in status_ids]
        self.ids['status_ids'] = status_ids


        base_url = 'https://www.itjuzi.com/company?scope=%s'
        for id in scope_ids:
            yield scrapy.Request(url=base_url % id,callback=self.parse_subscope)

    # 获取子行业id
    def parse_subscope(self,response):
        scope_id = response.url.split('=')[-1]
        sub_scope_ids = response.xpath('//ul[@class="ui-filterui"]/li[2]//a/@href').extract()[1:]
        sub_scope_ids = [id.split('=')[-1] for id in sub_scope_ids]
        self.ids['subscope_list'][scope_id] = sub_scope_ids

    # 爬虫结束被调用
    def close(spider, reason):
        print(json.dumps(spider.ids,indent=4))