import os
import collections

posDict = {
	0: "No.",
	1: "Rarity",
	2: "ShipName",
	3: "World1-1",
	4: "World1-2",
	5: "World1-3",
	6: "World1-4",
	7: "World1-5",
	8: "World2-1",
	9: "World2-2",
	10:"World2-3",
	11:"World2-4",
	12:"World2-5",
	13:"World3-1",
	14:"World3-2",
	15:"World3-3",
	16:"World3-4",
	17:"World3-5",
	18:"World4-1",
	19:"World4-2",
	20:"World4-3",
	21:"World4-4",
	22:"Doesn't Exist1",
	23:"World5-1",
	24:"World5-2",
	25:"World5-3",
	26:"World5-4",
	27:"World5-5",
	28:"World6-1",
	29:"World6-2",
	30:"Doesn't Exist2",
	31:"Doesn't Exist3",
	32:"Remarks"
}

#writeFile should be a file object
#Taking in both dict of vals and pos because order matters and too lazy to use orderedDict
def writeDictToFile(writeFile,valDict):
	print valDict
	if valDict == {}: return None
	valDict["ShipName"] = valDict["ShipName"][2:-2]
	shipName = valDict["ShipName"]
	rarity = valDict["Rarity"]
	num = valDict["No."]
	remarks = valDict["Remarks"]

	f = writeFile
	f.write("\tdropList[\""+shipName+"\"] = {\n")
	f.write("\t\t[\"ShipName\"] = \""+shipName+"\",\n")
	f.write("\t\t[\"Rarity\"] = \""+rarity.split("|")[1]+"\",\n")
	f.write("\t\t[\"No.\"] = \""+num+"\",\n")
	f.write("\t\t[\"Remarks\"] = \""+remarks+"\",\n")
	f.write("\t\t[\"World1\"] = {\n")
	world = "World1"
	for key,val in valDict.items():
		if key.find("World")>-1:
			if key.find(world)==-1:
				world = key[:6]
				f.write("\t\t},\n")
				f.write("\t\t[\""+world+"\"] = {\n")
			#if on same world
			if key.find(world)>-1:
				# As in which map on the world. 
				# Gets last char which should be a num. Eg, World1-1, World4-2
				mapNum = key[-1]
				vals = val.split("|")
				f.write("\t\t\t[\""+mapNum+"\"] = {")
				if len(vals) == 2:
					f.write("\t[\"drop\"] = \""+ vals[1]+"\",")
					f.write("\t[\"style\"] = \""+ vals[0][6:]+"\"},\n")
				else:
					f.write("\t[\"drop\"] = \""+vals[0]+"\",")
					f.write("\t[\"style\"] = \"\"},\n")
			if key == "World6-2":
				f.write("\t\t}\n")
				f.write("\t}\n")
			if key == "World1-5":
				f.write("\t\t\t[\"6\"] = {")
				f.write("\t[\"drop\"] = \"\",")
				f.write("\t[\"style\"] = \"\"}\n")


readPath = os.path.join(os.path.curdir,"..","lua","kcwiki-droplist-mw.txt")
writePath = os.path.join(os.path.curdir,"..","lua","kcwiki-droplist-mw-converted.txt")
with open(readPath, "r") as read:
	with open(writePath,"w") as write:
		shipName = "UNDEFINED"
		pos = 0
		valDict = collections.OrderedDict()
		for line in read.readlines():
			# Skips if it's a header line (First char will be a !)
			if line[0] == "!": continue
			#Resets data if columnbreak
			if line[:2] == "|-":
				writeDictToFile(write,valDict)
				pos = 0
				valDict = collections.OrderedDict()
				continue
			# Get the last element delimited by a pipe.
			# Eg, "| style="background-color: #7df83a;" |X" returns "X"
			split = line.split("|")
			if len(split)>1:
				val = "|".join(split[1:]).replace("\"","")
			nameOfCol = posDict[pos]
			valDict[nameOfCol] = val.strip()
			pos+=1

