import os

BASEDIR = os.path.dirname(os.path.realpath(__file__))
BASEDIR = os.path.abspath(os.path.join(BASEDIR,"..","..","..",".."))


# Modify this to point to where you want scrape data to be dumped.
scrapeDir = os.path.join("/Users","YutoTakamoto","Desktop","Kancolle Scrape Data")

if not os.path.isdir(scrapeDir):
  os.mkdir(scrapeDir)
swfDir = os.path.join(scrapeDir,"Flash")
if not os.path.isdir(swfDir):
  os.mkdir(swfDir)
unusedSwfDir = os.path.join(scrapeDir,"Flash-Unused")
if not os.path.isdir(unusedSwfDir):
  os.mkdir(unusedSwfDir)
soundDir = os.path.join(scrapeDir,"Sounds")
if not os.path.isdir(soundDir):
  os.mkdir(soundDir)
abyssalSoundDir = os.path.join(scrapeDir,"AbyssalSounds")
if not os.path.isdir(abyssalSoundDir):
  os.mkdir(abyssalSoundDir)
mapDir = os.path.join(scrapeDir,"Maps")
if not os.path.isdir(mapDir):
  os.mkdir(mapDir)
musicDir = os.path.join(scrapeDir,"Music")
if not os.path.isdir(musicDir):
  os.mkdir(musicDir)
equipmentDir = os.path.join(scrapeDir,"Equipment")
if not os.path.isdir(equipmentDir):
  os.mkdir(equipmentDir)
furnitureDir = os.path.join(scrapeDir,"Furniture")
if not os.path.isdir(furnitureDir):
  os.mkdir(furnitureDir)


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

#directory to nodeShit
nodedir = os.path.join(BASEDIR,"kcwiki-web","nodeShit")

pythonscripts = os.path.join(BASEDIR,"kcwiki-web","kcwiki","Python Scripts")
pythondata = os.path.join(pythonscripts,"data")
masterdump = os.path.join(pythondata,"dump.json")
kanmusu_data_mapping = os.path.join(pythondata,"kanmusu_data_mapping.csv")
kanmusu_obfuscated_namelist = os.path.join(pythondata,"kanmusu_obfuscated_namelist.csv")
music_id_mapping = os.path.join(pythondata,"music_id_mapping.csv")
logDir = os.path.join(pythondata,"Scrape Logs")
