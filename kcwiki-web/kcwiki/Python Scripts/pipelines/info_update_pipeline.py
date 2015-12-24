
from kcinit import *

REDOWNLOAD_JSON = True



if REDOWNLOAD_JSON:
  import subprocess

  commandline = ["node","'"+os.path.join(paths.nodedir,"foo.js")+"'","'"+paths.pythondata+"'"]

  subprocess.Popen(u" ".join(commandline), shell=True)

