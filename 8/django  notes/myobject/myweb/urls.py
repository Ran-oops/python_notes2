from django.conf.urls import url

from . import views,viewsorders

urlpatterns = [
    #网站前台
    url(r'^$',views.index,name="index"), #首页
    url(r'^list$',views.lists,name="list"), #商品列表展示
    url(r'^detail/(?P<gid>[0-9]+)$',views.detail,name="detail"), #商品详情

    # 会员及个人中心等路由配置
    url(r'^login$', views.login, name="login"),
    url(r'^dologin$', views.dologin, name="dologin"),
    url(r'^logout$', views.logout, name="logout"),

    # 购物车路由
    url(r'^shopcart$', viewsorders.shopcart,name='shopcart'), #浏览购物车
    url(r'^shopcartadd/(?P<sid>[0-9]+)$', viewsorders.shopcartadd,name='shopcartadd'), #添加购物车
    url(r'^shopcartdel/(?P<sid>[0-9]+)$', viewsorders.shopcartdel,name='shopcartdel'), #从购物车中删除一个商品
    url(r'^shopcartclear$', viewsorders.shopcartclear,name='shopcartclear'), #清空购物车
    url(r'^shopcartchange$', viewsorders.shopcartchange,name='shopcartchange'), #更改购物车中商品数量
    
    #订单处理
]