# -*- coding: UTF-8 -*-
import sys
reload(sys)
sys.setdefaultencoding('utf8')

import subprocess
import sys
import os
import threading
import paths
import kclib


command = [u"ffmpeg",u"-i",u"INPUT", u"-ac", u"1", u"-ar",u"16000", u"OUTPUT", u"-y", ]
command = [u"ffmpeg",u"-i",u"INPUT",u"-c:a",u"libvorbis",u"-qscale:a",u"9",u"OUTPUT"]
baseDir = unicode(os.path.join("/","Users","YutoTakamoto","Desktop","Kancolle Scrape Data", "temp"))
#baseDir = unicode(os.path.join("/","Users","YutoTakamoto","Documents","Captions", "core", "en-US","iOS Adjustment Audio","Cleaned Audio"))
destDir = unicode(os.path.join("/","Users","YutoTakamoto","Desktop","Kancolle Scrape Data","kancolle ogg"))
__ACCEPTEDFILETYPE__ = ["mp3","ogg"]
__RENAME_TO_WIKI_FORMAT = True

attrDict = kclib.returnFullAssocShipIdentDict()

def convert(directory,source,output,fileType):
	#print fileType
	if fileType == "mp3":
		source = unicode(os.path.join(directory,source))
		output = unicode(os.path.join(directory,output))
		commandline = command
		commandline[2] = source
		commandline[7] = output
		#commandline[3] = output
		for i in xrange(len(commandline)):
			item = commandline[i]
			item = item.strip()
			commandline[i] = item.replace(" ","\ ")
		#print commandline

		subprocess.Popen(u" ".join(commandline), shell=True)

def moveFile(fileName,srcDir,fileType):
	global __RENAME_TO_WIKI_FORMAT
	print fileType
	if fileType == "ogg":
		source = unicode(os.path.join(srcDir,fileName))
		folder = source.split("/")[-2]
		folder = unicode(os.path.join(destDir,folder))
		if __RENAME_TO_WIKI_FORMAT:
			name = " ".join(fileName.split(".")[:-1])
			name = name.strip().split(" ")[-1]
			name = name.split(".")[0]
			kai_strip = name.split(u"改")[0].encode("utf-8")
			if kai_strip in attrDict:
				english = attrDict[kai_strip][1].capitalize()
				kai_strip = kai_strip.decode("utf-8")
				name = name.decode("utf-8")
				hasKai = True if name.find(u"改")>-1 else False
				hasKaiNi = True if name.find(u"改二")>-1 else False
				name = english
				if hasKaiNi: name += "KaiNi"
				elif hasKai: name += "Kai"
			else:
				print u"Name not found! - "+kai_strip
			newFileName = name
			newFileName += u"-"
			temp = " ".join(fileName.split(".")[:-1])
			newFileName += u"_".join(temp.strip().split(" ")[1:-1]) #removes number and name.ogg portion of filename
			newFileName += u".ogg"
			fileName = newFileName
		dest = unicode(os.path.join(folder,fileName))
		if not os.path.isdir(folder):
			os.mkdir(folder)
		print source, dest
		os.rename(source,dest)


def recurseDir(directory=baseDir):
	for thing in os.listdir(directory):
		if thing != ".DS_Store":
			thing = unicode(thing)
			direct = unicode(os.path.join(directory,thing))
			if os.path.isdir(direct):
				recurseDir(direct)
			else:
				fileType = __ACCEPTEDFILETYPE__
				split = thing.split(".")
				if len(split)>1:
					fileNameBase = split[:-1]
					#fileNameBase.append(u".wav")
					fileNameBase.append(u".ogg")
					output = u"".join(fileNameBase)
					if split[-1] in fileType:
						# UNCOMMENT THESE IN ORDER AND RUN THEM ONE AT A TIME
						#t = threading.Thread(target=convert, args=(directory, thing, output,split[-1]))
						t = threading.Thread(target=moveFile, args=(thing,directory,split[-1]))
						t.start()
						pass
		
recurseDir()