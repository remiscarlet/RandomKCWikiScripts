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
import re
import requests
import json
import os
import datetime


########################
########################
########################
# Modify this to point to where you want the data to be dumped.
fileDir = os.path.join("/Users","YutoTakamoto","Desktop","Kancolle Scrape Data")

# Settings
G_GET_AUDIO = True
G_GET_SWF = True
G_GET_FURNITURE = True
G_GET_EQUIPMENT = True
G_PRINT_RESULTS = True
G_SKIP_IF_EXISTS = True
########################
########################
########################




BASEDIR = os.path.dirname(os.path.realpath(__file__))
text = "";
f = open(os.path.join(BASEDIR,"dump.json"),"r")
text = f.readline()
f.close()

scrapeDir = os.path.join(BASEDIR,"Scrape Logs")
if not os.path.isdir(scrapeDir):
  os.mkdir(scrapeDir)
tm = datetime.datetime.now()
timeStr = str(tm.strftime("%m%d%Y-%H%M%S"))
logFilePath = os.path.join(scrapeDir,"log-"+timeStr+".log")
verboseLogFilePath = os.path.join(scrapeDir,"log_verbose-"+timeStr+".log")

# Will simply append line to log file.
# Will add newlines automatically
def log(*string):
  string = " ".join(map(lambda x: str(x),string))
  global logFilePath
  logFile = open(logFilePath,"a")
  logFile.write(str(string)+"\n")
  logFile.close()

# Will log to the verbose file.
def verboseLog(*string):
  string = " ".join(map(lambda x: str(x),string))
  global verboseLogFilePath
  logFile = open(verboseLogFilePath,"a")
  logFile.write(str(string)+"\n")
  logFile.close()

voiceIdMapping = {
  1:"Intro",
  2:"Secretary 1",
  3:"Secretary 2",
  4:"Secretary 3",
  5:"Ship Construction",
  6:"Repair Complete",
  7:"Return From Sortie",
  8:"Player Score",
  9:"Equipment 1",
  10:"Equipment 2",
  11:"Repair Light Damage",
  12:"Repair Medium Damage",
  13:"Joining A Fleet",
  14:"Start Sortie",
  15:"Battle Start",
  16:"Attack",
  17:"Night Attack",
  18:"Night Battle",
  19:"Minor Damage 1",
  20:"Minor Damage 2",
  21:"Moderately Damaged",
  22:"Sunk",
  23:"MVP",
  24:"Wedding",
  25:"Library Intro",
  26:"Equipment 3",
  27:"Supply",
  28:"Secretary Married",
  29:"Secretary Idle",
  30:"Hourly 0000",
  31:"Hourly 0100",
  32:"Hourly 0200",
  33:"Hourly 0300",
  34:"Hourly 0400",
  35:"Hourly 0500",
  36:"Hourly 0600",
  37:"Hourly 0700",
  38:"Hourly 0800",
  39:"Hourly 0900",
  40:"Hourly 1000",
  41:"Hourly 1100",
  42:"Hourly 1200",
  43:"Hourly 1300",
  44:"Hourly 1400",
  45:"Hourly 1500",
  46:"Hourly 1600",
  47:"Hourly 1700",
  48:"Hourly 1800",
  49:"Hourly 1900",
  50:"Hourly 2000",
  51:"Hourly 2100",
  52:"Hourly 2200",
  53:"Hourly 2300",
}


funitureURLDict = {
  "Desk":"http://125.6.187.253/kcs/resources/image/furniture/desk/",
  "Chest":"http://125.6.187.253/kcs/resources/image/furniture/chest/",
  "Object":"http://125.6.187.253/kcs/resources/image/furniture/object/",
  "Window":"http://125.6.187.253/kcs/resources/image/furniture/window/",
  "Floor":"http://125.6.187.253/kcs/resources/image/furniture/floor/",
  "Wall":"http://125.6.187.253/kcs/resources/image/furniture/wall/"
}

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
furnitureDir = os.path.join(fileDir,"Furniture")
if not os.path.isdir(furnitureDir):
  os.mkdir(furnitureDir)
