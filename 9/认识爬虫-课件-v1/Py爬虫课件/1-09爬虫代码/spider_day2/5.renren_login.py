from urllib import request


base_url = 'http://www.renren.com/440906810'
headers = {
    'Cookie' : 'anonymid=j9rsbcfe36yr3u; _r01_=1; depovince=BJ; jebecookies=29ce96e8-3855-4bf6-9cc2-0b2b833ec836|||||; ick_login=5934f843-c789-4b1f-a611-3770c63046a7; jebe_key=e297c8fd-cb3c-4d44-9f8c-f5d0a3aaa281%7C13cfe4e0f2468cd238a9520eb2c92717%7C1510797818791%7C1%7C1511937311162; JSESSIONID=abc7c46XGNvFY-TgsFgaw; _de=31795CAA550243A1FFFC179CCE3D61136DEBB8C2103DE356; p=95de3e4e71ca3b5d51b7d6883261b6450; first_login_flag=1; ln_uact=1752570559@qq.com; ln_hurl=http://head.xiaonei.com/photos/0/0/men_main.gif; t=c71408314de89900dc96f05c46f4d8f60; societyguester=c71408314de89900dc96f05c46f4d8f60; id=440906810; xnsid=f9826ae6; ver=7.0; loginfrom=null; wp_fold=0'
}
req = request.Request(base_url,headers=headers)
response = request.urlopen(req)

print(response.read().decode('utf-8'))