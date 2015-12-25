# -*- coding: UTF-8 -*-
#
# Description: 
# Scrapes music based on several inputs described
# below by the parameters to scrapeMusic
# Reads in data from json dumps and music_id_mapping.csv
#

import sys
reload(sys)
sys.setdefaultencoding('utf8')
from kcinit import *

# toDownload: An "enum" between ["all","sortie","port"]
#             "sortie" refers to the files used while on sortie. This includes regular and boss nodes
#             "port" refers to the files used at the home port screen.
#             "all" obviously refers to downloading both.
#             One thing of note is that if you set to "all" the folder structure will be
#             |--given_music_dir
#               |--portBGM
#                 |--track 1
#                 |--track 2
#               |--sortieBGM
#                 |--non-boss
#                   |--track 1
#                   |--track 2
#                 |--boss
#                   |--track 1
#             However if you do just one of the two, then you will get
#             |--given_music_dir
#               |--non-boss
#                 |--track 1
#               |--boss
#                 |--track 1
#             In other words, if you just pick one or the other, it will change the 
#             depth of folders created by shifting one level down. 
#
# overwrite: Incase you ever want to overwrite every file to make sure they're "pure"
#  
# customPath: Full path. Specify where you want it downloaded. Default is paths.musicDic
#
def scrapeMusic(toDownload = "all", 
                overwrite = False,
                customPath = None):
  if customPath != None:
    path = customPath
  else:
    path = paths.musicDir
  if toDownload not in ["all","sortie","port"]:
    raise Exception("Arg toDownload in scrapeMusic was not valid. Choose one from \"all\", \"sortie\" or \"port\"")

  ################
  # Sortie music #
  ################
  if toDownload in ["all", "sortie"]:

    # Get folder shit out of the way
    if toDownload == "sortie":
      sortiePath = path
    else:
      sortiePath = os.path.join(path,"sortieBGM")
      if not os.path.isdir(sortiePath):
        os.mkdir(sortiePath)

    # normal map music path
    normalPath = os.path.join(sortiePath,"normal")
    if not os.path.isdir(normalPath):
      os.mkdir(normalPath)

    # boss node music path
    bossPath = os.path.join(sortiePath,"boss")
    if not os.path.isdir(bossPath):
      os.mkdir(bossPath)


    with open(paths.api_mst_mapbgm_data,"r") as f:
      url = ["http://203.104.209.102/kcs/resources/swf/sound_b_bgm_","ID",".swf"]
      for line in f.readlines():
        parsed = json.load(line)

        # Because we have two types of sortie music
        tracks = {
            "normal":parsed["api_map_bgm"][0],
            "boss":parsed["api_boss_bgm"][0]
        }
        for trackType,trackId in tracks.items():
          url[1] = trackId
          fileName = trackId+".swf"
          downloadFile = os.path.join(eval(trackType+"Path"),fileName)

          if not os.path.isdir(downloadFile) or overwrite:
            r = requests.get("".join(url))
            if "content-type" in r.headers and r.headers["content-type"] == "application/x-shockwave-flash":
              with open(downloadFile,"wb") as musicf:
                for block in r.iter_content(1024):
                  musicf.write(block)

              print "Scrape for "+downloadFile+" complete."
              logger.verboseLog("Scrape for "+downloadFile+" complete.")
              logger.log("Music:" + trackType + "-"+fileName.replace("swf","mp3")+" "+downloadFile)
          else:
            print "File did not exist on the server! "+downloadFile
            logger.verboseLog("File did not exist on the server! "+downloadFile)

  ##############
  # Port music #
  ##############
  if toDownload in ["all", "port"]:

    # Get folder shit out of the way
    if toDownload == "port":
      portPath = path
    else:
      portPath = os.path.join(path,"portBGM")
      if not os.path.isdir(portPath):
        os.mkdir(portPath)

    with open(paths.music_id_mapping,"r") as f:
      url = ["http://203.104.209.23/kcs/resources/bgm_p/","ID",".swf"]
      for line in f.readlines():
        # Putting eg 101r into "ID"
        url[1] = line.split(",")[1]
        fileName = url[1]+".swf"
        downloadFile = os.path.join(path,fileName)

        if not os.path.isdir(downloadFile) or overwrite:
          r = requests.get("".join(url))
          if "content-type" in r.headers and r.headers["content-type"] == "application/x-shockwave-flash":
            with open(downloadFile,"wb") as musicf:
              for block in r.iter_content(1024):
                musicf.write(block)

            print "Scrape for "+downloadFile+" complete."
            logger.verboseLog("Scrape for "+downloadFile+" complete.")
            logger.log("Music: Port Music - "+fileName.replace("swf","mp3")+" "+downloadFile)
        else:
          print "File did not exist on the server! "+downloadFile
          logger.verboseLog("File did not exist on the server! "+downloadFile)


scrapeMusic()















