# -*- coding: UTF-8 -*-
# -*- coding: UTF-8 -*-
import sys
reload(sys)
sys.setdefaultencoding('utf8')

import re
import os
import string
import requests

bgmIdList = [
  101,
  105,
  106,
  107,
  108,
  109,
  110,
  111,
  112,
  113,
  114,
  115,
  116,
  117,
  118,
  119,
  205,
  206,
  207,
  208,
  209,
  210,
  211,
  212,
  213,
  214,
  215,
  216,
  217,
  218,
  219,
  220,
  221,
  222,
  223,
  224,
  225,
  226,
  227,
  228,
]
mappings = {}

for i in bgmIdList:
  base = "http://203.104.209.23/kcs/resources/bgm_p/"
  for c in string.ascii_letters:
    url = base+str(i)+c+".swf"
    r = requests.head(url)
    if r.status_code == 200:
      mappings[i] = c
      break
for k,v in mappings.items():
  print str(k)+v



