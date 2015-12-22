# -*- coding: UTF-8 -*-
import sys
reload(sys)
sys.setdefaultencoding('utf8')
import re
import requests
import json
import os

text = "";

f = open(os.path.join(os.path.dirname(os.path.realpath(__file__)),"dump.json"),"r")

text = f.readline()

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

########################
########################
########################
G_GET_AUDIO = True
G_GET_SWF = True
G_GET_FURNITURE = True
G_GET_EQUIPMENT = True
G_COLOR_NEW_FOLDER = False # SET THIS TO FALSE IF ON ANYTHING THAT IS NOT MAC
G_PRINT_RESULTS = True
G_SKIP_IF_EXISTS = True
########################
########################
########################


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

fileDir = os.path.join("/Users","YutoTakamoto","Desktop","Kancolle Scrape Data")
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
preExistingKanmusu = list()

for file in os.listdir(soundDir):
  print file

print len(os.listdir(soundDir))



if G_GET_FURNITURE:
  for furniture,link in funitureURLDict.items():
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
                print "File \""+fileName+"\" completed downloading."
                NEW_FURNITURE_FOLDERS_AND_FILES.append(fileDir)
              else:
                print "File \""+fileName+"\" doesn't exist!"
          else:
            if i < 5 or i >28:
              toSkip = True
            print "File \""+fileName+"\" doesn't exist on the server!"
        else:
          existingName = fileName if existingName == "" else existingName
          print "File \""+existingName+"\" already exists!"
    print "Ding! Furniture grabbing done."
print fileDir
if G_GET_SWF or G_GET_AUDIO:
  found = re.findall("\"api_id\":\d+,\"api_sortno\":\d+,\"api_name\":\".+?\",\"api_yomi\":\".+?\",\"api_stype", text, re.DOTALL)
  regexForInfo = re.compile("\"api_id\":(\d+),\"api_sortno\":(\d+),\"api_name\":\"(.*?)\",\"api_yomi\":")
  found = regexForInfo.findall(text,re.DOTALL)
  print found
  ################# print found[0][2].decode("unicode-escape") ####################
  # ('1', '31', '\\u7766\\u6708')　
  apiNameMapping = {}
  for info in found:
    # info[0] = api_id
    # info[1] = api_sortno
    apiNameMapping[info[2].decode("unicode-escape")] = [info[0],info[1]]
  print apiNameMapping
  print "###########"
  shipInfo = {}
  for name,info in apiNameMapping.items():
    #print "a"
    #####
    thing = re.search("{\"api_id\":"+info[0]+",\"api_sortno\":"+info[1]+",\"api_filename\":\"(.*?)\"",text, re.DOTALL)
    #####
    #print "b"
    #print thing.group(0).replace("\n","")
    #f.write(str(thing)+"\n")
    #print thing.group(1)
    obfName = thing.group(1)
    print name
    print obfName.encode("utf-8")
    #if name.find(u"暁")>-1:
      #print obfName, name
    shipInfo[obfName] = {"shipName":name,"shipId":info[0],"sortno":info[1]}
  print shipInfo
  print obfName
  swfURL = ["http://125.6.187.253/kcs/resources/swf/ships/","OBFNAME",".swf"]
  audioURL = ["http://125.6.187.253/kcs/sound/kc","OBFNAME","/","AUDIONAME",".mp3"]
  #f = open(os.path.join(os.path.curdir,"Kancolle Scrape Data","obfName_to_Name.txt"),"w")
  for ship,vals in shipInfo.items():
    audioURL[1] = ship
    if G_GET_SWF:
      print "aaaaa"
      print ship,vals["shipName"].encode("utf-8")
      swfURL[1] = ship
      swfFilePath = os.path.join(unicode(swfDir),vals["shipId"]+" "+vals["shipName"]+ " - "+ship+u".swf")
      if not os.path.isfile(swfFilePath):
        f = open(swfFilePath,"wb")
        r = requests.get("".join(swfURL))
        f.write(r.content)
        f.close()
        NEW_SWF_FOLDERS_AND_FILES.append(vals["shipName"])
        print "GOT NEW SWF "+ship, vals["shipName"].encode("utf-8")
    if G_GET_AUDIO:
      print "aaa"
      print ship,vals
      toSkip = False
      shipFolder = os.path.join(soundDir,vals["shipId"]+" "+vals["shipName"]+ " - "+ship)

      if not os.path.isdir(shipFolder):
        os.mkdir(shipFolder)
        NEW_AUDIO_FOLDERS_AND_FILES.append(shipFolder)
      for i in xrange(1,60):
        print "#####################################"
        print toSkip
        if toSkip:
          continue
        audioURL[3] = str(i)
        lineName = voiceIdMapping[i] if i in voiceIdMapping else "UNKNOWN"
        fileName = unicode(str(i))+u" "+unicode(lineName)+u" "+vals["shipName"]
        audioFilepath = os.path.join(shipFolder,fileName+".mp3")
        voiceResponse = None 
        isDifferentFilesize = None
        if os.path.isfile(audioFilepath) and not G_SKIP_IF_EXISTS:
          voiceResponse = requests.get("".join(audioURL))
          curFileSize = os.path.getsize(audioFilepath)
          if "content-length" in voiceResponse.headers:
            isDifferentFilesize = (int(curFileSize) != int(voiceResponse.headers["content-length"]))
            #print curFileSize
            #print voiceResponse.headers["content-length"]
            #print curFileSize != voiceResponse.headers["content-length"]
            #print type(curFileSize),type(voiceResponse.headers["content-length"])
            if isDifferentFilesize:
              newAudio.add(ship)
              print "NEW AUDIO LINE"
        else:
          print "File already exists and set to not check for dupe files! Checking: "+str(vals)
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
            else:
              print "++++++++"+str("".join(audioURL))
              print audioURL
              print voiceResponse.headers
              print voiceResponse
              if i < 5 or i >28:
                toSkip = True
              print "Invalid content-type, likely a file that doesn't exist!"
          else:
            print "A file by the path "+str(audioFilepath)+" already exists!"
        else:
          pass#print str(audioFilepath)+" already exists!"
  if G_GET_AUDIO:
    print "Ding! Audio scraping done!"
    print newAudio
  if G_GET_SWF:
    print "Ding! .swf file scraping done!"
if G_GET_EQUIPMENT:
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
              print "File \""+fileName+"\" completed downloading."
            else:
              print "File \""+fileName+"\" doesn't exist!"
        else:
          print "File didn't exist on the server! - "+str(fileName)
      else:
        print fileName+" already exists!"

def printList(lst):
  for i in lst:
    print i

if G_PRINT_RESULTS:
  print "HERE ARE THE NEW FOLDERS"
  print NEW_SWF_FOLDERS_AND_FILES
  print NEW_AUDIO_FOLDERS_AND_FILES
  print NEW_FURNITURE_FOLDERS_AND_FILES




  
#f.close()

