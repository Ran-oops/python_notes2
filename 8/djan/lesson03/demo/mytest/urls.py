from django.conf.urls import url
#導入視圖
from . import views

urlpatterns = [
    url(r'^users/$', views.indexusers,name="index_users" ),
    url(r'^addusers/$', views.addusers,name="add_users" ),
    url(r'^insertusers/$', views.insertusers,name="insert_users" ),
    url(r'^delusers/(?P<uid>[0-9]+)$', views.delusers,name="del_users" ),
    url(r'^editusers/(?P<uid>[0-9]+)$', views.editusers,name="edit_users" ),
    url(r'^updateusers/$', views.updateusers,name="update_users" ),
]
