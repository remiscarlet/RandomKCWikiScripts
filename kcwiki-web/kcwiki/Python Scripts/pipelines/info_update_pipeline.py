
from kcinit import *

REDOWNLOAD_JSON = True



if REDOWNLOAD_JSON:
  import subprocess

  commandline = ["node","'"+os.path.join(paths.nodedir,"foo.js")+"'","'"+paths.pythondata+"'"]

  subprocess.Popen(u" ".join(commandline), shell=True)

import api_dump_parser
import kanmusu_data_mapper