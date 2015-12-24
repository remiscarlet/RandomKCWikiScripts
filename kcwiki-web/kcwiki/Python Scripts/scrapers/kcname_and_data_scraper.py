# -*- coding: UTF-8 -*-

# kcname_and_data_scraper.py
#
# Description: 
# Will take the json dump from kcsapi/api_start2
# and pull relevant information on shipgirls such as obfusicated names
# and other information. Will then download all resources such as voices, swf's
# furniture and equipment resources from server and download to disk.
#
# Additional Info:
# To extract images from SWFs: Run kc_swf_extractor.py
# To rename files from jp->en run renameJpToEn.py
# To encode mp3 -> ogg, run mp3_to_ogg_converter.py
#
# INPUT: 
# Must have a dump.json built from running the nodejs application
# located in kcwiki-web/nodeShit/api_getter.js. Read file for more information.
#
# Output: 
# All data mentioned in desc will be dumped to directory
# specified by fileDir in line 40.



import sys
reload(sys)
sys.setdefaultencoding('utf8')
from kcinit import *
import datetime



########################
########################
########################
# Modify this to point to where you want the data to be dumped.
# Settings
G_GET_AUDIO = True
G_GET_SWF = True
G_GET_FURNITURE = False
G_GET_EQUIPMENT = False
G_PRINT_RESULTS = True
G_SKIP_IF_EXISTS = True
########################
########################
########################




BASEDIR = os.path.dirname(os.path.realpath(__file__))
text = "";
f = open(paths.masterdump,"r")
text = f.readline()
f.close()

for f in os.listdir(soundDir):
  print f
  logger.verboseLog(f)
print len(os.listdir(soundDir))
logger.verboseLog(len(os.listdir(soundDir)))

if G_GET_FURNITURE:
  import furnitureScraper
  furnitureScraper.scrape(paths.scrapeDir)


########################
# Grab equipment
if G_GET_EQUIPMENT:
  logger.log("NEW EQUIPMENTS")
  noNewEquipment = True

  equipIds = [i for i in xrange(200)]
  baseURLDict = {
    "ItemFairy":"http://125.6.187.253/kcs/resources/image/slotitem/item_character/",
    "ItemCard":"http://125.6.187.253/kcs/resources/image/slotitem/card/",
    "ItemName":"http://125.6.187.253/kcs/resources/image/slotitem/statustop_item/",
    "ItemAlphaNoFairy":"http://125.6.187.253/kcs/resources/image/slotitem/item_up/",
    "ItemAlphaWithFairy":"http://125.6.187.253/kcs/resources/image/slotitem/item_on/"
  }
  # equipmentDir => baseDir
  for equipId in equipIds:
    for cardName,baseURL in baseURLDict.items():
      fileDir = os.path.join(equipmentDir,str(equipId))
      if not os.path.isdir(fileDir):
        os.mkdir(fileDir)
      fileName = ("%03d"%equipId)+" - "+cardName+".png"
      fileDir = os.path.join(fileDir,fileName)
      if not os.path.isfile(fileDir):
        url = baseURL+"%03d"%equipId+".png"
        resp = requests.get(url)
        if resp.status_code != 404:
          with open(fileDir, "wb") as f:
            if resp.status_code != 404:
              for block in resp.iter_content(1024):
                f.write(block)
              f.close()
              print url
              logger.verboseLog(url)
              print "File \""+fileName+"\" completed downloading."
              logger.verboseLog("File \""+fileName+"\" completed downloading.")

              noNewEquipment = False
              logger.log(fileDir)
            else:
              print "File \""+fileName+"\" doesn't exist!"
              logger.verboseLog("File \""+fileName+"\" doesn't exist!")
        else:
          print "File didn't exist on the server! - "+str(fileName)
          logger.verboseLog("File didn't exist on the server! - "+str(fileName))
      else:
        print fileName+" already exists!"
        logger.verboseLog(fileName+" already exists!")
  if noNewEquipment:
    logger.log("No new equipment downloaded")


