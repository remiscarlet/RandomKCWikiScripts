# -*- coding: UTF-8 -*-

# Logging module.
# Contains functions for logging stuff.

import sys
reload(sys)
sys.setdefaultencoding('utf8')

import os
import datetime
import paths




if not os.path.isdir(paths.logDir):
  os.mkdir(paths.logDir)
tm = datetime.datetime.now()
timeStr = str(tm.strftime("%m%d%Y-%H%M%S"))



# Will simply append line to log file.
# outputs to "log-<timestamp>.log"
# Will add newlines automatically
def log(*string):
  log_c("log",*string)

# Will log to the verbose file.
# outputs to "log_verbose-<timestamp>.log"
def verboseLog(*string):
  log_c("log_verbose",*string)

# _c denotes "custom". Will log with a custom filename
def log_c(fileName, *string):
  string = " ".join(map(lambda x: str(x),string))
  logFilePath = os.path.join(paths.logDir,fileName+"-"+timeStr+".log")
  logFile = open(logFilePath,"a")
  logFile.write(str(string)+"\n")
  logFile.close()