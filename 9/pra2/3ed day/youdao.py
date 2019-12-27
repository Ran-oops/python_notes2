from urllib import request,parse
import time,random
import hashlib
import json

def getmd5(value):
    md5 = hashlib.md5()
    md5.update(bytes(value, encoding='utf-8'))
    sign = md5.hexdigest()
    return sign

def fanyi(key):
    # base_url是在浏览器翻译跳转那一瞬间的headers的url的内容：
    base_url='http://fanyi.youdao.com/translate_o?smartresult=dict&smartresult=rule'

    salt=int(time.time()*1000)+random.randint(0,10)
    sign='fanyideskweb'+key+str(salt)+'ebSeFb%=XZ%T[KZ)c(sy!'
    sign=getmd5(sign)

    #data是在浏览器翻译跳转那一瞬间的headers的Form Data的内容：
    data={
        'i': key,
        'from': 'AUTO',
        'to': 'AUTO',
        'smartresult': 'dict',
        'client': 'fanyideskweb',
        'salt': salt,
        'sign': sign,
        'doctype': 'json',
        'version': '2.1',
        'keyfrom': 'fanyi.web',
        'action': 'FY_BY_REALTIME',
        'typoResult': 'false',
    }

    data=parse.urlencode(data)
    headers={
        'Accept': 'application/json, text/javascript, */*; q=0.01',
        #'Accept-Encoding': 'gzip, deflate',
        'Accept-Language': 'zh-CN,zh;q=0.9',
        'Content-Length': len(data),
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
        'Cookie': 'OUTFOX_SEARCH_USER_ID=470951476@10.169.0.83; OUTFOX_SEARCH_USER_ID_NCOO=1375905974.1718845; fanyi-ad-id=47865; fanyi-ad-closed=1; JSESSIONID=aaaTmB2EOd2TO5AmQOLtw; ___rl__test__cookies=1532911479858',
        'Host': 'fanyi.youdao.com',
        'Origin': 'http://fanyi.youdao.com',
        'Proxy-Connection': 'keep-alive',
        'Referer': 'http://fanyi.youdao.com/',
        'User-Agent': 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'
        # 'Host': 'fanyi.youdao.com',
        # 'Connection': 'keep-alive',
        # 'Content-Length': len(data),
        # 'Accept': 'application/json, text/javascript, */*; q=0.01',
        # 'Origin': 'http://fanyi.youdao.com',
        # 'X-Requested-With': 'XMLHttpRequest',
        # 'User-Agent': 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36',
        # 'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
        # 'Referer': 'http://fanyi.youdao.com/',
        # #'Accept-Encoding': 'gzip, deflate',
        # 'Accept-Language': 'zh-CN,zh;q=0.9',
        # 'Cookie': 'OUTFOX_SEARCH_USER_ID=470951476@10.169.0.83; OUTFOX_SEARCH_USER_ID_NCOO=1375905974.1718845; fanyi-ad-id=47865; fanyi-ad-closed=1; JSESSIONID=aaaTmB2EOd2TO5AmQOLtw; ___rl__test__cookies=1532911479858',
    }

    req=request.Request(base_url,data=bytes(data,encoding='utf-8'),headers=headers)
    response=request.urlopen(req)
    data_json=response.read().decode('utf-8')
    data=json.loads(data_json)
    res=''
    for item in data['translateResult']:
        res+=item[0]['tgt']
    print(res)

if __name__=='__main__':
    while True:
        key=input('输入需要翻译的内容:')
        fanyi(key)