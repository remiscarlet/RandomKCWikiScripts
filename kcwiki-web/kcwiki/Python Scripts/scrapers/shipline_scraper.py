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

# toScrape should be a list
# overWrite should be a boolean
def scrapeShiplines(toScrape=None, linesToCheck=None, overwrite=False,ignoreFilesize=False, customPath=None):
  audioURL = ["http://125.6.187.253/kcs/sound/kc","OBFNAME","/","AUDIONAME",".mp3"]
  if toScrape == None:
    toScrape = kclib.returnAllShipNamesJp()
  else:
    temp = set()
    for name in toScrape:
      name = name.lower()
      temp.update(kclib.returnVariants(name,True))
      temp.update(kclib.returnVariants(name,False))
    toScrape = list(temp)

  for ship in toScrape:
    data = mapping[ship.lower()]
    audioURL[1] = data["obf"]
    toSkip = False
    baseDir = customPath if customPath != None else paths.soundDir
    shipFolder = os.path.join(baseDir,data["id"]+" "+data["en"].capitalize()+ " - "+data["obf"])

    if not os.path.isdir(shipFolder):
      os.mkdir(shipFolder)

    # Loop through 1 to 60 to look for all potential ship voice lines
    if linesToCheck == None:
      linesToCheck = xrange(1,60)
    for i in linesToCheck:

      if toSkip:
        continue
      audioURL[3] = str(i)
      lineName = kclib.voiceIdMapping[i] if i in kclib.voiceIdMapping else "UNKNOWN"
      fileName = unicode(str(i))+u" "+unicode(lineName)+u" "+data["en"].capitalize()
      audioFilepath = os.path.join(shipFolder,fileName+".mp3")
      voiceResponse = None 
      isDifferentFilesize = None


      # If overwrite is set, then will download and check
      # all files to see if any of them have been updated. If they have been (eg different file size)
      # then it will go on and redownload
      if os.path.isfile(audioFilepath):
        if overwrite:
          voiceResponse = requests.get("".join(audioURL))
          curFileSize = os.path.getsize(audioFilepath)
          if "content-length" in voiceResponse.headers:
            isDifferentFilesize = (int(curFileSize) != int(voiceResponse.headers["content-length"]))
            if isDifferentFilesize:
              newAudio.add(ship)
              print "NEW AUDIO LINE"
              logger.verboseLog("NEW AUDIO LINE")
        else:
          lineName = kclib.voiceIdMapping[i] if i in kclib.voiceIdMapping else "UNKNOWN"
          print "File exists and not checking fileDiffs! "+" ".join([k+": "+v for k,v in data.items()])+"\n===="+lineName
          logger.verboseLog("File exists and not checking fileDiffs! "+" ".join([k+": "+v for k,v in data.items()])+"\n===="+lineName)


      # If we're not skipping AND the file exists, we redownload
      # OR the file just doesn't exist flatout.
      if (os.path.isfile(audioFilepath) and overwrite) or not os.path.isfile(audioFilepath):
        if not os.path.isfile(audioFilepath) or isDifferentFilesize or (os.path.isfile(audioFilepath) and ignoreFilesize):
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
          if not isDifferentFilesize:
            print "The exact same file at "+str(audioFilepath)+" already exists! (Has not changed)"
            logger.verboseLog( "The exact same file at "+str(audioFilepath)+" already exists! (Has not changed)")
          elif os.path.isfile(audioFilepath):
            print "A file by the path "+str(audioFilepath)+" already exists!"
            logger.verboseLog("A file by the path "+str(audioFilepath)+" already exists!")

      else:
        pass


inp = """
Kashima, Agano, Noshiro, Sakawa, Yahagi, Yura, Maya, Yuudachi, Asashimo
"""
toCheck = inp.strip().replace(",","").split(" ")

toDownload = os.path.join("/Users","YutoTakamoto","Desktop","Kancolle Scrape Data","temp")

scrapeShiplines(toScrape = toCheck, overwrite = True,linesToCheck=[2,3,4],ignoreFilesize=True, customPath=toDownload)


