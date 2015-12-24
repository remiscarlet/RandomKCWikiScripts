



def scrapeEquipment(dest):
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