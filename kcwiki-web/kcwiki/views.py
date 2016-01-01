from django.http import HttpResponse
from django.template import Template, Context, RequestContext
from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login, logout
import django
from django.views.decorators.csrf import csrf_exempt

functionList = [
  "foo",
  "ajaxDescriptionGenerator",
]

def bar(request):
  return django.shortcuts.redirect("http://google.com")

def shortener(request):
  template = django.template.loader.get_template("shortener.html")
  context = RequestContext(request,{})
  html = template.render(context)
  return HttpResponse(html)

def index(request):
  template = django.template.loader.get_template("index.html")
  context = RequestContext(request, {"functionList":functionList})
  html = template.render(context)
  return HttpResponse(html)

def kcdump(request):
  template = django.template.loader.get_template("kcdump.html")
  context = RequestContext(request, {})
  html = template.render(context)
  return HttpResponse(html)

def ajaxDescriptionGenerator(request):
  description = """
  Kiyoshimo Hourly Lines
  """
  javascript = ""
  for i in xrange(1,51):
    javascript +="$(\"[name=description"+str(i)+"]\").val(\""+description.strip()+"\");"

  print javascript

@csrf_exempt
def foo(request):
  template = django.template.loader.get_template("foo.html")
  context = RequestContext(request,{"data":request.POST})
  print request.META
  html = template.render(context)
  return HttpResponse(html)