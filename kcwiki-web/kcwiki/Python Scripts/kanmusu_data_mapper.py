# -*- coding: UTF-8 -*-
# kanmusu_data_mapper.py
#
# Description: 
# Will parse through /api decoding/api_mst_ship_data.json and update 
# data/kanmusu_data_mapping.csv with csv entries following the format of
# jpname,engname,obfuscatedname,api_id,api_sortno
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
import csv
import re
import os
import paths
import kclib
import json

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
  "ゆー511・ろ500"

]

for line in jsonDump.readlines():
  parsed = json.loads(line)

  if parsed["api_yomi"] in ["-","elite","flagship"]:
    continue
  elif parsed["api_yomi"] not in foreignShips:
    romajiName = kclib.hiraToRoma(parsed["api_yomi"])
  else:
    romajiName = parsed["api_name"]
    romajiName = romajiName.replace(u"改","")
  if parsed["api_name"].find(u"改二")>-1:
    romajiName+=" kai ni"
  elif parsed["api_name"].find(u"改")>-1:
    romajiName+=" kai"
  elif parsed["api_name"].find("zwei")>-1:
    romajiName+=" zwei"
  elif parsed["api_name"].find("drei")>-1:
    romajiName+=" drei"

  romajiName.lower()
  obf = mapping[parsed["api_id"]]
  sortno = parsed["api_sortno"] if "api_sortno" in parsed else "0"
  csvwriter.writerow([parsed["api_name"],romajiName.lower(),obf,parsed["api_id"],sortno])
























































