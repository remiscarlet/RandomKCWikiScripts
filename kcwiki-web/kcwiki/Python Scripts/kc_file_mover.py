# -*- coding: UTF-8 -*-import sys
import sys
reload(sys)
sys.setdefaultencoding('utf8')
import os
import shutil
import copy

def copyDirectory(src,dest):
	try:
		shutil.copytree(src,dest)
	except shutil.Error as e:
		print "Failed: %s"%e
	except OSError as e:
		print "failed: %s"%e

listString = u"睦月　如月　吹雪　白雪　深雪　磯波　綾波　敷浪　黒潮　雪風　扶桑　山城　皐月　望月　初雪　叢雲　時雨　村雨　夕立　五月雨　涼風　島風　天龍　龍田　川内　神通　那珂　妙高　鳥海　利根　筑摩　祥鳳　金剛　長門　陸奥　赤城　加賀　多摩　木曾　翔鶴　瑞鶴　鬼怒　阿武隈　弥生　卯月　明石　時津風　高波　Littorio　Roma　秋津洲"
listString = u"村雨　白雪　叢雲　五月雨　時雨　敷浪"
listString = u"敷波"
listString = u"高波"
listString = u"Italia"
listString = u"阿賀野"
listString = u"睦月　敷波　山城　村雨　川内　筑摩　加賀　木曾　時雨改二　弥生　綾波改二　綾波改　島風　村雨　望月　赤城　阿武隈　山城　如月　曙　皐月　夕立　神通　最上　日向　翔鶴　卯月　吹雪　由良　朧　妙高　叢雲　潮　五月雨　那珂　詳報　瑞鶴　Верный　明石　白雪　金剛　鳥海　白雪　黒潮　初雪　涼風　時津風　天龍　利根　扶桑　深雪　雪風　長門　細波　鬼怒　龍田　呂500　磯波　白露　陸奥　球磨　阿武隈　"
listString = u"夕立　時雨　天龍　Littorio　Italia　阿武隈　明石" #Ooi Choukai Maikaze Suzuya Samidare
listString = u"曙　綾波　吹雪　初風　陽炎　如月　黒潮　舞風　村雨　睦月　朧　五月雨　細波　時雨　敷波　島風　不知火　白露　涼風　高波　時津風　潮　夕立　阿武隈　陣痛　鬼怒　木曾　球磨　多摩　天龍　由良　夕張　羽黒　加古　熊野　麻耶　妙高　鈴谷　金剛　Littorio　Roma　龍驤　呂500　秋津洲"
actualList = listString.split(u"　")
originDir = os.path.join("/Users","YutoTakamoto","Desktop","Kancolle Scrape Data")
newDir = os.path.join("/Users","YutoTakamoto","Desktop","Kancolle 7.17.15 Update")
if not os.path.isdir(newDir):
	os.mkdir(newDir)
if not os.path.isdir(os.path.join(newDir,"Flash")):
	os.mkdir(os.path.join(newDir,"Flash"))
if not os.path.isdir(os.path.join(newDir,"Sounds")):
	os.mkdir(os.path.join(newDir,"Sounds"))
#print actualList
for dirThing in ["Sounds"]:
	copyList = copy.copy(actualList)
	for objName in os.listdir(os.path.join(originDir,dirThing)):
		for name in copyList:
			fromDir = os.path.join(originDir,dirThing,objName)
			#print objName.find(name)
			#print objName.find(name)>-1
			if objName.find(name)>-1 and name != "":
				print objName+u" : "+name
				toDir = os.path.join(newDir,objName)
				if not os.path.isdir(toDir) and toDir.find(".")==-1:
					os.mkdir(toDir)
				toDir = os.path.join(newDir,dirThing,objName)
				if os.path.isdir(fromDir):
					copyDirectory(fromDir,toDir)
				elif os.path.isfile(fromDir):
					shutil.copyfile(fromDir,toDir)


















