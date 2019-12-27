from django.contrib import admin

from . import views

urlpatterns[
	url(r'^',views.index,name='index'),
	url(r'^wx$',views.weixin,name='weixin'),
	url(r'^wx/getusers$',views.getuser,name='getuser'),
	url(r'^wx/cmenu$',views.cmenu,name='cmenu'),




]