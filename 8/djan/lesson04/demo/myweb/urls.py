from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^$', views.index,name="index"),
    
    url(r'^demo1$',views.demo1,name="demo1"),
    url(r'^demo2$',views.demo2,name="demo2"),

    # 商城界面的使用
    url(r'^shopindex$',views.shopindex,name="shopindex"), #商城首页
    url(r'^shoplist$',views.shoplist,name="shoplist"), #商城列表页
    url(r'^shopdetail$',views.shopdetail,name="shopdetail"), #商品详情


    # 验证码 
    url(r'^verifycode$',views.verifycode,name="verifycode"),
]
