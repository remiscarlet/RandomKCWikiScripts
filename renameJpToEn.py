# -*- coding: UTF-8 -*-
import sys
reload(sys)
sys.setdefaultencoding('utf8')
import os
import string
import copy
basePath = os.path.join(u"/",u"Users",u"YutoTakamoto",u"Desktop",u"Kancolle Scrape Data","Flash")

def upperFirst(string):
  c = string[0]
  lst = list(string)
  lst[0] = c.upper()
  return "".join(lst)

attrDict = dict()
with open("kanmusu_jp-en_mapping.txt","r") as attrMapping:
  for line in attrMapping.readlines():
    split = line.split(",")
    thing = list()
    for attr in split:
      thing.append(attr.decode("utf8"))
    for attr in thing:
      attrDict[attr] = thing
#print attrDict
def recurseAndRename(path):
  print "#"
  dirContent = os.listdir(path)
  empty = True
  for item in dirContent:
    appendedPath = os.path.join(path,item)
    split = item.split(" ")
    origSplit = copy.copy(split)
    for part in split:
      if part in attrDict:
        split[split.index(part)] = " ".join([upperFirst(item) for item in attrDict[part][1].split(" ")])
    extendedSplit = list()
    if split == origSplit:
      for item in split:
        extended = item.split(".")
        extendedSplit.extend(sum([[item,"."] for item in extended],[])[:-1 ])
      for part in extendedSplit:
        orig = part
        print repr(part)
        if part in attrDict:
          extendedSplit[extendedSplit.index(orig)] = " ".join([upperFirst(item) for item in attrDict[part][1].split(" ")])
      if "." in extendedSplit:
        lastBit = extendedSplit[-3:]
        print lastBit
        extendedSplit.pop(-1)
        extendedSplit.pop(-1)
        extendedSplit[-1] = "".join(lastBit)
    if extendedSplit != list(): split = extendedSplit
    split = [unicode(item) for item in split]
    thing = u" ".join(split)
    newPath = os.path.join(unicode(path),thing)
    print repr(appendedPath)
    print repr(newPath)
    os.rename(appendedPath,newPath)
    if os.path.isdir(appendedPath):
      recurseAndRename(appendedPath)


recurseAndRename(basePath)