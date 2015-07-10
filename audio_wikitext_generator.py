# -*- coding: UTF-8 -*-
import sys
reload(sys)
sys.setdefaultencoding('utf8')
import os
import string


attrDict = dict()
with open("kanmusu_jp-en_mapping.txt","r") as attrMapping:
	for line in attrMapping.readlines():
		split = line.split(",")
		thing = list()
		for attr in split:
		  thing.append(attr.decode("utf8"))
		for attr in thing:
			attrDict[attr.decode("utf8")] = thing

####
#### NOTE: THIS ASSUMES YOU HAVE THE SAME FOLDER STRUCTURE AS WHAT MY SCRIPTS OUTPUT
####

directory = unicode(os.path.join("/","Path", "To", "Directory", "With", "Folders", "Of", "Voices"))

# Throw in folder name you want to generate the wikitext for. Eg, if I want to generate the
# wikitext for Kiyoshimo's lines, I get the folder name where all of Kiyoshimo's lines are and
# Put it here
folderName = u"""
322 時津風改 - svglgiwjfyxn"""



folderName = folderName.strip()
shipName = " ".join(folderName.split(" ")[1:-2])
engName = attrDict[shipName][1]
split = engName.split(" ")
if engName.find("kai ni")>-1:
	split[-2] = "Kai"
	split[-1] = "Ni"
elif engName.find("kai")>-1:
	split[-1] = "Kai"
engName = "".join([string.capitalize(s) for s in split])
print engName
dirName = os.path.join(directory,folderName)
clipMap = {
	"Attack.ogg" : "Clip16",
	"Battle_Start.ogg" : "Clip15",
	"Equipment_1.ogg" : "Clip7",
	"Equipment_2.ogg" : "Clip8",
	"Equipment_3.ogg" : "Clip9",
	"Intro.ogg" : "Clip1",
	"Joining_A_Fleet.ogg" : "Clip6",
	"Library_Intro.ogg" : "Clip0",
	"Minor_Damage_1.ogg" : "Clip20",
	"Minor_Damage_2.ogg" : "Clip21",
	"Moderately_Damaged.ogg" : "Clip22",
	"MVP.ogg" : "Clip19",
	"Night_Attack.ogg" : "Clip18",
	"Night_Battle.ogg" : "Clip17",
	"Player_Score.ogg" : "Clip5",
	"Repair_Light_Damage.ogg" : "Clip10",
	"Repair_Medium_Damage.ogg" : "Clip11",
	"Return_From_Sortie.ogg" : "Clip13",
	"Secretary_1.ogg" : "Clip2",
	"Secretary_2.ogg" : "Clip3",
	"Secretary_3.ogg" : "Clip4",
	"Secretary_Idle.ogg" : "Clip4a",
	"Secretary_Married.ogg" : "Clip25",
	"Ship_Construction.ogg" : "Clip12",
	"Start_Sortie.ogg" : "Clip14",
	"Sunk.ogg" : "Clip23",
	"Supply.ogg" : "Clip24",
	"Wedding.ogg" : "Clip26",
}

hourlyMap = {
	"Hourly_0000.ogg" : "Clip00",
	"Hourly_0100.ogg" : "Clip01",
	"Hourly_0200.ogg" : "Clip02",
	"Hourly_0300.ogg" : "Clip03",
	"Hourly_0400.ogg" : "Clip04",
	"Hourly_0500.ogg" : "Clip05",
	"Hourly_0600.ogg" : "Clip06",
	"Hourly_0700.ogg" : "Clip07",
	"Hourly_0800.ogg" : "Clip08",
	"Hourly_0900.ogg" : "Clip09",
	"Hourly_1000.ogg" : "Clip10",
	"Hourly_1100.ogg" : "Clip11",
	"Hourly_1200.ogg" : "Clip12",
	"Hourly_1300.ogg" : "Clip13",
	"Hourly_1400.ogg" : "Clip14",
	"Hourly_1500.ogg" : "Clip15",
	"Hourly_1600.ogg" : "Clip16",
	"Hourly_1700.ogg" : "Clip17",
	"Hourly_1800.ogg" : "Clip18",
	"Hourly_1900.ogg" : "Clip19",
	"Hourly_2000.ogg" : "Clip20",
	"Hourly_2100.ogg" : "Clip21",
	"Hourly_2200.ogg" : "Clip22",
	"Hourly_2300.ogg" : "Clip23",

}

for file in os.listdir(dirName):
	if file != ".DS_Store":
		#print "\""+"-".join(file.split("-")[1:])+"\" : \"\","
		for filePart,clip in clipMap.items():
			#print engName+"-"+filePart
			if file.find(engName+"-"+filePart)>-1:
				print "|"+clip+" = {{Audio|file="+file+"}}"
				break

print "####"

for file in os.listdir(dirName):
	if file != ".DS_Store":
		#print "\""+"-".join(file.split("-")[1:])+"\" : \"\","
		for filePart,clip in hourlyMap.items():
			if file.find(engName+"-"+filePart)>-1:
				print "|"+clip+" = {{Audio|file="+file+"}}"
				break