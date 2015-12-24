# Recursively deletes any empty directories
import os

basePath = os.path.join("/","Users","YutoTakamoto","Desktop","Kancolle Scrape Data","Sounds")

def recurseAndDelete(path):
  dirContent = os.listdir(path)
  empty = True
  for item in dirContent:
    newPath = os.path.join(path,item)
    if os.path.isdir(newPath):
      recurseAndDelete(newPath)
  dirContent = os.listdir(path)
  for item in dirContent:
    if item != ".DS_Store":
      newPath = os.path.join(path,item)
      if os.path.isfile(newPath) or \
         os.path.isdir(newPath):
        empty = False

  if empty:
    print path
    os.rmdir(path)

recurseAndDelete(basePath)