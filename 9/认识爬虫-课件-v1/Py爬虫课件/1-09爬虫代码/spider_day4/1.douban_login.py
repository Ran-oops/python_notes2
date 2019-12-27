from urllib import request,parse
import re
from http import cookiejar

cookie = cookiejar.CookieJar()
cookie_handler = request.HTTPCookieProcessor(cookie)
opener = request.build_opener(cookie_handler)

login_url = 'https://accounts.douban.com/login'

headers = {
    "Host": "accounts.douban.com",
    "Connection": "keep-alive",
    # "Content-Length": "107",
    "Cache-Control": "max-age=0",
    "Origin": "https://accounts.douban.com",
    "Upgrade-Insecure-Requests": "1",
    "Content-Type": "application/x-www-form-urlencoded",
    "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36",
    "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8",
    "Referer": "https://accounts.douban.com/login",
    # "Accept-Encoding": "gzip, deflate, br",  关闭压缩
    "Accept-Language": "zh-CN,zh;q=0.9",
}

def getLoginPage():
    '''
    获取登录页面
    :return:
    '''
    response = opener.open(login_url)
    html = response.read().decode('utf-8')
    return html

# 登陆函数
def login(html):
    if 'captcha-id' in html: # 判断是否有验证码
        # 获取id
        id_pattern = re.compile(r'"captcha-id" value="(.*?)"')
        res = id_pattern.search(html)
        if res is not None:
            captcha_id = res.group(1)
        else:
            print('获取id失败')
            exit()

        # 获取验证码
        code_pattern = re.compile(r'captcha_image" src="(.*?)"')
        res = code_pattern.search(html)
        if res is not None:
            captcha_image = res.group(1)
            request.urlretrieve(captcha_image,'douban.jpg')
        else:
            print('获取验证码地址失败')
            exit()

        # print(captcha_id)
        # print(captcha_image)

        print('有验证码，请输入：')
        captcha_solution = input('')

        data = {
            'form_email': '1752570559@qq.com',
            'form_password': '1234qwer',
            'login': '登录',
            'captcha-solution': captcha_solution,
            'captcha-id' : captcha_id
        }
        data = parse.urlencode(data)
        headers['Content-Length'] = len(data)
        req = request.Request(login_url,data=bytes(data,encoding='utf-8'),headers=headers)

        response = opener.open(req)
        home_page = response.read().decode('utf-8')

    else: # 无验证码
        # 构造post 表单数据
        data = {
            'form_email' : '1752570559@qq.com',
            'form_password' : '1234qwer',
            'login' : '登录'
        }

        data = parse.urlencode(data)

        # 构造请求头

        headers['Content-Length'] = len(data)

        req = request.Request(login_url,data=bytes(data,encoding='utf-8'),headers=headers)
        response = opener.open(req)
        print(response.geturl())
        home_page = response.read().decode('utf-8')

    return home_page

def edit_signature(home_page):
    # print(home_page)
    base_url = 'https://www.douban.com/j/people/96640796/edit_signature'
    headers = {
        "Host": "www.douban.com",
        "Connection": "keep-alive",
        "Accept": "application/json, text/javascript, */*; q=0.01",
        "Origin": "https://www.douban.com",
        "X-Requested-With": "XMLHttpRequest",
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36",
        "Content-Type": "application/x-www-form-urlencoded",
        "Referer": "https://www.douban.com/people/96640796/",
        "Accept-Language": "zh-CN,zh;q=0.9",
    }


    ck_pattern = re.compile(r'ck" value="(.*?)"')
    res = ck_pattern.search(home_page)
    if res is not None:
        ck = res.group(1)
    else:
        print('ck失败')
        exit()

    signature = input('输入签名：')
    data = {
        'signature' : signature,
        'ck' : ck
    }

    data = parse.urlencode(data)

    headers['Content-Length'] = len(data)

    req = request.Request(base_url,data=bytes(data,encoding='utf-8'),headers=headers)

    resposne = opener.open(req)

    print(resposne.read().decode('utf-8'))

if __name__ == '__main__':
    html = getLoginPage()
    home_page = login(html)
    edit_signature(home_page)
