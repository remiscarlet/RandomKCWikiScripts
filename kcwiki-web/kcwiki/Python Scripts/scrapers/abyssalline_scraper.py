# -*- coding: UTF-8 -*-
#
# Description:
# Downloads all voices from the atpages page. 
#
# This script is only used for pulling old abyssal voices
# (because many are not on the servers anymore)

import sys
reload(sys)
sys.setdefaultencoding('utf8')
import os
import re
import cfscrape
from kcinit import *

def scrapeAbyssalLines(customPath=None,overwrite = False):
  scraper = cfscrape.create_scraper()
  scraper2 = cfscrape.create_scraper()

  baseURL = "http://www51.atpages.jp/kancollev/kcvdownload.php?kcvd=kc"
  shipIdList = [
    540,
    548,
    556,
    557,
    573,
    574,
    581,
    582,
    583,
    584,
    585,
    586,
    9597,
    9598,
    9599,
    9601,
    9603,
    9605,
    9611,
    9613,
    9625,
    9628,
    9631,
    9637,
    9641,
    9644,
    9647,
    9181,
    9182,
    9183,
    9582,
    9583,
    9584,
    9585,
    9586,
    9999,
    "9999b"
  ]

  baseDir = customPath if customPath != None else paths.abyssalSoundDir
  if not os.path.isdir(baseDir):
    os.mkdir(baseDir)
  title = None

  mapping = kclib.returnFullAssocShipIdentDict()

  for shipId in shipIdList:
    voiceIdList = [i+1 for i in xrange(12)]
    if shipId in [9181,9182,9183]:
      voiceIdList = [i+1 for i in xrange(53)]
    if shipId == 9999:
      voiceIdList = [i+1 for i in xrange(28)]
    if shipId == "9999b":
      voiceIdList = [i+1 for i in xrange(300,318)]

    pageUrl = "http://www51.atpages.jp/kancollev/kcplayer.php?f=0&c="+str(shipId)+"v1"
    response = scraper2.get(pageUrl)
    response.encoding = "EUC-JP"
    pageResponse = response.text
    title = re.search(r'<title>.*</title>',pageResponse).group()[14:-10]
    title = title.replace("???",str(shipId))
    title = title.replace(u"＊","")
    title = title.replace(u"*","")
    print pageUrl
    logger.verboseLog(pageUrl)
    print title
    logger.verboseLog(title)
    name = title.split(" ")[1]
    if name == "----":
      continue
    enName = mapping[name.encode("utf-8").lower()]["en"] if name.encode("utf-8").lower() in mapping else ""
    if shipId == 9999:
      enName = "Misc Voices"
    if shipId == "9999b":
      enName = "Akashi's Arsenal"

    shipNum = str(shipId)
    title = "No."+str(shipId)+" "+enName
    folder = os.path.join(baseDir,title)
    if not os.path.isdir(folder):
      os.mkdir(folder)
    if shipNum != "0":
      for voiceId in voiceIdList:
        fileName = title+" - "+str(voiceId)+".mp3"
        if not os.path.isfile(os.path.join(folder,fileName)) or overwrite:
          try:
            url = baseURL+str(shipId)+"v"+str(voiceId)+".mp3vd"
            voiceResponse = scraper.get(url, stream=True)
            if "content-type" in voiceResponse.headers and voiceResponse.headers["content-type"] == "audio/mpeg":
              with open(folder+"/"+fileName,"wb") as f:
                for block in voiceResponse.iter_content(1024):
                  f.write(block)
                f.close()
              print "Scrape for "+fileName+" complete."
              logger.verboseLog("Scrape for "+fileName+" complete.")
              logger.log("Scrape for "+fileName+" complete.")
            else:
              print "Invalid content-type, likely a file that doesn't exist!"
              logger.verboseLog("Invalid content-type, likely a file that doesn't exist!")
          except:
            print "Failed on shipId: "+str(shipId)+" for voiceId: "+str(voiceId)
            logger.verboseLog("Failed on shipId: "+str(shipId)+" for voiceId: "+str(voiceId))
        else: 
          print fileName+" already exists!"
          logger.verboseLog(fileName+" already exists!")
    else:
      print "Invalid url! "+pageUrl
      logger.verboseLog("Invalid url! "+pageUrl)
