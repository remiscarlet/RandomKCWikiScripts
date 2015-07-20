# -*- coding: UTF-8 -*-
import sys
reload(sys)
sys.setdefaultencoding('utf8')
import requests
import re
import os
from lxml import etree
fileLoc = os.path.join("/","Users","YutoTakamoto","Dropbox","YutoProgramming","python","pagesToNuke.txt")
baseURL = "http://en.kancollewiki.net/api.php?"
searchSize = 50
searchParams = ["@comment"]
searchProps = ["timestamp","wordcount","size"]
nameSpaces = ["1","201","203"]
wordSizeLimit = 1000
totalHits = 0
reason = "Deleting clutter."
params = {
	"action":"query",
	"list":"search",
	"srsearch":"+".join(searchParams),
	"srprop":"|".join(searchProps),
	"srnamespace":"|".join(nameSpaces),
	"srlimit":str(searchSize),
	"sroffset":"0",
	"format":"xml"
}
class HitsParser(object):
	def start(self, tag, attrib):
		if (tag == "searchinfo"):
			self.totalHits = attrib["totalhits"]
	def close(self):
		pass
class Parser(object):
	def start(self, tag, attrib):
		if (tag == "p"):
			if attrib["size"].isdigit() and attrib["wordcount"].isdigit():
				if int(attrib["wordcount"])<wordSizeLimit:
					#	pass
					self.file.write(attrib["title"]+"|"+self.reason+"\n")
			#print attrib
	def close(self):
		pass
url = baseURL
for param,val in params.items():
	url+="&"+param+"="+val
request = requests.get(url)

f = open(fileLoc,"w")
hitParser = etree.XMLParser(target = HitsParser())
result = etree.XML(request.text,hitParser)
totalHits = int(hitParser.target.totalHits)

print totalHits

parser = etree.XMLParser(target = Parser())
parser.target.file = f
parser.target.reason = reason
etree.XML(request.text,parser)
totalHits = totalHits if totalHits<5000 else 5000

for offset in xrange(0,totalHits,searchSize):
	#break
	params["sroffset"] = str(offset)
	url = baseURL
	for param,val in params.items():
		url+="&"+param+"="+val
	print url
	req = requests.get(url)
	etree.XML(req.text,parser)

parser.target.file.close()




