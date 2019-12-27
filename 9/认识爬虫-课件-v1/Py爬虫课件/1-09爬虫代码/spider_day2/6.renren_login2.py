from urllib import request,parse
from http import cookiejar

cookie = cookiejar.CookieJar()  # cookie对象
cookie_handler = request.HTTPCookieProcessor(cookie)  # 生成cookie管理器
http_handler = request.HTTPHandler() # http请求管理器
https_handler = request.HTTPSHandler() # http请求管理器
opener = request.build_opener(http_handler,https_handler,cookie_handler)  # 发起请求的管理器

def login():
    # 登陆的地址
    login_url = 'http://www.renren.com/PLogin.do'

    data = {
        'email' : '1752570559@qq.com',
        'password' : '1234qwer'
    }
    data = parse.urlencode(data)

    req = request.Request(login_url,data=bytes(data,'utf-8'))
    # 自定义opener 发起请求
    response = opener.open(req)

    # print(response.read().decode('utf-8'))

def getHomePage():
    home_url = 'http://www.renren.com/440906810'
    response = opener.open(home_url)
    print(response.read().decode('utf-8'))

if __name__ == '__main__':
    login() # 登陆操作

    getHomePage() # 获取个人首页