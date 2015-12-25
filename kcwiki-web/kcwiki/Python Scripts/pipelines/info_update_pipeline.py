# Runs the entire pipelines from downloading new json (optional)
# to splitting it, pulling the relevant kanmusu/abyssal data into a csv
# and finally brute forcing the music id's for the port music.
# Note that this pipeline does not actually scrape anything.
# This script is purely for PREPARING to scrape and will only
# sort out and organize information.

from kcinit import *

def runInfoUpdatePipeline(REDOWNLOAD_JSON = False):
  if REDOWNLOAD_JSON:
    import subprocess

    commandline = ["node","'"+os.path.join(paths.nodedir,"api_getter.js")+"'","'"+paths.pythondata+"'"]

    p = subprocess.Popen(u" ".join(commandline), shell=True)
    p.wait()

  import api_dump_parser
  import kanmusu_data_mapper
  import music_id_finder