# -*- coding: UTF-8 -*-
import sys
reload(sys)
sys.setdefaultencoding('utf8')


from kcinit import *
import subprocess
import threading


command = [u"ffmpeg",u"-i",u"INPUT", u"-ac", u"1", u"-ar",u"16000", u"OUTPUT", u"-y", ]
command = [u"ffmpeg",u"-i",u"INPUT",u"-c:a",u"libvorbis",u"-qscale:a",u"9",u"OUTPUT"]
__ACCEPTEDFILETYPE__ = ["mp3","ogg"]

attrDict = kclib.returnFullAssocShipIdentDict()

def convert(baseDir,sourceFileName,outputFileName,fileType):
	#print fileType
	if fileType == "mp3":
		sourceFileName = unicode(os.path.join(baseDir,sourceFileName))
		outputFileName = unicode(os.path.join(baseDir,outputFileName))
		commandline = command
		commandline[2] = sourceFileName
		commandline[7] = outputFileName
		for i in xrange(len(commandline)):
			item = commandline[i]
			item = item.strip()
			commandline[i] = item.replace(" ","\ ")
		p = subprocess.Popen(u" ".join(commandline), shell=True)
		p.wait()
		moveFile(sourceFileName,baseDir,destDir)

def moveFile(fileName,srcDir,destDir):
	fileName = fileName.replace("mp3","ogg")
	source = unicode(os.path.join(srcDir,fileName))
	folder = source.split("/")[-2]
	folder = unicode(os.path.join(destDir,folder))
	dest = unicode(os.path.join(folder,fileName))
	if not os.path.isdir(folder):
		os.mkdir(folder)
	print source, dest
	os.rename(source,dest)



def recurseDir(baseDir,destDir):
	for thing in os.listdir(baseDir):
		if thing != ".DS_Store":
			thing = unicode(thing)
			direct = unicode(os.path.join(baseDir,thing))
			if os.path.isdir(direct):
				recurseDir(direct,destDir)
			else:
				fileType = __ACCEPTEDFILETYPE__
				split = thing.split(".")
				if len(split)>1:
					fileNameBase = split[:-1]
					#fileNameBase.append(u".wav")
					fileNameBase.append(u".ogg")
					output = u"".join(fileNameBase)
					if split[-1] in fileType:
						t = threading.Thread(target=convert, args=(baseDir, thing, output,split[-1]))
						t.start()

baseDir = unicode(os.path.join("/","Users","YutoTakamoto","Desktop","Kancolle Scrape Data", "temp"))
destDir = unicode(os.path.join("/","Users","YutoTakamoto","Desktop","Kancolle Scrape Data","kancolle ogg"))

recurseDir(baseDir,destDir)

