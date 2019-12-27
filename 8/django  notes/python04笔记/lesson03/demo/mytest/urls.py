from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^$', views.index,name="index"),
    
    # GET/POST
    url(r'^demo01$', views.demo01,name="demo01"),
    url(r'^get$', views.myget,name="myget"),
    url(r'^post$', views.mypost,name="mypost"),
    

    # users demo
    url(r'^users/$', views.indexusers,name="index_users"),
    url(r'^addusers/$', views.addusers,name="add_users"),
    url(r'^insertusers/$', views.insertusers,name="insert_users"),
    url(r'^delusers/(?P<uid>[0-9]+)$', views.delusers,name="del_users"),
    url(r'^editusers/(?P<uid>[0-9]+)$', views.editusers,name="edit_users"),
    url(r'^updateusers/$', views.updateusers,name="update_users"),


    # 城市级联操作
    url(r'^showdistrict$', views.showdistrict, name='showdistrict'), #加载网页
    url(r'^district/([0-9]+)$', views.district, name='district'),  #Ajax加载城市信息
    
]
