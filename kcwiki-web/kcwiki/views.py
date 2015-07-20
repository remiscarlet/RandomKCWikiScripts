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

def index(request):
  template = django.template.loader.get_template("index.html")
  context = RequestContext(request, {"functionList":functionList})
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