# -*- coding: UTF-8 -*-

# Description: Will read all bgm id's from api_mst_bgm_data.json and 
# brute force all the filenames from them.
# If a filename already exists in music_id_mapping.csv, will ignore.
#
# REQUIRES: Valid api_mst_bgm_data.json created from running api_dump_parser.py
#
# ENSURES: music_id_mapping.csv will contain a mapping of id,id_with_letter
# For more information on filenames, look at the readme.md

import sys
reload(sys)
sys.setdefaultencoding('utf8')

from kcinit import *


p = re.compile("\"api_id\"\:(\d+)")

# Load up the bgm id's from the api json
bgmIdList = list()
f = open(paths.api_mst_bgm_data)
for line in f.readlines():
  if line.strip() != "":
    id = p.findall(line)
    bgmIdList.append(p.findall(line)[0])
f.close()

# Load any mappings we already know of
mappings = {}
f = open(paths.music_id_mapping,"r")
csvreader = csv.reader(f,delimiter=",")
for line in csvreader:
  mappings[line[0]] = line[1]
f.close()

# 
f = open(paths.music_id_mapping,"a")
csvwriter = csv.writer(f,delimiter=",")
for id in bgmIdList:

  if id not in mappings:
    base = "http://203.104.209.23/kcs/resources/bgm_p/"
    for c in string.ascii_letters:
      url = base+id+c+".swf"
      r = requests.head(url)
      if r.status_code == 200:
        mappings[i] = i+c
        csvwriter.writerow([i,i+c])
        break
f.close()
for k,v in mappings.items():
  print v



