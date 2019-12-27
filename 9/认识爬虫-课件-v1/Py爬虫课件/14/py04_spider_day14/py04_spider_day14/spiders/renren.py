# -*- coding: utf-8 -*-
import scrapy


class RenrenSpider(scrapy.Spider):
    name = 'renren'
    allowed_domains = ['renren.com']
    start_urls = ['http://renren.com/']

    custom_settings = {
        'COOKIES_ENABLED' : True
    }

    headers = {
        "Host": "www.renren.com",
        "Connection": "keep-alive",
        "Cache-Control": "max-age=0",
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36",
        "Upgrade-Insecure-Requests": "1",
        "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8",
        "Accept-Encoding": "gzip, deflate",
        "Accept-Language": "zh-CN,zh;q=0.9",
    }
    cookie = {
        "anonymid": "jb7iff26jig73u",
        "depovince": "BJ",
        "jebecookies": "7d9b382c-b1d4-4d01-929a-270708a22aff|||||",
        "_r01_": "1",
        "ick_login": "1b4fae72-33b8-4475-8143-f2ff0734e91e",
        "_de": "31795CAA550243A1FFFC179CCE3D61136DEBB8C2103DE356",
        "p": "29682f0436c4a599213fa2c8261446400",
        "first_login_flag": "1",
        "ln_uact": "1752570559@qq.com",
        "ln_hurl": "http://head.xiaonei.com/photos/0/0/men_main.gif",
        "t": "8d444ca1bf98c86f6bc60e05026db5870",
        "societyguester": "8d444ca1bf98c86f6bc60e05026db5870",
        "id": "440906810",
        "xnsid": "a738869d",
        "ver": "7.0",
        "loginfrom": "null",
        "JSESSIONID": "abcockhxuYSVhhuI3Xybw",
        "jebe_key": "e15d77ae-786b-4278-b5c2-22cad0205b95%7C13cfe4e0f2468cd238a9520eb2c92717%7C1513317961919%7C1%7C1513317962370",
        "wp_fold": "0",
    }

    def parse(self, response):
        home_url = 'http://www.renren.com/440906810'
        yield scrapy.Request(url=home_url,headers=self.headers,cookies=self.cookie,callback=self.parse_home)

    def parse_home(self,response):
        print(response.text)

