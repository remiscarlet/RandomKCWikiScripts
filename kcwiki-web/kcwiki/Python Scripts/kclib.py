# -*- coding: UTF-8 -*-
import sys
reload(sys)
sys.setdefaultencoding('utf8')

import json
import paths
import csv
import os


kanaMapping = {
  u"あ":"a",                          u"ア":"a",
  u"い":"i",                          u"イ":"i",
  u"う":"u",                          u"ウ":"u",
  u"え":"e",                          u"エ":"e",
  u"お":"o",                          u"オ":"o",
  u"か":"ka", u"が":"ga",    
  u"き":"ki", u"ぎ":"gi",
  u"く":"ku", u"ぐ":"gu",             u"ク":"ku",
  u"け":"ke", u"げ":"ge",
  u"こ":"ko", u"ご":"go",
  u"さ":"sa", u"ざ":"za",
  u"し":"shi", u"じ":"ji",
  u"す":"su", u"ず":"zu",             u"ス":"su", u"ズ":"zu",
  u"せ":"se", u"ぜ":"ze",
  u"そ":"so", u"ぞ":"zo",
  u"た":"ta", u"だ":"da",
  u"ち":"chi", u"ぢ":"ji",            u"チ":"chi", u"ヂ":"di",
  u"つ":"tsu", u"づ":"zu",
  u"て":"te", u"で":"de",
  u"と":"to", u"ど":"do",             u"ト":"to", u"ド":"do",
  u"な":"na", 
  u"に":"ni", 
  u"ぬ":"nu", 
  u"ね":"ne", 
  u"の":"no", 
  u"は":"ha", u"ば":"ba", u"ぱ":"pa",  u"ハ":"ha", u"バ":"ba", u"パ":"pa",
  u"ひ":"hi", u"び":"bi", u"ぴ":"pi",  u"ヒ":"hi", u"ビ":"bi", u"ピ":"pi",
  u"ふ":"fu", u"ぶ":"bu", u"ぷ":"pu",
  u"へ":"he", u"べ":"be", u"ぺ":"pe",  u"ヘ":"he", u"ベ":"be", u"ペ":"pe",
  u"ほ":"ho", u"ぼ":"bo", u"ぽ":"po",
  u"ま":"ma",                          u"マ":"ma",
  u"み":"mi", 
  u"む":"mu", 
  u"め":"me", 
  u"も":"mo", 
  u"や":"ya", 
  u"ゆ":"yu", 
  u"よ":"yo", 
  u"ら":"ra", 
  u"り":"ri",                          u"リ":"ri",
  u"る":"ru",                          u"ル":"ru",                           
  u"れ":"re",                          u"レ":"re",
  u"ろ":"ro",                          u"ロ":"ro",  
  u"わ":"wa", 
  u"を":"wo", 
  u"ん":"n", 
  u"ぁ":"a",
  u"ぃ":"i",
  u"ぅ":"u",
  u"ぇ":"e",
  u"ぉ":"o",
  u"ゃ":"ya",
  u"ゅ":"yu",
  u"ょ":"yo",
  u"っ":"",                            u"ッ":"",
  u"０":"0",
  u"１":"1",
  u"２":"2",
  u"３":"3",
  u"４":"4",
  u"５":"5",
  u"６":"6",
  u"７":"7",
  u"８":"8",
  u"９":"9",
  "0":"0",
  "1":"1",
  "2":"2",
  "3":"3",
  "4":"4",
  "5":"5",
  "6":"6",
  "7":"7",
  "8":"8",
  "9":"9",
  u"ー":"",
  u"・":" ",
}

voiceIdMapping = {
  1:"Intro",
  2:"Secretary 1",
  3:"Secretary 2",
  4:"Secretary 3",
  5:"Ship Construction",
  6:"Repair Complete",
  7:"Return From Sortie",
  8:"Player Score",
  9:"Equipment 1",
  10:"Equipment 2",
  11:"Repair Light Damage",
  12:"Repair Medium Damage",
  13:"Joining A Fleet",
  14:"Start Sortie",
  15:"Battle Start",
  16:"Attack",
  17:"Night Attack",
  18:"Night Battle",
  19:"Minor Damage 1",
  20:"Minor Damage 2",
  21:"Moderately Damaged",
  22:"Sunk",
  23:"MVP",
  24:"Wedding",
  25:"Library Intro",
  26:"Equipment 3",
  27:"Supply",
  28:"Secretary Married",
  29:"Secretary Idle",
  30:"Hourly 0000",
  31:"Hourly 0100",
  32:"Hourly 0200",
  33:"Hourly 0300",
  34:"Hourly 0400",
  35:"Hourly 0500",
  36:"Hourly 0600",
  37:"Hourly 0700",
  38:"Hourly 0800",
  39:"Hourly 0900",
  40:"Hourly 1000",
  41:"Hourly 1100",
  42:"Hourly 1200",
  43:"Hourly 1300",
  44:"Hourly 1400",
  45:"Hourly 1500",
  46:"Hourly 1600",
  47:"Hourly 1700",
  48:"Hourly 1800",
  49:"Hourly 1900",
  50:"Hourly 2000",
  51:"Hourly 2100",
  52:"Hourly 2200",
  53:"Hourly 2300",
}


def returnFullAssocShipIdentDict():
  mapping = dict()
  f = open(paths.kanmusu_data_mapping,"r")
  csvreader = csv.reader(f,delimiter=",")
  for line in csvreader:
    data = {"jp":line[0],"en":line[1],"obf":line[2],"id":line[3],"sortno":line[4]}
    mapping[line[0]] = data
    mapping[line[1]] = data
    mapping[line[2]] = data
    mapping[line[3]] = data
  return mapping

def returnAllShipNamesJp():
  names = list()
  f = open(paths.kanmusu_data_mapping,"r")
  csvreader = csv.reader(f,delimiter=",")
  for line in csvreader:
    names.append(line[0])
  return names


def importJsonFileIntoDict(json):
  f = open(paths.kanmusu_data_mapping,"w")
  csvwriter = csv.writer(f,delimiter=",")
  jsonDump = open(paths.api_mst_ship_data,"r")

def hiraToRoma(hiragana):
  romaji = ""
  # If glottal stop, must do proper romaji equivalent (っ)
  glottal = False
  for c in hiragana:
    if c.decode("utf-8") in list(u"ぁぃぅぇぉゃゅょ"):
      romaji = romaji[:-1]+kanaMapping[c.decode("utf-8")]
    elif c.decode("utf-8") == u"っ":
      glottal = True
    else:
      if glottal:
        romaji+=kanaMapping[c.decode("utf-8")][0]
      romaji+=kanaMapping[c.decode("utf-8")]
      glottal = False

  romaji = romaji.replace("shya","sha")
  romaji = romaji.replace("shyu","shu")
  romaji = romaji.replace("shyo","sho")
  romaji = romaji.replace("chya","cha")
  romaji = romaji.replace("chyu","chu")
  romaji = romaji.replace("chyo","cho")
  romaji = romaji.replace("jya","ja")
  romaji = romaji.replace("jyu","ju")
  romaji = romaji.replace("jyo","jo")
  return romaji