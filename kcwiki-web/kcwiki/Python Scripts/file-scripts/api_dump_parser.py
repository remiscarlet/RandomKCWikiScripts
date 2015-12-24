# -*- coding: UTF-8 -*-
import sys
reload(sys)
sys.setdefaultencoding('utf8')

from kcinit import *


BASEDIR = os.path.dirname(os.path.realpath(__file__))
jsonDumpFile = open(paths.masterdump,"r")
jsonDump = jsonDumpFile.readline() # This gun' be big


# Mostly for reference. Will Regex using just "api_mst" as
# these sections are the only areas of the json that use that.
apiSections = [
  "api_mst_ship",
  "api_mst_shipgraph",
  "api_mst_slotitem_equiptype",
  "api_mst_equip_exslot",
  "api_mst_stype",
  "api_mst_slotitem",
  "api_mst_furniture",
  "api_mst_furnituregraph",
  "api_mst_useitem",
  "api_mst_payitem",
  "api_mst_maparea",
  "api_mst_mapinfo",
  "api_mst_mapbgm",
  "api_mst_mapcell",
  "api_mst_mission",
  "api_mst_shipupgrade",
  "api_mst_bgm",
]

# First replace all api_mst_ with api_master_ so we have more breathing room
# for making our regexes not overlap
p = re.compile("api_mst_")
jsonDump = p.sub("api_master_",jsonDump)


# Will catch all but the last section.
p = re.compile("ter_(\w+?)\":\[(.+?)\]\,\"api_mas",re.DOTALL)
# Will catch last section, which is presumably going to be the bgm
p2 = re.compile("ter_(bgm)\":\[(.+?)\]\}\}")

r = p.findall(jsonDump)
r2 = p2.findall(jsonDump)


for result in r:
  f = open(os.path.join(paths.api_decoding,"api_mst_"+result[0]+"_data.json"),"w")
  data = result[1]
  reg = re.compile("\}\,\{")
  data = reg.sub("},\n{",data)
  data = re.sub(",\n","\n",data)
  f.write(data.decode("unicode-escape"))
  f.close()

for result in r2:
  f = open(os.path.join(paths.api_decoding,"api_mst_"+result[0]+"_data.json"),"w")
  data = result[1]
  reg = re.compile("\}\,\{")
  data = reg.sub("},\n{",data)
  data = re.sub(",\n","\n",data)
  f.write(data.decode("unicode-escape"))
  f.close()
