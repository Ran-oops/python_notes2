from django.conf.urls import url
from . import views



urlpatterns = [
    url(r'^$', views.index, name="myadmin_index"),

     # 后台用户管理
    url(r'^users$', views.usersindex, name="myadmin_usersindex"),
    url(r'^usersadd$', views.usersadd, name="myadmin_usersadd"),
    url(r'^usersinsert$', views.usersinsert, name="myadmin_usersinsert"),
    url(r'^usersdel/(?P<uid>[0-9]+)$', views.usersdel, name="myadmin_usersdel"),
    url(r'^usersedit/(?P<uid>[0-9]+)$', views.usersedit, name="myadmin_usersedit"),
    url(r'^usersupdate/(?P<uid>[0-9]+)$', views.usersupdate, name="myadmin_usersupdate"),

    #后台管理员路由
    url(r'^login$', views.login, name="myadmin_login"),
    url(r'^dologin$', views.dologin, name="myadmin_dologin"),
    url(r'^logout$', views.logout, name="myadmin_logout"),
    url(r'^verifycode$',views.verifycode,name='verifycode')

    #后台商品类别信息管理
    url(r'^type$',viewsgoods.typeindex,name="myadmin_typeindex"),
    url(r'^typeadd/(?P<tid>[0-9]+)$',viewsgoods.typeadd,name="myadmin_typeadd"),
    url(r'^typeinsert$',viewsgoods.typeinsert,name="myadmin_typeinsert"),
    url(r'^typedel/(?P<tid>[0-9]+)$',viewsgoods.typedel,name="myadmin_typedel"),
    url(r'^typeedit/(?P<tid>[0-9]+)$',viewsgoods.typeedit,name="myadmin_typeedit"),
    url(r'^typeupdate/(?P<tid>[0-9]+)$',viewsgoods.typeupdate,name="myadmin_typeupdate")

   #商品类别管理
   

   #商品信息管理
   

   #订单信息管理
   
   
]
