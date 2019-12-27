from urllib import request

base_url='http://www.renren.com/967059420'
headers={
    'Cookie': 'anonymid=jk5dmtsubgz2e5; depovince=GW; jebecookies=f47437eb-4dcd-4349-8167-f3459121fe1c|||||; _r01_=1; JSESSIONID=abcQHZxFw5c-M5_bQZGtw; ick_login=ca70abd8-d412-485a-9014-bf3c6eb87103; _de=0E9BD65330B1CDAA9C514B417B9BD55C; p=a431cc66bfc3339192db2c64acd349880; first_login_flag=1; ln_uact=18291893776; ln_hurl=http://head.xiaonei.com/photos/0/0/men_main.gif ; t=12870e2252d4b11f8549387b498baa710; societyguester=12870e2252d4b11f8549387b498baa710; id=967059420; xnsid=1f31066e; ver=7.0; loginfrom=null; jebe_key=6b2ab908-2417-4d15-bd83-cd5669eb0a8c%7Cdfdbda3d59dd66ab750293182b8b286f%7C1532780019230%7C1%7C1532780102132; wp_fold=0'

}
req=request.Request(base_url,headers=headers)
response=request.urlopen(req)
html=response.read().decode('utf-8')
print(html)