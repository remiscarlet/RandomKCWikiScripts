from django.conf.urls import patterns, include, url
from django.contrib import admin
import views

urlpatterns = [
    # Examples:
    # url(r'^$', 'kcwiki.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    url(r'^admin', include(admin.site.urls)),
    url(r'^$', views.index),
    url(r'^index/*$', views.index),
    url(r'^debug/*$', views.foo),
    url(r'^foo/*$', views.kcdump),
    url(r'^bar/*$', views.bar),
    url(r'^kaze[/]$', views.shortener),

]
