# -*- coding: utf-8 -*-
import scrapy
import datetime
from urllib import request
from jobs_fen.items import JobItem
import hashlib

class LagouSpider(scrapy.Spider):
    name = 'lagou'
    allowed_domains = ['lagou.com']
    start_urls = ['https://www.lagou.com/zhaopin/']
    # base_url='https://www.lagou.com/zhaopin/'
    # base_url ='https://www.lagou.com/zhaopin/shijueshejishi/'
    # base_url ='https://www.lagou.com/zhaopin/jinrongtouzijingli/'
    # base_url = 'https://www.lagou.com/zhaopin/jinrongfengkong/'
    base_url=[
    #     'https://www.lagou.com/zhaopin/jinrongtouzijinglli/',
    #     'https://www.lagou.com/zhaopin/jinrongfenxishi/',
    #     'https://www.lagou.com/zhaopin/touzizhuli/',
    #     'https://www.lagou.com/zhaopin/rongzi/',
    #     'https://www.lagou.com/zhaopin/binggou/',
    #     'https://www.lagou.com/zhaopin/hangyeyanjiu/',
    #     'https://www.lagou.com/zhaopin/touzizheguanxi/',
    #     'https://www.lagou.com/zhaopin/zichanguanlli/',
    #     'https://www.lagou.com/zhaopin/licaiguwen/',
    #     'https://www.lagou.com/zhaopin/jiaoyiyuan/',
    #     'https://www.lagou.com/zhaopin/shichangyingxiao1/',
    #     'https://www.lagou.com/zhaopin/shichangcehua/',
    #     'https://www.lagou.com/zhaopin/shichangtuiguang/',
    #     'https://www.lagou.com/zhaopin/SEO/',
    #     'https://www.lagou.com/zhaopin/SEM/',
    #     'https://www.lagou.com/zhaopin/shangwuqudao/',
    #     'https://www.lagou.com/zhaopin/shangyeshujufenxi/',
    #     'https://www.lagou.com/zhaopin/Python/',
    #     'https://www.lagou.com/zhaopin/shujuwajue/',
    #     'https://www.lagou.com/zhaopin/HTML5/',
        'https://www.lagou.com/zhaopin/Android/',
        'https://www.lagou.com/zhaopin/iOS/',
        'https://www.lagou.com/zhaopin/WP/',
        'https://www.lagou.com/zhaopin/yidongkaifaqita/',
        'https://www.lagou.com/zhaopin/webqianduan/',
        'https://www.lagou.com/zhaopin/Flash/',

    ]


    custom_settings = {
        'COOKIES_ENABLED' : True
    }

    headers = {
        "Accept":"text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8",
        "Accept-Encoding":"gzip, deflate, br",
        "Accept-Language":"zh-CN,zh;q=0.9",
        "Connection":"keep-alive",
        "Host":"www.lagou.com",
        "Upgrade-Insecure-Requests":"1",
        "User-Agent":"Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36",
    }
    cookie = {
        "JSESSIONID":"ABAAABAABEEAAJA9C49FDA8301BBFF30B32A50E5B629505",
        " user_trace_token":"20180818200643-3382fe2f-a672-4b6f-a6ac-6c851526bbb5",
        " _ga":"GA1.2.1739772344.1534594089",
        " LGUID":"20180818200643-2c4f5441-a2df-11e8-9241-525400f775ce",
        " _gid":"GA1.2.766375012.1534594090",
        " Hm_lvt_4233e74dff0ae5bd0a3d81c6ccf756e6":"1534594090",
        " X_HTTP_TOKEN":"726e8b8f3e59abcd79ed7820dd9bfe5a",
        " showExpriedIndex":"1",
        " showExpriedCompanyHome":"1",
        " showExpriedMyPublish":"1",
        " hasDeliver":"0",
        " X_MIDDLE_TOKEN":"f37c5e88934134fde73363ae45a62d02",
        " index_location_city":"%E5%85%A8%E5%9B%BD",
        " SEARCH_ID":"260076f301ac4e5a8331439e48ef2218",
        " _gat":"1",
        " LGSID":"20180818212225-bf07517a-a2e9-11e8-9250-525400f775ce",
        " PRE_UTM":"",
        " PRE_HOST":"",
        " PRE_SITE":"",
        " PRE_LAND":"https%3A%2F%2Fwww.lagou.com%2F",
        " TG-TRACK-CODE":"index_code",
        " LGRID":"20180818212901-ab7a5dab-a2ea-11e8-9251-525400f775ce",
        " Hm_lpvt_4233e74dff0ae5bd0a3d81c6ccf756e6":"1534599027",
        " LG_LOGIN_USER_ID":"7019cb6830184153001e0e02a289036059155009eb79381c2157a93daae17a87",
        " _putrc":"E1A71DDE75111EB5123F89F2B170EADC",
        " login":"true",
        " unick":"sunshine",
        " gate_login_token": "dfc192a6c4e32197bdad4c31397d437644c2135acea3a8862c5216e79251a965",
    }

    def parse(self, response):
        home_url = 'https://www.lagou.com/zhaopin/'
        yield scrapy.Request(url=home_url,headers=self.headers,cookies=self.cookie,callback=self.parse_home)

    def parse_home(self,response):
        # print(response.text)
        job_tr = response.xpath('//div[@class="list_item_top"]')
        # print(job_tr)
        for job in job_tr:
            item = JobItem()

            detail = response.xpath('.//div[@class="li_b_l"]/text()').extract()[2]
            detail=detail.split('\n')[0]
            title = job.xpath('.//a/h3/text()').extract()[0]

            url = job.xpath('.//a[@class="position_link"]/@href').extract()[0]  # 详情页的链接地址

            url_id = self.md5(url)  # 对获取的详情页地址进行md5加密充当主键

            salary = job.xpath('.//div[@class="li_b_l"]/span/text()').extract()[0]
            company = job.xpath('.//div[@class="company_name"]/a/text()').extract()[0]
            address = job.xpath('.//a//em/text()').extract()[0]

            date_time = datetime.date.today()
            date_time = str(date_time)

            # print(detail)

            item['title'] = title
            item['url'] = url
            item['url_id'] = url_id
            item['salary'] = salary
            item['company'] = company
            item['address'] = address
            item['date_time'] = date_time
            item['detail'] = detail

            yield item



        # 创建多个分页请求
        for i in range(1, 31):
            for onebase_url in self.base_url:
                fullurl = onebase_url+str(i)
                # print(fullurl)
                yield scrapy.Request(url=fullurl,headers=self.headers,cookies=self.cookie,callback=self.parse_home)

    def md5(self, value):
        md5 = hashlib.md5()
        md5.update(bytes(value, encoding='utf-8'))
        return md5.hexdigest()



