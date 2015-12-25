# -*- coding: UTF-8 -*-
#
# Description: 
# Scrapes shiplines based on several inputs described
# below by the parameters to scrapeShiplines
# Reads in data such as obfuscated names from json file
# Only scrapes kanmusu lines as abyssals and specials (arpeggio)
# have different naming methods/styles/exceptions
#

import sys
reload(sys)
sys.setdefaultencoding('utf8')
from kcinit import *
import threading

workerPool = threading.Semaphore(20)

mapping = kclib.returnFullAssocShipIdentDict()

# toScrape: A list of names to scrape. Can be a list of 
#           jp names, en names, api_id's or obfuscated names.
# linesToCheck: A list of voice id's to download.
# overwrite: A boolean on whether to overwrite even if file exists.
#            Will only write to disk if the filesize is different.
# customPath: Full path. Specify where you want it downloaded. Default is paths.soundDir
# namesInEn: Boolean. Whether to download the files with the names in english or japanese. 
def scrapeAbyssalLines(linesToCheck=None, 
                       overwrite=False,
                       customPath=None):
  
  audioURL = ["http://125.6.187.253/kcs/sound/kc","OBFNAME","/","AUDIONAME",".mp3"]

  dictOfObfIds = kclib.returnDictOfAllObfIds()
  obfToNameMapping = kclib.unusedSoundObfIdMapping

  baseDir = paths.abyssalSoundDir

  for obfId,apiId in dictOfObfIds.items():
    apiId = str(apiId)
    if obfId not in mapping:
      swfURL[1] = obfId


      name = obfToNameMapping[obfId] if obfId in obfToNameMapping else "UNKNOWN"
      if name == "":
        name = "UNKNOWN"
      if name == "NULL":
        continue

      toSkip = False
      shipFolder = os.path.join(baseDir,apiId+" "+name+ " - "+obfId)

      if not os.path.isdir(shipFolder):
        os.mkdir(shipFolder)

      # Loop through 1 to 15 to look for all potential ship voice lines
      if linesToCheck == None:
        linesToCheck = xrange(1,15)
      for i in linesToCheck:
        if toSkip:
          continue
        audioURL[3] = str(i)
        lineName = ""
        fileName = str(i)+u" "+lineName+data[lang]

        audioFilepath = os.path.join(shipFolder,fileName+".mp3")
        


        def getAudio(audioFilepath, audioURL,overwrite):
          global workerPool
          workerPool.acquire()
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
              logger.log("ENEMY LINE:-"+fileName)
            else:
              print "++++++++"+str("".join(audioURL))
              logger.verboseLog("++++++++"+str("".join(audioURL)))
              print audioURL
              logger.verboseLog(audioURL)
              print voiceResponse.headers
              logger.verboseLog(voiceResponse.headers)
              print voiceResponse
              logger.verboseLog(voiceResponse)
              if (i == 1): #since every populated id has a 1.mp3, yeah. 
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
          workerPool.release()
        ###########################
        # helper function def end #
        ###########################


        t = threading.Thread(target=getAudio, args=(audioFilepath, audioURL,overwrite))
        while threading.active_count() >20:
          pass
        t.start()






inp = """
Kashima, Agano, Noshiro, Sakawa, Yahagi, Yura, Maya, Yuudachi, Asashimo
"""
toCheck = inp.strip().replace(",","").split(" ")

#toDownload = os.path.join("/Users","YutoTakamoto","Desktop","Kancolle Scrape Data","temp")

scrapeAbyssalLines(toScrape = None, 
                overwrite = False,
                linesToCheck = None,
                namesInEn = True)