equipmentDir = os.path.join(fileDir,"Equipment")
if not os.path.isdir(equipmentDir):
  os.mkdir(equipmentDir)


# Get list of preexisting kanmusu shipIDs and names from voices (Assuming all voices and swfs coexist)
preExistingKanmusu = list() # <- ???????? I know I was going somewhere with this but hell if I know now

for f in os.listdir(soundDir):
  print f
  verboseLog(f)
print len(os.listdir(soundDir))
verboseLog(len(os.listdir(soundDir)))



if G_GET_FURNITURE:
  noNewFurniture = True
  log("NEW FURNITURES: ")
  for furniture,link in funitureURLDict.items():
    # As in specifically for each furniture
    furnitureSpecificDir = os.path.join(furnitureDir,furniture)
    if not os.path.isdir(furnitureSpecificDir):
      os.mkdir(furnitureSpecificDir)
    #for easier writing
    furnDir = furnitureSpecificDir
    for i in xrange(50):
      toSkip = False
      baseURL = link+("%03d" % i)
      formats = [".png",".jpg",".swf"]
      alreadyExists = False
      for format in formats:

        if alreadyExists or toSkip:
          continue

        url = baseURL+format
        fileName = furniture+(" - %03d" % i)+format
        fileDir = os.path.join(furnDir,fileName)
        alreadyExists = False
        existingName = ""


        for f in formats:
          fName = furniture+(" - %03d" % i)+f
          fDir = os.path.join(furnDir,fName)
          if os.path.isfile(fDir):
            alreadyExists = True
            existingName = fName

        if not os.path.isfile(fileDir) and not alreadyExists:
          resp = requests.get(url)
          if resp.status_code != 404:
            with open(fileDir, "wb") as f:
              if resp.status_code != 404:
                for block in resp.iter_content(1024):
                  f.write(block)
                f.close()
                print url
                verboseLog(url)
                print fileDir
                verboseLog(fileDir)
                print "File \""+fileName+"\" completed downloading."
                verboseLog("File \""+fileName+"\" completed downloading.")
                NEW_FURNITURE_FOLDERS_AND_FILES.append(fileDir)
                log(fileDir)
                noNewFurniture = False

              else:
                print "File \""+fileName+"\" doesn't exist!"
                verboseLog("File \""+fileName+"\" doesn't exist!")

          else:
            if i < 5 or i >28:
              toSkip = True
            print "File \""+fileName+"\" doesn't exist on the server!"
            verboseLog("File \""+fileName+"\" doesn't exist on the server!")

        else:
          existingName = fileName if existingName == "" else existingName
          print "File \""+existingName+"\" already exists!"
          verboseLog("File \""+existingName+"\" already exists!")

  print "Ding! Furniture grabbing done."
  verboseLog("Ding! Furniture grabbing done.")
  if noNewFurniture:
    log("= No new furnitures downloaded!")
  log("\n")




