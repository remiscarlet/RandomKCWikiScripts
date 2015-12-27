# -*- coding: UTF-8 -*-

# Downloads all voices from the atpages page. 
#
# This script is only used for pulling old abyssal voices
# (because many are not on the servers anymore)

import sys
reload(sys)
sys.setdefaultencoding('utf8')
import os
import re
import cfscrape
from kcinit import *

scraper = cfscrape.create_scraper()
scraper2 = cfscrape.create_scraper()

baseURL = "http://www51.atpages.jp/kancollev/kcvdownload.php?kcvd=kc"

shipIdList = [i+1 for i in xrange(539,600)]+[i+1 for i in xrange(9566,9647)]
voiceIdList = [i+1 for i in xrange(12)]

baseDir = os.path.join("/","Users","YutoTakamoto","Desktop","KC Voices")
if not os.path.isdir(baseDir):
	os.mkdir(baseDir)
title = None

mapping = kclib.returnFullAssocShipIdentDict()

for shipId in shipIdList:
	pageUrl = "http://www51.atpages.jp/kancollev/kcplayer.php?f=0&c="+str(shipId)+"v1"
	response = scraper2.get(pageUrl)
	response.encoding = "EUC-JP"
	pageResponse = response.text
	title = re.search(r'<title>.*</title>',pageResponse).group()[14:-10]
	title = title.replace("???",str(shipId))
	print pageUrl
	print title
	name = title.split(" ")[1]
	if name == "----":
		continue
	enName = mapping[name.encode("utf-8")]["en"]
	shipNum = str(shipId)
	title = "No."+str(shipId)+" "+enName
	folder = os.path.join(baseDir,title)
	if not os.path.isdir(folder):
		os.mkdir(folder)
	if shipNum != "0":
		for voiceId in voiceIdList:
			fileName = title+" - "+str(voiceId)+".mp3"
			if not os.path.isfile(folder+"/"+fileName):
				try:
					url = baseURL+str(shipId)+"v"+str(voiceId)+".mp3vd"
					voiceResponse = scraper.get(url, stream=True)
					if "content-type" in voiceResponse.headers and voiceResponse.headers["content-type"] == "audio/mpeg":
						with open(folder+"/"+fileName,"wb") as f:
							for block in voiceResponse.iter_content(1024):
								f.write(block)
							f.close()
						print "Scrape for "+fileName+" complete."
					else:
						print "Invalid content-type, likely a file that doesn't exist!"
				except:
					print "Failed on shipId: "+str(shipId)+" for voiceId: "+str(voiceId)
			else: 
				print fileName+" already exists!"
	else:
		print "Invalid url! "+pageUrl
