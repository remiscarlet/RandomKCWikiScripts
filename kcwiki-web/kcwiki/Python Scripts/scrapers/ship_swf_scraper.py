# -*- coding: UTF-8 -*-
# kanmusu_data_mapper.py
#
# Description: 
#
# 
#
# INPUT: 
#
#
# Output: 
#

import sys
reload(sys)
sys.setdefaultencoding('utf8')
from kcinit import *

mapping = kclib.returnFullAssocShipIdentDict()

# toScrape: A list of names to scrape. Can be a list of 
#           jp names, en names, api_id's or obfuscated names.
# overwrite: A boolean on whether to overwrite even if file exists.
#            Will only write to disk if the filesize is different.
# customPath: Full path. Specify where you want it downloaded. Default is paths.soundDir
# namesInEn: Boolean. Whether to download the files with the names in english or japanese. 
def scrapeShipSWF(toScrape=None, 
                  overwrite=False,
                  customPath=None,
                  namesInEn=True):
  noNewSWF = True
  logger.log("NEW SHIP SWF'S: ")
  swfURL = ["http://125.6.187.253/kcs/resources/swf/ships/","OBFNAME",".swf"]
  if toScrape == None:
    toScrape = kclib.returnAllShipNames()
  else:
    temp = set()
    for name in toScrape:
      name = name.lower()
      temp.update(kclib.returnVariants(name,True))
      temp.update(kclib.returnVariants(name,False))
    toScrape = list(temp)

  for ship in toScrape:

    isAbyssal = mapping[ship.lower()]["isAbyssal"]
    data = mapping[ship.lower()]
    lang = "en" if namesInEn else "jp"
    name = data[lang]
    if lang == "en":
      if not isAbyssal:
        temp = name.split(" ")
        for i in xrange(len(temp)):
          temp[i] = temp[i].capitalize()
        name = " ".join(temp)

    swfURL[1] = data["obf"]
    downloadPath = paths.swfDir if customPath == None else customPath
    swfFilePath = os.path.join(unicode(downloadPath),data["id"]+" "+name+ " - "+data["obf"]+u".swf")
    if not os.path.isfile(swfFilePath) or overwrite:
      f = open(swfFilePath,"wb")
      r = requests.get("".join(swfURL))
      f.write(r.content)
      f.close()
      print "GOT NEW SWF "+name.encode("utf-8")
      logger.verboseLog("GOT NEW SWF "+data["obf"], name.encode("utf-8"))
      logger.log("SWF FOR:--------"+data["obf"] + " - "+name.encode("utf-8"))
      noNewSWF = False
  if noNewSWF:
    logger.log("=No new SWF's downloaded")


# inp = """
# Kashima, Agano, Noshiro, Sakawa, Yahagi, Yura, Maya, Yuudachi, Asashimo
# """
# toCheck = inp.strip().replace(",","").split(" ")

#toDownload = os.path.join("/Users","YutoTakamoto","Desktop","Kancolle Scrape Data","temp")

# scrapeShipSWF(toScrape = kclib.returnAllShipNames(side="all"), 
#               overwrite = False,
#               customPath = None,
#               namesInEn = True)


