from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^$', views.index, name="index"),

    #相册图片信息管理
    url(r'^pic$', views.indexpic, name="pic"), #浏览相册图片信息
    url(r'^pic/add$', views.addpic, name="addpic"), #加载添加相册图片信息表单
    url(r'^pic/insert$', views.insertpic, name="insertpic"), #执行相册图片信息添加
    url(r'^pic/(?P<uid>[0-9]+)/del$', views.delpic, name="delpic"), #执行相册图片信息删除
    url(r'^pic/(?P<uid>[0-9]+)/edit$', views.editpic, name="editpic"), #加载相册图片信息编辑表单
    url(r'^pic/update$', views.updatepic, name="updatepic"), #执行相册图片信息编辑
]