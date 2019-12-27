from django.shortcuts import render
from django.http import HttpResponse
from django.shortcuts import redirect
from django.core.urlresolvers import reverse

from myweb.models import Types,Goods
import time

# 自定义公共信息加载函数
def loadinfo(request):
    context={}
    context['typelist'] = Types.objects.filter(pid=0)
    return context

# 浏览购物车
def shopcart(request):
    context = loadinfo(request)
    if 'shoplist' not in request.session:
        request.session['shoplist']={}
    return render(request,"myweb/shopcart.html",context)

# 添加购物车
def shopcartadd(request,sid):
    #获取要放入购物车中的商品信息
    goods = Goods.objects.get(id=sid)
    shop = goods.toDict();
    shop['m'] = int(request.POST['m']) # 添加一个购买量属性
    #从session获取购物车信息
    if 'shoplist' in request.session:
        shoplist = request.session['shoplist']
    else:
        shoplist = {}
    
    #判断此商品是否在购物车中
    if sid in shoplist:
        #商品数量加一
        shoplist[sid]['m']+=shop['m']
    else:
        #新商品添加
        shoplist[sid]=shop

    #将购物车信息放回到session
    request.session['shoplist'] = shoplist
    return redirect(reverse('shopcart'))
    #return render(request,"myweb/shopcart.html")

def shopcartdel(request,sid):
    shoplist = request.session['shoplist']
    del shoplist[sid]
    request.session['shoplist'] = shoplist
    return redirect(reverse('shopcart'))

def shopcartclear(request):
    context = loadinfo(request)
    request.session['shoplist'] = {}
    return render(request,"myweb/shopcart.html",context)

def shopcartchange(request):
    context = loadinfo(request)
    shoplist = request.session['shoplist']
    #获取信息
    shopid = request.GET['sid']
    num = int(request.GET['num'])
    if num<1:
        num = 1
    shoplist[shopid]['m'] = num #更改商品数量
    request.session['shoplist'] = shoplist
    return redirect(reverse('shopcart'))
    #return render(request,"myweb/shopcart.html",context)
