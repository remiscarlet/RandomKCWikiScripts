# snd110.py -- audio generation and IO

import datetime
import os
import re

BASEDIR = os.path.dirname(os.path.realpath(__file__))

fileDir = os.path.join(BASEDIR,"Scrape Logs")
if not os.path.isdir(fileDir):
  os.mkdir(fileDir)
tm = datetime.datetime.now()
logFilePath = os.path.join(fileDir,"log-"+str(tm.strftime("%m%d%Y-%H%M%S"))+".log")
logFile = open(logFilePath,"w")


BASEDIR = os.path.dirname(os.path.realpath(__file__))
text = "";
f = open(os.path.join(BASEDIR,"dump.json"),"r")
text = f.readline()
f.close()

r = re.compile("\"\w+\"\:\[\{.+?\}",re.DOTALL)
result = r.findall(text)
for i in result:
    print i