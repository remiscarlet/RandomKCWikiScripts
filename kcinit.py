import os
import sys

__BASEDIR = os.path.dirname(os.path.realpath(__file__))
__kcwikipath = os.path.join(__BASEDIR,"kcwiki-web","kcwiki")
__pythondir = os.path.join(__kcwikipath,"Python Scripts")

sys.path.append(__kcwikipath)
sys.path.append(os.path.join(__pythondir,"file-scripts"))
sys.path.append(os.path.join(__pythondir,"mw-scripts"))
sys.path.append(os.path.join(__pythondir,"pipelines"))
sys.path.append(os.path.join(__pythondir,"scrapers"))
sys.path.append(os.path.join(__pythondir,"lib"))

import logger
import kclib
import requests
import json
import re
import string
import paths
import csv

