from urllib import request,parse
from http import cookiejar

cookie=cookiejar.CookieJar()  #cookie对象
cookie_handler=request.HTTPCookieProcessor(cookie)  #生成cookie管理器
http_handler=request.HTTPHandler()  #http请求管理器
https_handler=request.HTTPSHandler()
opener=request.build_opener(http_handler,https_handler,cookie_handler)   #发起请求的管理器

def login():
    #登录的地址
    login_url='http://www.renren.com/PLogin.do'
    data={
        'email':'18291893776',
        'password':'MHLOVESY123'
    }
    data=parse.urlencode(data)
    req=request.Request(url=login_url,data=bytes(data,'utf-8'))
    #自定义request发起请求
    response=opener.open(req)
    html=response.read().decode('utf-8')
    #print(html)

def gethomepage():
    home_url='http://www.renren.com/967059420'
    response=opener.open(home_url)
    print(response.read().decode('utf-8'))


if __name__=='__main__':
    login()
    gethomepage()
