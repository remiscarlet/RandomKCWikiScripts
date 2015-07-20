# -*- coding: UTF-8 -*-
import sys
reload(sys)
sys.setdefaultencoding('utf8')
import os
import re
import cfscrape

scraper = cfscrape.create_scraper()
scraper2 = cfscrape.create_scraper()

baseURL = "http://www51.atpages.jp/kancollev/kcvdownload.php?kcvd=kc"

shipIdList = [i+1 for i in range(1000)]
voiceIdList = [i+1 for i in range(53)]

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

baseDir = os.path.join("/","Users","YutoTakamoto","Desktop","KC Voices")
title = None

for shipId in shipIdList:
	pageUrl = "http://www51.atpages.jp/kancollev/kcplayer.php?f=0&c="+str(shipId)+"v1"
	response = scraper2.get(pageUrl)
	response.encoding = "EUC-JP"
	pageResponse = response.text
	title = re.search(r'<title>.*</title>',pageResponse).group()[14:-10]
	shipNum = re.search(r'\d+',title.split(".")[1]).group(0)
	folder = os.path.join(baseDir,title)
	if not os.path.isdir(folder):
		os.mkdir(folder)
	if shipNum != "0":
		for voiceId in voiceIdList:
			fileName = title+"- "+str(voiceId)+" "+voiceIdMapping[voiceId]+".mp3"
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
