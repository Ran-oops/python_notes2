from django.conf.urls import url

from . import views
urlpatterns=[
    #web的主入口
    url(r'^index$',views.index,name="index"),
    url(r'^job51list(?P<pIndex>[0-9]+)$',views.job51list,name="job51list"),
    url(r'^job51detail(?P<rowindex>[0-9]+)$',views.job51detail,name="job51detail")
    # url(r'^lagou$',views.lagou,name="lagou"),
    # url(r'^tongcheng$',views.tongcheng,name="tongcheng"),
    # url(r'^zhonghua$',views.zhonghua,name="zhonghua"),
]