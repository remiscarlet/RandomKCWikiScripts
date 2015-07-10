# -*- coding: UTF-8 -*-import sys
import sys
reload(sys)
sys.setdefaultencoding('utf8')
import os
import time
import re
import subprocess

# Note: This only works on Mac and only if you have "The Unarchiver" installed.
# http://wakaba.c3.cx/s/apps/unarchiver.html

#Specifically the mapping for base to mask
shipMaskMappingDict = {
	"Image 5 at frame 5.jpg"   : "Image 5 alpha channel at frame 5.png",
	"Image 6 at frame 6.jpg"   : "Image 6 alpha channel at frame 6.png",
	"Image 7 at frame 7.jpg"   : "Image 7 alpha channel at frame 7.png",
	"Image 8 at frame 8.jpg"   : "Image 8 alpha channel at frame 8.png",
	"Image 9 at frame 9.jpg"   : "Image 9 alpha channel at frame 9.png",
	"Image 10 at frame 10.jpg" : "Image 10 alpha channel at frame 10.png",
	"Image 11 at frame 11.jpg" : "Image 11 alpha channel at frame 11.png",
	"Image 12 at frame 12.jpg" : "Image 12 alpha channel at frame 12.png",
	"Image 14 at frame 14.jpg" : "Image 14 alpha channel at frame 14.png",
	"Image 15 at frame 15.jpg" : "Image 15 alpha channel at frame 15.png"
}

# Full list of files that should be present upon extraction
# Used both as a list (keys only) and a dict for renaming mapping (keys and vals)
extractedShipImageDict = {
	"Image 1 at frame 1.jpg": "1 In-Fleet Profile.jpg",
	"Image 2 at frame 2.jpg": "2 In-Fleet Profile Damaged.jpg",
	"Image 3 at frame 3.jpg": "3 Game Card.jpg",
	"Image 4 at frame 4.jpg": "4 Game Card Damaged.jpg",
	"Image 5 alpha channel at frame 5.png": None,
	"Image 5 at frame 5.jpg": "5 Game Card Alpha.png",
	"Image 6 alpha channel at frame 6.png": None,
	"Image 6 at frame 6.jpg": "6 Game Card Alpha Damaged.png",
	"Image 7 alpha channel at frame 7.png": None,
	"Image 7 at frame 7.jpg": "7 Full Profile Alpha.png",
	"Image 8 alpha channel at frame 8.png": None,
	"Image 8 at frame 8.jpg": "8 Full Profile Alpha Damaged.png",
	"Image 9 alpha channel at frame 9.png": None,
	"Image 9 at frame 9.jpg": "9 Full Profile Large Alpha.png",
	"Image 10 alpha channel at frame 10.png": None,
	"Image 10 at frame 10.jpg": "10 Full Profile Large Alpha Damaged.png",
	"Image 11 alpha channel at frame 11.png": None,
	"Image 11 at frame 11.jpg": "11 Remodel Page Alpha.png",
	"Image 12 alpha channel at frame 12.png": None,
	"Image 12 at frame 12.jpg": "12 Remodel Parge Alpha Damaged.png",
	"Image 13 at frame 13.png": "13 Library Page Text.png",
	"Image 14 alpha channel at frame 14.png": None,
	"Image 14 at frame 14.jpg": "14 Refuel Image.png",
	"Image 15 alpha channel at frame 15.png": None,
	"Image 15 at frame 15.jpg": "15 Refuel Image Damaged.png"
}

filesToRenameDict = {
	"Image 1 at frame 1.jpg": "1 In-Fleet Profile.jpg",
	"Image 2 at frame 2.jpg": "2 In-Fleet Profile Damaged.jpg",
	"Image 3 at frame 3.jpg": "3 Game Card.jpg",
	"Image 4 at frame 4.jpg": "4 Game Card Damaged.jpg"
}

baseDir = os.path.join("/Users","YutoTakamoto","Desktop","Kancolle Scrape Data","Flash")
#baseDir = os.path.join("/Users","YutoTakamoto","Desktop","KC SPRING POST-EVENT UPDATE","Flash")
def escSpace(string):
	return "\""+string+"\""

