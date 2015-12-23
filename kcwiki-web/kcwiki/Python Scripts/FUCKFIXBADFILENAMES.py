# -*- coding: UTF-8 -*-
import sys
reload(sys)
sys.setdefaultencoding('utf8')
import os
#import 
baseDir = os.path.join("/","Users","YutoTakamoto","Desktop","Kancolle Scrape Data", "Flash")

listOfShit = os.listdir(baseDir)

mapOfShit = dict()

for item in listOfShit:
  if item.find(".swf")>-1:
    print item
    split = item.split(" ")
    if split[1] != split[-1]:
      name = split[1:split.index("-")]
      mapOfShit[split[-1][:-4]] = " ".join(name).decode("utf8")

for item in listOfShit:
  if item.find(".swf")>-1:
    split = item.split(" ")
    if split[1] in split[-1]:
      split[1] = mapOfShit[split[1]].decode("utf8")
      print split
      fileName = " ".join(split)
      fromDir = os.path.join(baseDir,item)
      toDir = os.path.join(baseDir,fileName)
      #print fromDir
      #print toDir
      os.rename(fromDir,toDir)
