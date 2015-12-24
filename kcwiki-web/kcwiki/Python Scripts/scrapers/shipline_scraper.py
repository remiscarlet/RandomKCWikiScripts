# -*- coding: UTF-8 -*-
#
# Description: 
# Scrapes shiplines based on several inputs described
# below by the parameters to scrapeShiplines
# Reads in data such as obfuscated names from json file
#

import sys
reload(sys)
sys.setdefaultencoding('utf8')
from kcinit import *

mapping = kclib.returnFullAssocShipIdentDict()

# toScrape: A list of names to scrape. Can be a list of 
#           jp names, en names, api_id's or obfuscated names.
# linesToCheck: A list of voice id's to download.
# overwrite: A boolean on whether to overwrite even if file exists.
#            Will only write to disk if the filesize is different.
# customPath: Full path. Specify where you want it downloaded. Default is paths.soundDir
# namesInEn: Boolean. Whether to download the files with the names in english or japanese. 
def scrapeShiplines(toScrape=None, 
                    linesToCheck=None, 
                    overwrite=False,
                    customPath=None,
                    namesInEn=True):
  audioURL = ["http://125.6.187.253/kcs/sound/kc","OBFNAME","/","AUDIONAME",".mp3"]
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
    lang = "en" if namesInEn else "jp"
    data = mapping[ship.lower()]
    audioURL[1] = data["obf"]
    toSkip = False
    baseDir = customPath if customPath != None else paths.soundDir
    if not isAbyssal:
      shipFolder = os.path.join(baseDir,data["id"]+" "+data[lang].capitalize()+ " - "+data["obf"])
    else:
      shipFolder = os.path.join(baseDir,data["id"]+" "+data[lang]+ " - "+data["obf"])

    if not os.path.isdir(shipFolder):
      os.mkdir(shipFolder)

    # Loop through 1 to 60 to look for all potential ship voice lines
    if linesToCheck == None:
      linesToCheck = xrange(1,60)
    for i in linesToCheck:

      if toSkip:
        continue
      audioURL[3] = str(i)
      print i
      if not isAbyssal:
        lineName = kclib.voiceIdMapping[i] if i in kclib.voiceIdMapping else "UNKNOWN"
        lineName += " " 
        fileName = str(i)+u" "+lineName+data[lang].capitalize()
      else:
        # Abyssal voice lines are non-standard in that some have more lines
        # than others and their usage isn't necessarily set to the id so
        # no way to have a blanket method for naming all the lines
        lineName = ""
        fileName = str(i)+u" "+lineName+data[lang]

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
          print "File exists and not checking fileDiffs! "+" ".join([k+": "+str(v) for k,v in data.items()])+"\n===="+lineName
          logger.verboseLog("File exists and not checking fileDiffs! "+" ".join([k+": "+str(v) for k,v in data.items()])+"\n===="+lineName)


      # If we're not skipping AND the file exists, we redownload
      # OR the file just doesn't exist flatout.
      if (os.path.isfile(audioFilepath) and overwrite) or not os.path.isfile(audioFilepath):
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
          if ((i == 1) or #if not even voice #1 exists. Every ship that has lines at least hast 1.mp3
              (i > 10 and isAbyssal) or #no abyssals had lines above 10 so yeah. (Checked 1-27)
              (i > 28)): #Not having a line above 28 means no hourlies
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
  kclib.remEmptyFolders(toDownload)


inp = """
Kashima, Agano, Noshiro, Sakawa, Yahagi, Yura, Maya, Yuudachi, Asashimo
"""
toCheck = inp.strip().replace(",","").split(" ")

toDownload = os.path.join("/Users","YutoTakamoto","Desktop","Kancolle Scrape Data","temp")

scrapeShiplines(toScrape = kclib.returnAllShipNames(side="abyssals"), 
                overwrite = False,
                linesToCheck = None,
                customPath = toDownload,
                namesInEn = True)


