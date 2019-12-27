from urllib import request
import json
import random

#获取代理信息
def getproxy(proxyfile):
    with open(proxyfile,'r') as f:
        proxies=f.read().replace('\n',',')
        proxies='['+proxies.strip(',')+']'
        proxies=json.loads(proxies)

        proxy_list=[]
        for item in proxies:
            proxy={}
            proxy['http'] = '%s://%s:%s' % (item['http_type'].lower(), item['host'], item['port'])
            proxy['https'] = '%s://%s:%s' % (item['http_type'].lower(), item['host'], item['port'])

            proxy_list.append(proxy)

        return proxy_list

#获取opener
def getopener(proxies):
    proxy=random.choice(proxies)   #随机选出一个代理
    print(proxy)
    proxy_handler=request.ProxyHandler(proxy)
    opener=request.build_opener(proxy_handler)
    return opener

#下载器，尝试N次，如果失败返回None
def downloader(opener,req,proxies=None,timeout=5,retry=3):
    '''

    :param opener:   请求管理器
    :param req: 请求对象
    :param proxies: 代理池
    :param timeout: 超时
    :param retry: 重试次数
    :return: 如果响应返回响应内容，否则None
    '''
    try:
        response=opener.open(req,timeout=timeout)
        data=response.read()
    except Exception as e:
        print(str(e))
        data=None
        if retry > 1:
            if proxies is not None:#是否使用代理
                opener=getopener(proxies)
            return downloader(opener,req,proxies,5,retry-1)
    return data

if __name__=='__main__':
    proxies=getproxy('authproxy')
    base_url='http://www.baidu.com/s?wd=ip'
    response=downloader(request.build_opener(),base_url)
    if response is not None:
        #解析hml,或者json
        print(response.decode('utf-8'))
        pass