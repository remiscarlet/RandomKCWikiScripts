# -*- coding: UTF-8 -*-

# Will download furniture from the servers.

import sys
reload(sys)
sys.setdefaultencoding('utf8')

from kcinit import *


fileDir = os.path.join("/Users","YutoTakamoto","Desktop","Kancolle Scrape Data")

def scrape(fileDir):
  furnitureDir = os.path.join(fileDir,"Furniture")
  if not os.path.isdir(furnitureDir):
    os.mkdir(furnitureDir)

  funitureURLDict = {
    "Desk":"http://125.6.187.253/kcs/resources/image/furniture/desk/",
    "Chest":"http://125.6.187.253/kcs/resources/image/furniture/chest/",
    "Object":"http://125.6.187.253/kcs/resources/image/furniture/object/",
    "Window":"http://125.6.187.253/kcs/resources/image/furniture/window/",
    "Floor":"http://125.6.187.253/kcs/resources/image/furniture/floor/",
    "Wall":"http://125.6.187.253/kcs/resources/image/furniture/wall/"
  }


  noNewFurniture = True
  logger.log("NEW FURNITURES: ")
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
                logger.verboseLog(url)
                print fileDir
                logger.verboseLog(fileDir)
                print "File \""+fileName+"\" completed downloading."
                logger.verboseLog("File \""+fileName+"\" completed downloading.")
                NEW_FURNITURE_FOLDERS_AND_FILES.append(fileDir)
                logger.log(fileDir)
                noNewFurniture = False

              else:
                print "File \""+fileName+"\" doesn't exist!"
                logger.verboseLog("File \""+fileName+"\" doesn't exist!")

          else:
            if i < 5 or i >28:
              toSkip = True
            print "File \""+fileName+"\" doesn't exist on the server!"
            logger.verboseLog("File \""+fileName+"\" doesn't exist on the server!")

        else:
          existingName = fileName if existingName == "" else existingName
          print "File \""+existingName+"\" already exists!"
          logger.verboseLog("File \""+existingName+"\" already exists!")

  print "Ding! Furniture grabbing done."
  logger.verboseLog("Ding! Furniture grabbing done.")
  if noNewFurniture:
    logger.log("= No new furnitures downloaded!")
  logger.log("\n")

scrape(fileDir)