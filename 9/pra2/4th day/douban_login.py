from urllib import request,parse
import re
from http import cookiejar

cookie=cookiejar.CookieJar()
cookie_handler=request.HTTPCookieProcessor(cookie)
opener=request.build_opener(cookie_handler)

login_url='https://accounts.douban.com/login'

headers={
    "Accept": " text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8",
    #"Accept-Encoding": " gzip, deflate, br",
    "Accept-Language": " zh-CN,zh;q=0.9",
    "Cache-Control": " max-age=0",
    "Connection": " keep-alive",
    #"Content-Length": " 134",
    "Content-Type": " application/x-www-form-urlencoded",
    "Origin: https": "//www.douban.com",
    "Referer: https": "//www.douban.com/",
    "Upgrade-Insecure-Requests": " 1",
    "User - Agent": "Mozilla / 5.0(Windows NT 6.1;WOW64) AppleWebKit / 537.36(KHTML, likeGecko) Chrome / 65.0.3325.181Safari / 537.36",

        }


def getloginpage():
    response=opener.open(login_url)
    html=response.read().decode('utf-8')
    print(html)

def login(html):
    if 'captcha-id' in html:  #判断是否有验证码
        id_pattern=re.compile(r'captcha-id value="(.*?)"')
        res=id_pattern.search(html)
        if res is not None:
            capcha_id=res.group(1)
        else:
            print('获取id失败')
            exit()

        code_pattern=re.compile(r'captcha_image" src="(.*?)"')
        res=code_pattern.search(html)
        if res is not None:
            capcha_image=res.group(1)
            request.urlretrieve(captcha_image,'douban.jpg')
        else:
            print('获取验证码地址失败')
            exit()

        #print(captcha_id)
        #print(captcha_image)
        print('有验证码，请输入：')
        captcha_solution=input('')

        #构造post表单数据
        data={
            'form_email0':'1752570559@qq.com',
            'form_password':'1234qwer',
            'login':'登录'
        }
        data=parse.urlencode(data)

        #构造请求头

        headers['Content-Length']=len(data)


        req=request.Request(login_url,data=bytes(data,encoding='utf-8'),headers=headers)
        response=opener.open(req)
        print(response.read().decode('utf-8'))
    else:#无验证码
        #构造post表单数据
        data={
            'form_email':'1752570559@qq.com',
            'form_password':'1234qwer',
            'login':'登录'
        }
        data = parse.urlencode(data)

        # 构造请求头

        headers['Content-Length'] = len(data)

        req = request.Request(login_url, data=bytes(data, encoding='utf-8'), headers=headers)
        response = opener.open(req)
        print(response.geturll())
        home_page=response.read().decode('utf-8')
    return home_page

def edit_signature(home_page):
    print(home_page)


if __name__=='__main__':
   html=getloginpage()
   login(html)