# -*- coding: UTF-8 -*-
# kanmusu_data_mapper.py
#
# Description: 
# Will parse through /api decoding/api_mst_ship_data.json and update 
# data/kanmusu_data_mapping.csv with csv entries following the format of
# jpname,engname,obfuscatedname,api_id,api_sortno,isAbyssal
# 
#
# INPUT: 
# Must have a api_mst_ship_data.json properly made from api_dump_parser.py
#
# Output: 
# kanmusu_data_mapping.csv will be updated accordingly to description

import sys
reload(sys)
sys.setdefaultencoding('utf8')
from kcinit import *


BASEDIR = os.path.dirname(os.path.realpath(__file__))

mapping = dict()
jsonDump = open(paths.api_mst_shipgraph_data,"r")
for line in jsonDump.readlines():
  parsed = json.loads(line)
  mapping[parsed["api_id"]] = parsed["api_filename"]


f = open(paths.kanmusu_data_mapping,"w")
csvwriter = csv.writer(f,delimiter=",")
jsonDump = open(paths.api_mst_ship_data,"r")


foreignShips = [
  "グラーフ・ツェッペリン",
  "リットリオ・イタリア",
  "ローマ",
  "リベッチオ",
  "マックス・シュルツ",
  "レーベレヒト・マース",
  "ビスマルク",
  "プリンツ・オイゲン",
]

exceptions = {
  u"U-511":"yuu",
  u"呂500":"ro",
  u"大鯨":"taigei",
  u"龍鳳":"ryuuhou",
  u"伊19":"iku",
  u"伊401":"shioi",
  u"伊168":"imuya",
  u"伊58":"goya",
  u"伊8":"hachi",
}

for line in jsonDump.readlines():
  parsed = json.loads(line)
  isAbyssal = False
  #If Verniy and kadokawa is a fucking lazyass
  #api_name is bep but api_yomi still says hibiki
  if parsed["api_name"] == u"Верный":
    romajiName = "Verniy"
  #If an abyssal
  elif parsed["api_yomi"] in ["","-","elite","flagship"]:
    romajiName = kclib.abyssalTranslations[parsed["api_name"]]
    if parsed["api_yomi"] in ["elite","flagship"]:
      romajiName+= " "+parsed["api_yomi"].capitalize()
      parsed["api_name"]+= " "+parsed["api_yomi"].capitalize()
    isAbyssal = True
  # If one of the edge-cases like ryuuhou/taigei
  # Exceptions are when api_yomi isn't standard formatted
  elif parsed["api_name"].replace(u"改","") in exceptions:
    romajiName = exceptions[parsed["api_name"].replace(u"改","")].lower()
  # If not a foreign ship
  elif parsed["api_yomi"] not in foreignShips:
    romajiName = kclib.hiraToRoma(parsed["api_yomi"]).lower()
  # If a foreign ship, we don't need to do anything (Except strip the kai)
  else:
    romajiName = parsed["api_name"]
    romajiName = romajiName.replace(u"改","").lower()

  if not isAbyssal:
    for jp,en in kclib.shipSuffix.items():
      if parsed["api_name"].find(jp)>0:
        romajiName+= " "+en
        romajiName = romajiName.lower()
        break


  romajiName.lower()
  obf = mapping[parsed["api_id"]]
  sortno = parsed["api_sortno"] if "api_sortno" in parsed else "0"
  csvwriter.writerow([parsed["api_name"],romajiName,obf,parsed["api_id"],sortno,isAbyssal])
























































