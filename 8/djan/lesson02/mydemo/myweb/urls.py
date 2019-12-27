from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^$',views.index,name='index'),
    url(r'^add/([0-9]+)$',views.add,name="add"),
    url(r'^del/([0-9]+)$',views.dels,name="del"),

    #users demo
    url(r'^users$',views.usersindex,name="users_index")
    url(r'^udel/(?p<uid>[0-9]+)$',views.usersdel,name="users_del"),
]
