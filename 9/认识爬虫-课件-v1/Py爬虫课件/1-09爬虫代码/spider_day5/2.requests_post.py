import requests

# 构建一个会话 类似浏览器访问网站
session = requests.session() # 返回一个会话对象

def login():
    login_url = 'http://www.renren.com/PLogin.do'
    data = {
        'email' : '1752570559@qq.com',
        'password' : '1234qwer',
    }

    # requests 发起post请求
    response = session.post(login_url,data=data)

def getHome():
    home_url = 'http://www.renren.com/440906810'
    response = session.get(home_url)

    print(response.text)

if __name__ == '__main__':
    login()
    getHome()