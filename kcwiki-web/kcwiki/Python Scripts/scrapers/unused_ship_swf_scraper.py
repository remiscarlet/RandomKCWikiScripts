# -*- coding: UTF-8 -*-
#
# Description: 
# This will scrape shit from api_mst_shipgraph that 
# DO NOT MAP TO ANYTHING IN api_mst_ship. Presumably these
# are all seasonal CG that aren't used atm or old ships (eg arpeggio shipsw)
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


# overwrite: A boolean on whether to overwrite even if file exists.
#            Will only write to disk if the filesize is different.
# customPath: Full path. Specify where you want it downloaded. Default is paths.soundDir
def scrapeUnusedShipSWF(overwrite=False,
                         customPath=None):
  noNewSWF = True
  dictOfObfIds = kclib.returnDictOfAllObfIds()
  obfToNameMapping = kclib.unusedSWFObfIdMapping
  swfURL = ["http://125.6.187.253/kcs/resources/swf/ships/","OBFNAME",".swf"]

  for obfId,apiId in dictOfObfIds.items():
    apiId = str(apiId)
    if obfId not in mapping:
      swfURL[1] = obfId
      name = obfToNameMapping[obfId] if obfId in obfToNameMapping else "UNKNOWN"
      if name == "NULL":
        continue
      downloadPath = paths.unusedSwfDir if customPath == None else customPath
      swfFilePath = os.path.join(unicode(downloadPath),apiId+" "+name+" - "+obfId+u".swf")
      if not os.path.isfile(swfFilePath) or overwrite:
        f = open(swfFilePath,"wb")
        r = requests.get("".join(swfURL))
        f.write(r.content)
        f.close()
        print "GOT NEW UNUSED SWF "+apiId+" "+obfId+" "+name
        logger.verboseLog("GOT NEW SWF "+apiId+" "+obfId+" "+name )
        logger.log("UNUSED SWF FOR:--------"+apiId+" "+obfId + " - "+name)
        noNewSWF = False
    if noNewSWF:
      logger.log("=No new Unused SWF's downloaded")


scrapeUnusedShipSWF(overwrite = False,
                    customPath = None)


