import requests
from lxml import etree
import json
from urllib import request

def getUrl():
    base_url = 'http://www.itxdl.cn/html/php/phparticles/'
    response = requests.get(base_url)
    response.encoding = 'utf-8'
    html = response.text
    html = etree.HTML(html)
    url_list = html.xpath('//div[@class="php_zuopin_fenlei"]//a/@href')
    return url_list


def parsePage(html):
    html = etree.HTML(html)
    pro_div = html.xpath('//div[@class="php_xueyuanzuopin_liebiao"]')
    for div in pro_div:
        project_name = div.xpath('.//p[1]/text()')[0]
        class_name = div.xpath('.//p[2]/text()')[0]
        team_name = div.xpath('.//p[3]/text()')
        team_name = team_name[0] if team_name else ''
        project_desc = div.xpath('.//p[4]/a/text()')[0]
        project_pic = div.xpath('./div[@class="php_xueyuanzuopin_liebiao_right"]//img/@src')[0]

        item = {
            'project_name' : project_name,
            'class_name' : class_name,
            'team_name' : team_name,
            'project_desc' : project_desc,
            'project_pic' : project_pic,
        }
        fname = project_pic.split('/')[-1]
        request.urlretrieve(project_pic,'./project_pic/' + fname)
        f.write(json.dumps(item,ensure_ascii=False) + '\n')


def getPage(url_list):
    for url in url_list:
        response = requests.get(url)
        response.encoding = 'utf-8'
        parsePage(response.text)


if __name__ == '__main__':
    f = open('project','w',encoding='utf-8')
    url_list = getUrl()
    getPage(url_list)
    f.close()