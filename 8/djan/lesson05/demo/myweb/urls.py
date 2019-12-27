from django.conf.urls import url

from . import views

urlpatterns = [
    # web的主入口
    url(r'^$',views.index,name="index"),

    #学生信息的搜索加分页实例
    url(r'^stu$',views.stu,name="stu"),# 浏览学生信息

    url(r'^stupage(?P<pIndex>[0-9]+)$',views.stupage,name='stupage'),#分页浏览学生信息

    url(r'^stusearch$',views.stusearch,name='stusearch'),#搜索浏览信息

    url(r'^stuspage(?P<pIndex>[0-9]+)$',views.stuspage,name='stuspage'),#分页&搜索浏览信息
   
    url(r'^demo1$',views.demo1,name="demo1"),

    url(r'^setCC$',views.setCC,name="setCC"),

    # session demo
    url(r'^demo2$',views.demo2,name="demo2"),

     # session购物车案例
    url(r'^shop$',views.shop,name="shop"), #浏览商品
    url(r'^addcart$',views.addcart,name="addcart"), #添加购物车
    url(r'^showcart$',views.showcart,name="showcart"), #浏览购物车
    url(r'^delcart/(?P<sid>[0-9]+)$',views.delcart,name="delcart"), #删除一个商品
    url(r'^clearcart$',views.clearcart,name="clearcart") #清空购物车

]