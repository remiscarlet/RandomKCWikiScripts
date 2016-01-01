# -*- coding: UTF-8 -*-
# kanmusu_data_mapper.py
#
# Description: 
# Will simply download every map that is still accessible
# An important point that devs seem to remove the files for 
# any event map older than 3 events ago. :(
# 
#

import sys
reload(sys)
sys.setdefaultencoding('utf8')
from kcinit import *
import kc_swf_extractor

def scrapeMap(customPath=None,overwrite = False):
  if customPath == None:
    path = paths.mapDir
  else:
    path = customPath
  url = ["http://125.6.189.135/kcs/resources/swf/map/","WORLD","_","MAP",".swf"]
  maps = kclib.sortieMapMapping
  for world,mapLimit in maps.items():
    url[1] = str("%02d" % world)
    worldDir = os.path.join(path,"World "+str(world))

    if not os.path.isdir(worldDir):
      os.mkdir(worldDir)

    for map in xrange(1,mapLimit+1):
      url[3] = str("%02d" % map)
      print "".join(url)

      fileName = "".join(url[1:])
      downloadFile = os.path.join(worldDir,fileName)

      if not os.path.isfile(downloadFile) or overwrite:
        r = requests.get("".join(url))
        if "content-type" in r.headers and r.headers["content-type"] == "application/x-shockwave-flash":
          with open(downloadFile,"wb") as musicf:
            for block in r.iter_content(1024):
              musicf.write(block)

          print "Scrape for "+downloadFile+" complete."
          logger.verboseLog("Scrape for "+downloadFile+" complete.")
          logger.log("Music:" +fileName.replace("swf","mp3")+" "+downloadFile)
        else:
          print "File did not exist on the server! "+downloadFile
          logger.verboseLog("File did not exist on the server! "+downloadFile)
      else:
        print "The file already exists! "+downloadFile
        logger.verboseLog("The file already exists! "+downloadFile)

  kc_swf_extractor.unpackEverything(path)


