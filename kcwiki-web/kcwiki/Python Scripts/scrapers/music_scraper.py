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
import time

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
# humanReadable: Decides naming scheme on portBGM tracks. Does not affect sortieBGM
#                Read funcDoc on extractAndRename for more details
#
def scrapeMusic(toDownload = "all", 
                overwrite = False,
                customPath = None,
                humanReadable = False,
                humanReadableEn = True):
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


    with open(paths.api_mst_mapbgm_data,"r") as f:
      url = ["http://203.104.209.102/kcs/resources/swf/sound_b_bgm_","ID",".swf"]
      # for line in f.readlines():
      #   parsed = json.loads(line)

      #   # Because we have two types of sortie music
      #   tracks = {
      #       "normal":parsed["api_map_bgm"][0],
      #       "boss":parsed["api_boss_bgm"][0]
      #   }
      #   #for trackType,trackId in tracks.items():
      for trackId in xrange(1,65):
        url[1] = str(trackId)
        fileName = str(trackId)+".swf"
        downloadFile = os.path.join(sortiePath,fileName)
        print downloadFile
        if (not os.path.isfile(downloadFile) and not os.path.isfile(downloadFile.replace("swf","mp3"))) or overwrite:
          r = requests.get("".join(url))
          if "content-type" in r.headers and r.headers["content-type"] == "application/x-shockwave-flash":
            with open(downloadFile,"wb") as musicf:
              for block in r.iter_content(1024):
                musicf.write(block)

            print "Scrape for "+downloadFile+" complete."
            logger.verboseLog("Scrape for "+downloadFile+" complete.")
            logger.log("Music:" +fileName.replace("swf","mp3")+" "+downloadFile)
          else:
            print "File did not exist on the server! "+downloadFile
            logger.verboseLog("File did not exist on the server! "+downloadFile)
        else:
          print "The file already exists! "+downloadFile
          logger.verboseLog("The file already exists! "+downloadFile)

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
        url[1] = line.split(",")[1].strip()
        fileName = url[1]+".swf"
        downloadFile = os.path.join(portPath,fileName)

        if (not os.path.isfile(downloadFile) and not os.path.isfile(downloadFile.replace("swf","mp3"))) or overwrite:
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
        else:
          print "The file already exists! "+downloadFile
          logger.verboseLog("The file already exists! "+downloadFile)
  extractAndRename(path,humanReadable,humanReadableEn)

# Will simply un-SWF a file.
def unpackSWF(swfLoc):

  command = [u'/usr/bin/open',u'-a',u"'/Applications/The Unarchiver.app'", "'"+unicode(swfLoc)+"'"]
  for i in xrange(len(command)):
    item = command[i]
    item = item.strip()
  os.system(u" ".join(command))
  time.wait(0.25)

# Will extract the mp3 from the swf and rename
# There are two renaming schemes
# humanReadable:
#     Only applies to portBGM. Will add the title to the filename
#     so it appears as "<ID> - <Title>.mp3"
# !humanReadable:
#     Will only have the id in the filename.
#     "<ID>.mp3"
def extractAndRename(path,humanReadable=False,humanReadableEn=True):
  mapping = kclib.returnPortBGMMapping()
  for file in os.listdir(path):
    filePath = os.path.join(path,file)
    if os.path.isdir(filePath):
      extractAndRename(filePath,humanReadable)

    elif os.path.splitext(file)[1] == ".swf":
      unpackSWF(filePath)

      # wait until swf is extracted and file is made
      mp3FileLoc = os.path.join(path,"Sound 1 at frame 0.mp3")
      while(not os.path.isfile(mp3FileLoc)):
        pass
      #print file
      songId = os.path.splitext(file)[0]
      if not songId.isdigit():
        songId = songId[:-1]
      songId = int(songId)
      # If we need to do humanReadable, also check
      # that we're in the port BGM directory and
      # that the id we're looking at exists in the mapping.
      # There are some "hidden" songs like 103 and 104 too so. Yeah.
      if (humanReadable and 
          os.path.split(path)[1] == "portBGM" and
          songId in mapping):
        humanForm = mapping[songId]
        if humanReadableEn:
          humanForm = kclib.portSongJpToEn[humanForm]
        renamedFileName = humanForm+".mp3"
      else:
        renamedFileName = os.path.splitext(file)[0]+".mp3"
      renamedFileLoc = os.path.join(path,renamedFileName)
      print mp3FileLoc,renamedFileLoc
      shutil.move(mp3FileLoc,renamedFileLoc)

#scrapeMusic(humanReadable=True)


extractAndRename("/Users/YutoTakamoto/Desktop/Kancolle Scrape Data/Music/sortieBGM/")










