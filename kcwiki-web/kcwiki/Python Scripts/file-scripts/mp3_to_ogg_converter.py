# -*- coding: UTF-8 -*-
import sys
reload(sys)
sys.setdefaultencoding('utf8')


from kcinit import *
import subprocess
import threading


command = [u"ffmpeg",u"-i",u"INPUT",u"-c:a",u"libvorbis",u"-qscale:a",u"9",u"OUTPUT"]
__ACCEPTEDFILETYPE__ = ["mp3","ogg"]

def convert(baseDir, destDir, sourceFileName,outputFileName,fileType):
	#print fileType
	if fileType == "mp3":
		sourceFilePath = unicode(os.path.join(baseDir,sourceFileName))
		outputFilePath = unicode(os.path.join(baseDir,outputFileName))
		commandline = command
		commandline[2] = sourceFilePath
		commandline[7] = outputFilePath
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




# 
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
						t = threading.Thread(target=convert, args=(baseDir, destDir, thing, output,split[-1]))
						t.start()

_baseDir = unicode(os.path.join("/","Users","YutoTakamoto","Desktop","Kancolle Scrape Data", "temp"))
_destDir = unicode(os.path.join("/","Users","YutoTakamoto","Desktop","Kancolle Scrape Data","kancolle ogg"))


# Will encode every .mp3 recursively inside baseDir and output
# in the exact same folder structure to destDir
def encodeAndMove(baseDir,destDir):
	recurseDir(baseDir,destDir)

encodeAndMove(_baseDir,_destDir)



