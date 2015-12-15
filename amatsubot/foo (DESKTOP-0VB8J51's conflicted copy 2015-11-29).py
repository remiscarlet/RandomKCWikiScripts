# -*- coding: UTF-8 -*-
import sys
reload(sys)
sys.setdefaultencoding('utf8')
import requests
import os
import re
import copy
import time
import sqlite3
import csv

string = ""

p = re.compile("(\d+?)([a-zA-Z])")
results = p.findall(string)
print results