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
fileDir = os.path.join("/Users","YutoTakamoto","Desktop","Kancolle Scrape Data")

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



NEW_SWF_FOLDERS_AND_FILES = []
NEW_AUDIO_FOLDERS_AND_FILES = []
NEW_FURNITURE_FOLDERS_AND_FILES = []


newAudio = set()

if not os.path.isdir(fileDir):
  os.mkdir(fileDir)
swfDir = os.path.join(fileDir,"Flash")
if not os.path.isdir(swfDir):
  os.mkdir(swfDir)
soundDir = os.path.join(fileDir,"Sounds")
if not os.path.isdir(soundDir):
  os.mkdir(soundDir)
equipmentDir = os.path.join(fileDir,"Equipment")
if not os.path.isdir(equipmentDir):
  os.mkdir(equipmentDir)


for f in os.listdir(soundDir):
  print f
  logger.verboseLog(f)
print len(os.listdir(soundDir))
logger.verboseLog(len(os.listdir(soundDir)))

if G_GET_FURNITURE:
  import furnitureScraper
  furnitureScraper.scrape(fileDir)




if G_GET_SWF or G_GET_AUDIO:
  noNewSWF = True
  noNewAudio = True
  logger.log("NEW AUDIO AND/OR SWF'S: ")


  regexForInfo = re.compile("\"api_id\":(\d+),\"api_sortno\":(\d+),\"api_name\":\"(.*?)\",\"api_yomi\":")
  found = regexForInfo.findall(text,re.DOTALL)
  #print found

  apiNameMapping = {}

  # info[0] is api_id
  # info[1] is api_sortno
  for info in found:
    # Unicode escape because fucking double \'s
    # ('1', '31', '\\u7766\\u6708')　
    apiNameMapping[info[2].decode("unicode-escape")] = [info[0],info[1]]

  shipInfo = {}
  for name,info in apiNameMapping.items():
    thing = re.search("{\"api_id\":"+info[0]+",\"api_sortno\":"+info[1]+",\"api_filename\":\"(.*?)\"",text, re.DOTALL)
    obfName = thing.group(1)

    print name
    logger.verboseLog(name)
    print obfName.encode("utf-8")
    logger.verboseLog(obfName.encode("utf-8"))
    #if name.find(u"暁")>-1:
      #print obfName, name
    shipInfo[obfName] = {"shipName":name,"shipId":info[0],"sortno":info[1]}
  print shipInfo
  logger.verboseLog(shipInfo)
  print obfName
  logger.verboseLog(obfName)

  swfURL = ["http://125.6.187.253/kcs/resources/swf/ships/","OBFNAME",".swf"]
  audioURL = ["http://125.6.187.253/kcs/sound/kc","OBFNAME","/","AUDIONAME",".mp3"]

  for ship,vals in shipInfo.items():
    audioURL[1] = ship

    print "#############################################################"
    logger.verboseLog("#############################################################")

    ###################################
    # Getting SWF's
    if G_GET_SWF:
      print "aaaaa"
      logger.verboseLog("aaaaa")
      print ship,vals["shipName"].encode("utf-8")
      logger.verboseLog(ship,vals["shipName"].encode("utf-8"))
      swfURL[1] = ship
      swfFilePath = os.path.join(unicode(swfDir),vals["shipId"]+" "+vals["shipName"]+ " - "+ship+u".swf")
      if not os.path.isfile(swfFilePath):
        f = open(swfFilePath,"wb")
        r = requests.get("".join(swfURL))
        f.write(r.content)
        f.close()
        NEW_SWF_FOLDERS_AND_FILES.append(vals["shipName"])
        print "GOT NEW SWF "+ship, vals["shipName"].encode("utf-8")
        logger.verboseLog("GOT NEW SWF "+ship, vals["shipName"].encode("utf-8"))

        logger.log("SWF FOR:--------"+ship + " - "+vals["shipName"].encode("utf-8"))
        noNewSWF = False




    ####################################
    # Getting ship audio
    if G_GET_AUDIO:
      toSkip = False
      shipFolder = os.path.join(soundDir,vals["shipId"]+" "+vals["shipName"]+ " - "+ship)

      if not os.path.isdir(shipFolder):
        os.mkdir(shipFolder)
        NEW_AUDIO_FOLDERS_AND_FILES.append(shipFolder)

      # Loop through 1 to 60 to look for all potential ship voice lines
      for i in xrange(1,60):
        if toSkip:
          continue
        audioURL[3] = str(i)
        lineName = voiceIdMapping[i] if i in voiceIdMapping else "UNKNOWN"
        fileName = unicode(str(i))+u" "+unicode(lineName)+u" "+vals["shipName"]
        audioFilepath = os.path.join(shipFolder,fileName+".mp3")
        voiceResponse = None 
        isDifferentFilesize = None


        # If G_SKIP_IF_EXISTS is not set, then will download and check
        # all files to see if any of them have been updated. If they have been (eg different file size)
        # then it will go on and redownload
        if os.path.isfile(audioFilepath) and not G_SKIP_IF_EXISTS:
          voiceResponse = requests.get("".join(audioURL))
          curFileSize = os.path.getsize(audioFilepath)
          if "content-length" in voiceResponse.headers:
            isDifferentFilesize = (int(curFileSize) != int(voiceResponse.headers["content-length"]))

            if isDifferentFilesize:
              newAudio.add(ship)
              print "NEW AUDIO LINE"
              logger.verboseLog("NEW AUDIO LINE")

        else:
          for k,v in vals.items():
            vals[k] = v.decode("utf-8")
          lineName = voiceIdMapping[i] if i in voiceIdMapping else "UNKNOWN"
          print "File exists and not checking fileDiffs! "+" ".join([k+": "+v for k,v in vals.items()])+"\n===="+lineName
          logger.verboseLog("File exists and not checking fileDiffs! "+" ".join([k+": "+v for k,v in vals.items()])+"\n===="+lineName)

        # If we're not skipping AND the file exists, we redownload
        # OR the file just doesn't exist flatout.
        if (os.path.isfile(audioFilepath) and not G_SKIP_IF_EXISTS) or not os.path.isfile(audioFilepath):
          if not os.path.isfile(audioFilepath) or isDifferentFilesize:
            if voiceResponse == None:
              voiceResponse = requests.get("".join(audioURL))
            if "content-type" in voiceResponse.headers and voiceResponse.headers["content-type"] == "audio/mpeg":
              with open(audioFilepath,"wb") as f:
                for block in voiceResponse.iter_content(1024):
                  f.write(block)
                f.close()
              print "Scrape for "+fileName+" complete."
              logger.verboseLog("Scrape for "+fileName+" complete.")
              logger.log("SHIP GIRL LINE:-"+fileName)
              noNewAudio = False
            else:
              print "++++++++"+str("".join(audioURL))
              logger.verboseLog("++++++++"+str("".join(audioURL)))
              print audioURL
              logger.verboseLog(audioURL)
              print voiceResponse.headers
              logger.verboseLog(voiceResponse.headers)
              print voiceResponse
              logger.verboseLog(voiceResponse)
              if i < 5 or i >28:
                toSkip = True
              print "Invalid content-type, likely a file that doesn't exist!"
              logger.verboseLog("Invalid content-type, likely a file that doesn't exist!")
          else:
            print "A file by the path "+str(audioFilepath)+" already exists!"
            logger.verboseLog("A file by the path "+str(audioFilepath)+" already exists!")
        else:
          pass
  if G_GET_AUDIO:
    print "Ding! Audio scraping done!"
    logger.verboseLog("Ding! Audio scraping done!")
    print newAudio
    logger.verboseLog(newAudio)
  if G_GET_SWF:
    print "Ding! .swf file scraping done!"
    logger.verboseLog("Ding! .swf file scraping done!")
  if noNewAudio and noNewSWF:
    logger.log("=No new SWF or audio downloaded")
  logger.log("\n")


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


if G_PRINT_RESULTS:
  print "HERE ARE THE NEW FOLDERS"
  logger.verboseLog("HERE ARE THE NEW FOLDERS")
  print NEW_SWF_FOLDERS_AND_FILES
  logger.verboseLog(NEW_SWF_FOLDERS_AND_FILES)
  print NEW_AUDIO_FOLDERS_AND_FILES
  logger.verboseLog(NEW_AUDIO_FOLDERS_AND_FILES)
  print NEW_FURNITURE_FOLDERS_AND_FILES
  logger.verboseLog(NEW_FURNITURE_FOLDERS_AND_FILES)




  
#f.close()