if G_GET_SWF or G_GET_AUDIO:
  noNewSWF = True
  noNewAudio = True
  log("NEW AUDIO AND/OR SWF'S: ")


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
    verboseLog(name)
    print obfName.encode("utf-8")
    verboseLog(obfName.encode("utf-8"))
    #if name.find(u"暁")>-1:
      #print obfName, name
    shipInfo[obfName] = {"shipName":name,"shipId":info[0],"sortno":info[1]}
  print shipInfo
  verboseLog(shipInfo)
  print obfName
  verboseLog(obfName)

  swfURL = ["http://125.6.187.253/kcs/resources/swf/ships/","OBFNAME",".swf"]
  audioURL = ["http://125.6.187.253/kcs/sound/kc","OBFNAME","/","AUDIONAME",".mp3"]

  for ship,vals in shipInfo.items():
    audioURL[1] = ship

    print "#############################################################"
    verboseLog("#############################################################")

    ###################################
    # Getting SWF's
    if G_GET_SWF:
      print "aaaaa"
      verboseLog("aaaaa")
      print ship,vals["shipName"].encode("utf-8")
      verboseLog(ship,vals["shipName"].encode("utf-8"))
      swfURL[1] = ship
      swfFilePath = os.path.join(unicode(swfDir),vals["shipId"]+" "+vals["shipName"]+ " - "+ship+u".swf")
      if not os.path.isfile(swfFilePath):
        f = open(swfFilePath,"wb")
        r = requests.get("".join(swfURL))
        f.write(r.content)
        f.close()
        NEW_SWF_FOLDERS_AND_FILES.append(vals["shipName"])
        print "GOT NEW SWF "+ship, vals["shipName"].encode("utf-8")
        verboseLog("GOT NEW SWF "+ship, vals["shipName"].encode("utf-8"))

        log("SWF FOR:--------"+ship + " - "+vals["shipName"].encode("utf-8"))
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
              verboseLog("NEW AUDIO LINE")

        else:
          for k,v in vals.items():
            vals[k] = v.decode("utf-8")
          lineName = voiceIdMapping[i] if i in voiceIdMapping else "UNKNOWN"
          print "File exists and not checking fileDiffs! "+" ".join([k+": "+v for k,v in vals.items()])+"\n===="+lineName
          verboseLog("File exists and not checking fileDiffs! "+" ".join([k+": "+v for k,v in vals.items()])+"\n===="+lineName)

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
              verboseLog("Scrape for "+fileName+" complete.")
              log("SHIP GIRL LINE:-"+fileName)
              noNewAudio = False
            else:
              print "++++++++"+str("".join(audioURL))
              verboseLog("++++++++"+str("".join(audioURL)))
              print audioURL
              verboseLog(audioURL)
              print voiceResponse.headers
              verboseLog(voiceResponse.headers)
              print voiceResponse
              verboseLog(voiceResponse)
              if i < 5 or i >28:
                toSkip = True
              print "Invalid content-type, likely a file that doesn't exist!"
              verboseLog("Invalid content-type, likely a file that doesn't exist!")
          else:
            print "A file by the path "+str(audioFilepath)+" already exists!"
            verboseLog("A file by the path "+str(audioFilepath)+" already exists!")
        else:
          pass
  if G_GET_AUDIO:
    print "Ding! Audio scraping done!"
    verboseLog("Ding! Audio scraping done!")
    print newAudio
    verboseLog(newAudio)
  if G_GET_SWF:
    print "Ding! .swf file scraping done!"
    verboseLog("Ding! .swf file scraping done!")
  if noNewAudio and noNewSWF:
    log("=No new SWF or audio downloaded")
  log("\n")


########################
# Grab equipment
if G_GET_EQUIPMENT:
  log("NEW EQUIPMENTS")
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
              verboseLog(url)
              print "File \""+fileName+"\" completed downloading."
              verboseLog("File \""+fileName+"\" completed downloading.")

              noNewEquipment = False
              log(fileDir)
            else:
              print "File \""+fileName+"\" doesn't exist!"
              verboseLog("File \""+fileName+"\" doesn't exist!")
        else:
          print "File didn't exist on the server! - "+str(fileName)
          verboseLog("File didn't exist on the server! - "+str(fileName))
      else:
        print fileName+" already exists!"
        verboseLog(fileName+" already exists!")
  if noNewEquipment:
    log("No new equipment downloaded")


if G_PRINT_RESULTS:
  print "HERE ARE THE NEW FOLDERS"
  verboseLog("HERE ARE THE NEW FOLDERS")
  print NEW_SWF_FOLDERS_AND_FILES
  verboseLog(NEW_SWF_FOLDERS_AND_FILES)
  print NEW_AUDIO_FOLDERS_AND_FILES
  verboseLog(NEW_AUDIO_FOLDERS_AND_FILES)
  print NEW_FURNITURE_FOLDERS_AND_FILES
  verboseLog(NEW_FURNITURE_FOLDERS_AND_FILES)




  
#f.close()

