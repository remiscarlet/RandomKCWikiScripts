import os

BASEDIR = os.path.dirname(os.path.realpath(__file__))
BASEDIR = os.path.join(BASEDIR,"..","..","..")

# Modify this to point to where you want scrape data to be dumped.
fileDir = os.path.join("/Users","YutoTakamoto","Desktop","Kancolle Scrape Data")
if not os.path.isdir(fileDir):
  os.mkdir(fileDir)
swfDir = os.path.join(fileDir,"Flash")
if not os.path.isdir(swfDir):
  os.mkdir(swfDir)
soundDir = os.path.join(fileDir,"Sounds")
if not os.path.isdir(soundDir):
  os.mkdir(soundDir)
equipmentDir = os.path.join(fileDir,"Equipment")
if not os.path.isdir(equipmentDir):
  os.mkdir(equipmentDir)


api_decoding = os.path.join(BASEDIR,"api decoding")
api_mst_bgm_data = os.path.join(api_decoding,"api_mst_bgm_data.json")
api_mst_equip_exslot_data = os.path.join(api_decoding,"api_mst_equip_exslot_data.json")
api_mst_furniture_data = os.path.join(api_decoding,"api_mst_furniture_data.json")
api_mst_furnituregraph_data = os.path.join(api_decoding,"api_mst_furnituregraph_data.json")
api_mst_maparea_data = os.path.join(api_decoding,"api_mst_maparea_data.json")
api_mst_mapbgm_data = os.path.join(api_decoding,"api_mst_mapbgm_data.json")
api_mst_mapcell_data = os.path.join(api_decoding,"api_mst_mapcell_data.json")
api_mst_mapinfo_data = os.path.join(api_decoding,"api_mst_mapinfo_data.json")
api_mst_mission_data = os.path.join(api_decoding,"api_mst_mission_data.json")
api_mst_payitem_data = os.path.join(api_decoding,"api_mst_payitem_data.json")
api_mst_ship_data = os.path.join(api_decoding,"api_mst_ship_data.json")
api_mst_shipgraph_data = os.path.join(api_decoding,"api_mst_shipgraph_data.json")
api_mst_shipupgrade_data = os.path.join(api_decoding,"api_mst_shipupgrade_data.json")
api_mst_slotitem_data = os.path.join(api_decoding,"api_mst_slotitem_data.json")
api_mst_slotitem_equiptype_data = os.path.join(api_decoding,"api_mst_slotitem_equiptype_data.json")
api_mst_stype_data = os.path.join(api_decoding,"api_mst_stype_data.json")
api_mst_useitem_data = os.path.join(api_decoding,"api_mst_useitem_data.json")



pythonscripts = os.path.join(BASEDIR,"kcwiki-web","kcwiki","Python Scripts")
pythondata = os.path.join(pythonscripts,"data")
masterdump = os.path.join(pythondata,"dump.json")
kanmusu_data_mapping = os.path.join(pythondata,"kanmusu_data_mapping.csv")
kanmusu_obfuscated_namelist = os.path.join(pythondata,"kanmusu_obfuscated_namelist.csv")
music_id_mapping = os.path.join(pythondata,"music_id_mapping.csv")
logDir = os.path.join(pythondata,"Scrape Logs")