def unpackSWF(swfLoc):
	command = [u'/usr/bin/open',u'-a',u'/Applications/The Unarchiver.app', unicode(swfLoc)]
	for i in xrange(len(command)):
		item = command[i]
		item = item.strip()
		command[i] = item.replace(" ","\ ")
	print u" ".join(command)
	os.system(u" ".join(command))
	time.sleep(0.25)


def createMaskedPNG(base,mask,output):
	command = ["convert", escSpace(base), escSpace(mask), 
					  "-alpha", "Off", 
					  "-compose", "CopyOpacity", 
					  "-composite", escSpace(output)]
	for i in xrange(len(command)):
		item = command[i]
		item = item.strip()
		command[i] = item
	print u" ".join(command)

	os.system(u" ".join(command))
def unpackEverything(baseDir):
	listOfFiles = os.listdir(baseDir)
	for fileName in listOfFiles:
		prependFileName = fileName[:-16]
		exceptions = [".DS_Store"]
		if os.path.isdir(os.path.join(baseDir,fileName)):
			unpackEverything(os.path.join(baseDir,fileName))
		if os.path.isfile(os.path.join(baseDir,fileName)) and fileName not in exceptions:
			swfPath = os.path.join(baseDir,fileName)
			foldPath = os.path.join(baseDir,fileName[:-4])
			if fileName[-4:] == ".swf":
				#Check if folder already exists (possibly extracted previously)
				if os.path.isdir(foldPath):
					#os.rename(swfPath,os.path.join(foldPath,fileName))
					#Too many edge cases orz
					files = os.listdir(foldPath)
					if files == [] or files == [".DS_Store"]:
						os.rmdir(foldPath)
						unpackSWF(swfPath)
				#Otherwise just extract 
				else:
					#os.rename(swfPath,newSwfPath)
					if fileName[:-4].find(u"なし")==-1:
						unpackSWF(swfPath)
				#Go through the masking dict to create masked versions

def pngEverything(baseDir):
	isShipImages = True
	listOfFiles = os.listdir(baseDir)

	for fileName in listOfFiles:
		prependFileName = fileName[:-16]
		#files to ignore
		exceptions = [".DS_Store"]
		#print fileName
		if os.path.isdir(os.path.join(baseDir,fileName)):
			pngEverything(os.path.join(baseDir,fileName))
		if os.path.isfile(os.path.join(baseDir,fileName)) and fileName not in exceptions:
			#print fileName
			swfPath = os.path.join(baseDir,fileName)
			foldPath = os.path.join(baseDir,fileName[:-4])
			#For every image we need to apply transparancy to...
			if os.path.isdir(foldPath):
				fileList = os.listdir(foldPath)
				#print fileList
				for file in fileList:
					print foldPath
					result = re.search("Image (\d+?) at frame (\d+)",file)
					if result != None:
						print file
						imageNum = result.group(1)
						frameNum = result.group(2)
						extensions = [".png",".jpg"]
						base = "Image "+imageNum+" at frame "+frameNum
						mask = "Image "+imageNum+" alpha channel at frame "+frameNum
						for extension in extensions:
							#print base+extension
							#print mask+extension
							if base+extension in fileList:
								base+=extension
							if mask+extension in fileList:
								mask+=extension
						if mask not in fileList:
							continue
						basePath = os.path.join(foldPath,base)
						maskPath = os.path.join(foldPath,mask)
						name = ""
						if base in extractedShipImageDict and isShipImages:
							name = extractedShipImageDict[base]
						else:
							name = "UNKNOWN "+imageNum+".png"
						outputFilePath = os.path.join(foldPath,prependFileName+name)
						if not os.path.isfile(outputFilePath):
							createMaskedPNG(basePath,maskPath,outputFilePath)
			#print foldPath
			if os.path.isdir(foldPath) and isShipImages:
				for imageName in os.listdir(foldPath):
					if imageName in filesToRenameDict:
						newName = filesToRenameDict[imageName]
						if newName != None:
							originPath = os.path.join(foldPath,imageName)
							newPath = os.path.join(foldPath,prependFileName + newName)
							os.rename(originPath,newPath)



unpackEverything(baseDir)

pngEverything(baseDir)









