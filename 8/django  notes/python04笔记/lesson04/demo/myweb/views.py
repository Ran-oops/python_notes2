from django.shortcuts import render
from django.http import HttpResponse

from myweb.models import Stu

# Create your views here.
def index(request):
    return render(request,"myweb/index.html")

def demo1(request):
	#定义一个变量，放置信息，用于在模板中输出
	context = {"name":"ZhangSan"}
	context['age']=20 #追加信息

	context['arr'] = ["aa","bb","cc"]

	context['arr'].append("dd") #在列表中追加一个值

	print(context['arr'][0]) # #在Python程序中输出一个列表中的值

	context['stu']={"name":'lisi','age':22,'classid':'python04'}

	print(context['stu']['name']) # #在Python程序中输出一个字典中的值

	#获取stu表数据中的单条数据
	ob = Stu.objects.get(id=1)
	print(ob.name) #在Python程序中输出一个对象的属性值
	ob.city = "北京"

	context['vstu'] = ob


	context['htmlinfo'] = "<h2>AAAAAAAAAAA</h2>"
	#context['loginname'] = "张三丰"
	#加载模板，并将context放置进去。
	return render(request,"myweb/demo1.html",context)

# 模板继承实例
def demo2(request):
    return render(request,"myweb/demo2.html")


def shopindex(request):
    return render(request,"myweb/shop/index.html")

def shoplist(request):

    return render(request,"myweb/shop/list.html")

def shopdetail(request):
    return render(request,"myweb/shop/detail.html")

def verifycode(request):
    #引入绘图模块
    from PIL import Image, ImageDraw, ImageFont
    #引入随机函数模块
    import random
    #定义变量，用于画面的背景色、宽、高
    bgcolor = (random.randrange(20, 100), random.randrange(20, 100), 200)
    #bgcolor = (168,230,172)
    width = 100
    height = 25
    #创建画面对象
    im = Image.new('RGB', (width, height), bgcolor)
    #创建画笔对象
    draw = ImageDraw.Draw(im)
    #调用画笔的point()函数绘制噪点
    for i in range(0, 10000):
        xy = (random.randrange(0, width), random.randrange(0, height))
        fill = (random.randrange(0, 255), 255, random.randrange(0, 255))
        draw.point(xy, fill=fill)
    #定义验证码的备选值
    #str1 = 'ABCD123EFGHIJK456LMNOPQRS789TUVWXYZ0'
    str1 = '0123456789'
    #随机选取4个值作为验证码
    rand_str = ''
    for i in range(0, 4):
        rand_str += str1[random.randrange(0, len(str1))]
    #构造字体对象
    font = ImageFont.truetype('./static/msyh.ttf', 23)
    #font = ImageFont.load_default().font
    #构造字体颜色
    fontcolor = (255, random.randrange(0, 255), random.randrange(0, 255))
    #绘制4个字
    draw.text((5, -2), rand_str[0], font=font, fill=fontcolor)
    draw.text((25, 2), rand_str[1], font=font, fill=fontcolor)
    draw.text((50, -2), rand_str[2], font=font, fill=fontcolor)
    draw.text((75, 2), rand_str[3], font=font, fill=fontcolor)
    #释放画笔
    del draw
    #存入session，用于做进一步验证
    request.session['verifycode'] = rand_str
    print("code:"+rand_str)
    #内存文件操作
    """
    python2的为
    # 内存文件操作
    import cStringIO
    buf = cStringIO.StringIO()
    """
    # 内存文件操作-->此方法为python3的
    import io
    buf = io.BytesIO()
    #将图片保存在内存中，文件类型为png
    im.save(buf, 'png')
    #将内存中的图片数据返回给客户端，MIME类型为图片png
    return HttpResponse(buf.getvalue(), 'image/png')