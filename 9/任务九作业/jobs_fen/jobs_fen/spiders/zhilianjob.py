# -*- coding: utf-8 -*-
import scrapy


class RenrenSpider(scrapy.Spider):
    name = 'zhilianjob'
    allowed_domains = ['i.zhaopin.com']
    # start_urls = ['https://i.zhaopin.com/']
    start_urls = ['https://sou.zhaopin.com/?jl=489']

    custom_settings = {
        'COOKIES_ENABLED' : True
    }

    headers = {
        "Accept":"text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8",
        # "Accept-Encoding":"gzip, deflate, br",
        "Accept-Language":"zh-CN,zh;q=0.9",
        "Cache-Control":"max-age=0",
        "Connection":"keep-alive",
        "Host":"i.zhaopin.com",
        "Referer":"https://passport.zhaopin.com/login",
        "Upgrade-Insecure-Requests":"1",
        "User-Agent":"Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36",

    }
    cookie = {
        "adfbid2":"0",
        "ZP_OLD_FLAG":"false",
        "sts_deviceid":"1654c7f5c5dc0-05f7537aacc872-323b5b03-1049088-1654c7f5c5f20b",
        "dywem":"95841923.y",
        "LastCity":"%E5%85%A8%E5%9B%BD",
        "LastCity%5Fid":"489",
        "campusOperateJobUserInfo":"668e4af7-f123-4a71-a29c-2bc206778009",
        "zg_did":"%7B%22did%22%3A%20%221654ce7d08ca1-01b42996c58bc-323b5b03-100200-1654ce7d08d8bf%22%7D",
        "zg_08c5bcee6e9a4c0594a5d34b79b9622a":"%7B%22sid%22%3A%201534593585299%2C%22updated%22%3A%201534593585304%2C%22info%22%3A%201534593585302%2C%22superProperty%22%3A%20%22%7B%7D%22%2C%22platform%22%3A%20%22%7B%7D%22%2C%22utm%22%3A%20%22%7B%7D%22%2C%22referrerDomain%22%3A%20%22blog.csdn.net%22%2C%22landHref%22%3A%20%22https%3A%2F%2Fxiaoyuan.zhaopin.com%2Ffull%2F538%2F0_0_160000_1_0_0_0_1_0%22%7D",
        "adfbid":"0",
        "dywec":"95841923",
        "sts_sg":"1",
        "zp_src_url":"https%3A%2F%2Fsp0.baidu.com%2F9q9JcDHa2gU2pMbgoY3K%2Fadrc.php%3Ft%3D06KL00c00fAhw9s0P7KI0KqiAsadFgGU00000FxNENb000000NaH0j.THLyktAJdIjA80K85HbLPHTsnHmLgv99UdqsusK15Hb1mWK9nj7bnj0snjF9ryn0IHd7wjNjnH-anDD1P16znjDkfW6YPHmznYmkfYDdrjm4w0K95gTqFhdWpyfqn1D1nW6kPHTYnzusThqbpyfqnHm0uHdCIZwsrBtEILILQMGCmyqspy38mvqV5LPGujYknWDknHn3njnhTv-YuHdsXMGCIyFGmyqYpfKWThnqPH0znWn%26tpl%3Dtpl_11535_17772_13457%26l%3D1505613207%26attach%3Dlocation%253D%2526linkName%253D%2525E6%2525A0%252587%2525E5%252587%252586%2525E5%2525A4%2525B4%2525E9%252583%2525A8-%2525E6%2525A0%252587%2525E9%2525A2%252598-%2525E4%2525B8%2525BB%2525E6%2525A0%252587%2525E9%2525A2%252598%2526linkText%253D%2525E3%252580%252590%2525E6%252599%2525BA%2525E8%252581%252594%2525E6%25258B%25259B%2525E8%252581%252598%2525E3%252580%252591%2525E5%2525AE%252598%2525E6%252596%2525B9%2525E7%2525BD%252591%2525E7%2525AB%252599%252520%2525E2%252580%252593%252520%2525E5%2525A5%2525BD%2525E5%2525B7%2525A5%2525E4%2525BD%25259C%2525EF%2525BC%25258C%2525E4%2525B8%25258A%2525E6%252599%2525BA%2525E8%252581%252594%2525E6%25258B%25259B%2525E8%252581%252598%2525EF%2525BC%252581%2526xp%253Did(%252522m3132815743_canvas%252522)%25252FDIV%25255B1%25255D%25252FDIV%25255B1%25255D%25252FDIV%25255B1%25255D%25252FDIV%25255B1%25255D%25252FDIV%25255B1%25255D%25252FH2%25255B1%25255D%25252FA%25255B1%25255D%2526linkType%253D%2526checksum%253D83%26ie%3Dutf-8%26f%3D8%26srcqid%3D2316805875055587364%26tn%3D97570167_hao_pg%26wd%3D%25E6%2599%25BA%25E8%2581%2594%25E6%258B%259B%25E8%2581%2598%26oq%3D%2525E4%2525B8%2525AD%2525E5%25258D%25258E%2525E8%25258B%2525B1%2525E6%252589%25258D%2525E7%2525BD%252591%26rqlang%3Dcn%26bs%3D%25E4%25B8%25AD%25E5%258D%258E%25E8%258B%25B1%25E6%2589%258D%25E7%25BD%2591",
        "__utmc":"269921210",
        "_jzqc":"1",
        "_jzqckmp":"1",
        "firstchannelurl":"https%3A//passport.zhaopin.com/login%3Fy7bRbP%3DdplRq0plplplplplScnqZynJ0R9Cs0Uw0Z608hYYYlA",
        "dywea":"95841923.2574715850599271400.1534586740.1534731793.1534734561.4",
        "sts_sid":"165554eef224bf-0fc357af82df0f-323b5b03-1049088-165554eef233ef",
        "_jzqa":"1.1999604255165511000.1534586741.1534731794.1534734563.4",
        "_jzqy":"1.1534586741.1534734563.1.jzqsr=baidu|jzqct=%E6%99%BA%E8%81%94%E6%8B%9B%E8%81%98.-",
        "GUID":"8a9578e057df4f01b2585f9c612f2d72",
        "dywez":"95841923.1534736298.4.7.dywecsr=other|dyweccn=121113803|dywecmd=cnt|dywectr=%E6%99%BA%E8%81%94%E6%8B%9B%E8%81%98",
        "__utma":"269921210.1059529170.1534586741.1534735172.1534736298.7",
        "__utmz":"269921210.1534736298.7.7.utmcsr=other|utmccn=121113803|utmcmd=cnt|utmctr=%E6%99%BA%E8%81%94%E6%8B%9B%E8%81%98",
        "Hm_lvt_38ba284938d5eddca645bb5e02a02006":"1534593639,1534731793,1534734561,1534736298",
        "Hm_lpvt_38ba284938d5eddca645bb5e02a02006":"1534736298",
        "__xsptplus30":"30.7.1534736297.1534736297.1%231%7Cother%7Ccnt%7C121113803%7C%7C%23%23htaDOzckNj1WxZB_6gvRf-aBEXsfE14M%23",
        "qrcodekey":"c4600dc8740546ae951652c7a90940a7",
        "lastchannelurl":"",
        "urlfrom":"121126445",
        "urlfrom2":"121126445",
        "adfcid":"none",
        "adfcid2":"none",
        "_jzqb":"1.6.10.1534734563.1",
        "JsNewlogin":"2090348258",
        "JSloginnamecookie":"18291893776",
        "JSShowname":"%E5%AD%99%E7%87%95",
        "at":"9bebf362fe384f38abf2a9bc88fab0a5",
        "Token":"9bebf362fe384f38abf2a9bc88fab0a5",
        "rt":"bdd8ee6be8f244f1aee01a7291ed58bb",
        "JSsUserInfo":"36672168546b5d754877537140654f71576350655d69596b4e713b653f77587740655b675768506b5a7549775c71446540715263516553693e6b3b714a65282cb0064a6526672868546b5a75497757714e654471526350655e692b6b4471446548774b7712650c670868526b38752577587146654c712463336555695c6b5871466551775477406559675168506b5075307729714a6547715e6332652969566b3f713a654877537746655b6757685e6b5e75437750714c65227131635a655969506b26713e654c775077416553675468596b597549775e71226527712b635a655969536b47714e6540775d774865506752685e6b5d754a771",
        "uiioit":"3d672038046a52644e64466f5f675c380b6a53644264426f536726387d6a596447644b6f7",
        "ZP-ENV-FLAG":"gray",
        "dyweb":"95841923.7.10.1534734561",
        "__utmt":"1",
        "__utmb":"269921210.4.10.1534736298",
        "Hm_lvt_363368edd8b243d3ad4afde198719c4a":"1534586812,1534586837,1534737044",
        "Hm_lpvt_363368edd8b243d3ad4afde198719c4a":"1534737044",
        "stayTimeCookie":"1534737044551",
        "referrerUrl":"https%3A//i.zhaopin.com/",
        "ZL_REPORT_GLOBAL":"{%22sou%22:{%22actionIdFromSou%22:%22fcad207c-1c2e-41bb-8e9d-9ba3892bfda8-sou%22%2C%22funczone%22:%22smart_matching%22}%2C%22//i%22:{%22actionid%22:%220c084228-ff78-4475-bd2c-1854a1562331-i%22%2C%22funczone%22:%22njd_for_you%22}}",
        "sts_evtseq": "18",
    }

    def parse(self, response):
        home_url = 'https://sou.zhaopin.com/?jl=489'
        yield scrapy.Request(url=home_url,headers=self.headers,cookies=self.cookie,callback=self.parse_home)

    def parse_home(self,response):
        print(response.text)
        # title=response.xpath('//span[@class="job_title"]/text()').extract()
        # print(title)






