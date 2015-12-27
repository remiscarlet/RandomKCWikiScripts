# -*- coding: UTF-8 -*-
import sys
reload(sys)
sys.setdefaultencoding('utf8')

import json
import paths
import csv
from collections import OrderedDict
import os


# There are libraries that do this but
# they mostly require additional shit being installed
# like cabocha or mecab and I only need a very specific
# functionality so I just went ahead and created it. Also they
# use different romaji than I want. (They use proper linguistically
# accepted romaji like si and ti instead of shi and chi)
#
# I swear I'm not needlessly reinventing the wheel
kanaMapping = {
  u"あ":"a",                           u"ア":"a",
  u"い":"i",                           u"イ":"i",
  u"う":"u",                           u"ウ":"u",
  u"え":"e",                           u"エ":"e",
  u"お":"o",                           u"オ":"o",
  u"か":"ka", u"が":"ga",              u"カ":"ka", u"ガ":"ga",
  u"き":"ki", u"ぎ":"gi",              u"キ":"ki", u"ギ":"gi",
  u"く":"ku", u"ぐ":"gu",              u"ク":"ku", u"グ":"gu",
  u"け":"ke", u"げ":"ge",              u"ケ":"ke", u"ゲ":"ge",
  u"こ":"ko", u"ご":"go",              u"コ":"ko", u"ゴ":"go",
  u"さ":"sa", u"ざ":"za",              u"サ":"sa", u"ザ":"za",
  u"し":"shi", u"じ":"ji",             u"シ":"shi",u"ジ":"ji",
  u"す":"su", u"ず":"zu",              u"ス":"su", u"ズ":"zu",
  u"せ":"se", u"ぜ":"ze",              u"セ":"se", u"ゼ":"ze",
  u"そ":"so", u"ぞ":"zo",              u"ソ":"so", u"ゾ":"zo",
  u"た":"ta", u"だ":"da",              u"タ":"ta", u"ダ":"da",
  u"ち":"chi", u"ぢ":"ji",             u"チ":"chi",u"ヂ":"ji",
  u"つ":"tsu", u"づ":"zu",             u"ツ":"tsu",u"ヅ":"zu",
  u"て":"te", u"で":"de",              u"テ":"te", u"デ":"de",
  u"と":"to", u"ど":"do",              u"ト":"to", u"ド":"do",
  u"な":"na",                          u"ナ":"na",
  u"に":"ni",                          u"ニ":"ni",
  u"ぬ":"nu",                          u"ヌ":"nu",
  u"ね":"ne",                          u"ネ":"ne",
  u"の":"no",                          u"ノ":"no",
  u"は":"ha", u"ば":"ba", u"ぱ":"pa",  u"ハ":"ha", u"バ":"ba", u"パ":"pa",
  u"ひ":"hi", u"び":"bi", u"ぴ":"pi",  u"ヒ":"hi", u"ビ":"bi", u"ピ":"pi",
  u"ふ":"fu", u"ぶ":"bu", u"ぷ":"pu",  u"フ":"fu", u"ブ":"bu", u"プ":"pu",
  u"へ":"he", u"べ":"be", u"ぺ":"pe",  u"ヘ":"he", u"ベ":"be", u"ペ":"pe",
  u"ほ":"ho", u"ぼ":"bo", u"ぽ":"po",  u"ホ":"ho", u"ボ":"bo", u"ポ":"po",
  u"ま":"ma",                          u"マ":"ma",
  u"み":"mi",                          u"ミ":"mi",
  u"む":"mu",                          u"ム":"mu",
  u"め":"me",                          u"メ":"me",
  u"も":"mo",                          u"モ":"mo",
  u"や":"ya",                          u"ヤ":"ya",
  u"ゆ":"yu",                          u"ユ":"yu",
  u"よ":"yo",                          u"ヨ":"yo",
  u"ら":"ra",                          u"ラ":"ra",
  u"り":"ri",                          u"リ":"ri",
  u"る":"ru",                          u"ル":"ru",                           
  u"れ":"re",                          u"レ":"re",
  u"ろ":"ro",                          u"ロ":"ro",  
  u"わ":"wa",                          u"ワ":"wa",
  u"を":"wo",                          u"ヲ":"wo",
  u"ん":"n",                           u"ン":"n",
  u"ぁ":"a",                           u"ァ":"a",
  u"ぃ":"i",                           u"ィ":"i",
  u"ぅ":"u",                           u"ゥ":"u",
  u"ぇ":"e",                           u"ェ":"e",
  u"ぉ":"o",                           u"ォ":"o",
  u"ゃ":"ya",                          u"ャ":"ya",
  u"ゅ":"yu",                          u"ュ":"yu",
  u"ょ":"yo",                          u"ョ":"yo",
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
  u"　":" "
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
  17:"Attack 2",
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
  28:"SecWed",
  29:"Idle",
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

shipSuffix = OrderedDict([
  (u"改二甲","kai ni kou"),
  (u"航改二","CVL kai ni"),
  (u"改二","kai ni"),
  (u"航改","CVL kai"),
  (u"航", "CVL"),
  (u"改", "kai"),
  (u"甲", "kou")
])


abyssalTranslations = {
  u"駆逐イ級":"DD I-class",
  u"駆逐イ級後期型":"DD I-class Late Model",
  u"駆逐ロ級":"DD Ro-class",
  u"駆逐ロ級後期型":"DD Ro-class Late Model",
  u"駆逐ハ級":"DD Ha-class",
  u"駆逐ハ級後期型":"DD Ha-class Late-Model",
  u"駆逐ニ級":"DD Ni-class",
  u"駆逐ニ級後期型":"DD Ni-class Late Model",
  u"軽巡ホ級":"CL Ho-class",
  u"軽巡ヘ級":"CL He-class",
  u"軽巡ト級":"CL To-class",
  u"雷巡チ級":"CLT Chi-class",
  u"重巡リ級":"CA Ri-class",
  u"重巡リ級改":"CA Ri-class Kai",
  u"軽母ヌ級":"CVL Nu-class",
  u"戦艦ル級":"BB Ru-class",
  u"戦艦ル級改":"BB Ru-class Kai",
  u"空母ヲ級":"CV Wo-class",
  u"空母ヲ級改":"CV Wo-class Kai",
  u"輸送ワ級":"Transport Wa-class",
  u"戦艦タ級":"BB Ta-class",
  u"戦艦レ級":"BB Re-class",
  u"潜水ソ級":"SS So-class",
  u"軽巡ツ級":"CL Tsu-class",
  u"重巡ネ級":"CA Ne-class",
  u"潜水カ級":"SS Ka-class",
  u"潜水ヨ級":"SS Yo-class",
  u"泊地棲鬼":"Anchorage Demon",
  u"泊地棲姫":"Anchorage Princess",
  u"装甲空母鬼":"Armored Carrier Demon",
  u"装甲空母姫":"Armored Carrier Princess",
  u"南方棲鬼":"Southern Demon",
  u"南方棲戦鬼":"Southern War Demon",
  u"南方棲戦姫":"Southern War Princess",
  u"護衛要塞":"Escort Fortress",
  u"飛行場姫":"Airfield Princess",
  u"戦艦棲姫":"Battleship Princess",
  u"港湾棲姫":"Harbor Princess",
  u"離島棲鬼":"Isolated Island Demon",
  u"北方棲姫":"Northern Princess",
  u"中間棲姫":"Midway Princess",
  u"空母棲鬼":"Aircraft Carrier Demon",
  u"空母棲姫":"Aircraft Carrier Princess",
  u"駆逐棲姫":"Destroyer Princess",
  u"空母水鬼":"Aircraft Carrier Water Demon",
  u"軽巡棲鬼":"Light Cruiser Demon",
  u"戦艦水鬼":"Battleship Water Demon",
  u"港湾水鬼":"Harbor Water Demon",
  u"泊地水鬼":"Anchorage Water Demon",
  u"浮遊要塞":"Floating Fortress",
  u"水母棲姫":"AV Princess",
  u"防空棲姫":"Air Defense Princess",
  u"PT小鬼群":"PT Imps",
  u"軽巡棲姫":"Light Cruiser Princess",
  u"潜水棲姫":"Submarine Princess",
  u"駆逐水鬼":"Destroyer Water Demon",
}


portSongJpToEn = {
  u"冬の抜錨":"Fuyu no Batsubyou",
  u"冬の艦隊":"Fuyu no Kantai",
  u"加賀岬":"Kaga Misaki",
  u"加賀岬改(母港ver)":"Kaga Misaki Kai (Bokou ver)",
  u"士魂の護り":"Shikon no Mamori",
  u"提督との絆":"Teitoku to no Kizuna",
  u"明石の工廠":"Akashi no Koushou",
  u"暁の水平線に":"Akatsuki no Suiheisen ni",
  u"桃の節句と艦娘":"Momonosekku to Kanmusu",
  u"武蔵の帰投":"Musashi no Kitou",
  u"母港":"Bokou",
  u"浜辺の艦娘":"Hamabe no Kan",
  u"海上護衛戦":"Kaijou Goeisen",
  u"特型駆逐艦":"Tokugata Kuchikukan",
  u"秋の鎮守府":"Aki no Chinjufu",
  u"秋月の空":"Shuugetsu no Sora",
  u"第三十駆逐隊、抜錨準備！":"Dai Sanjuu Kuchikutai, Batsubyou Junbi!",
  u"第五戦隊の出撃":"Dai Go Sentai no Shutsugeki",
  u"節分の鎮守府":"Setsubun no Chinjufu",
  u"索敵機、発艦始め！":"Sakuteki, Hakkan Hajime!",
  u"聖夜の母港":"Seiya no Bokou",
  u"艦娘のお菓子作り":"Kanmusu no Okashizukuri",
  u"華の二水戦":"Hana no Nisuisen",
  u"迎春の鎮守府":"Geishun no Chinjufu",
  u"連合艦隊の出撃":"Rengou Kantai no Shutsugeki",
  u"鎮守府の朝":"Chinjufu no Asa",
  u"鎮守府の秋祭り":"Chinjufu no Akimatsuri",
  u"雨とお酒と艦娘":"Ame to Osake to Kanmusu",
  u"雨音の鎮守府":"Ameoto no Chinjufu"
}

nameChangingShips = {
  "littorio":["italia","littorio"],
  "italia":["italia","littorio"],
  "taigei":["ryuuhou","taigei"],
  "ryuuhou":["ryuuhou","taigei"],
  "hibiki":["hibiki",u"Верный"],
  u"Верный":["hibiki",u"Верный"],
  u"大鯨":[u"大鯨",u"龍鳳"],
  u"龍鳳":[u"大鯨",u"龍鳳"],
  u"リットリオ":[u"イタリア",u"リットリオ"],
  u"イタリア":[u"イタリア",u"リットリオ"],
  u"ヴェールヌイ":[u"ヴェールヌイ",u"響"],
  u"響":[u"ヴェールヌイ",u"響"]
}

unusedSWFObfIdMapping = {
  "mhqqhhvvpzxg":"Christmas 2013 Naka",
  "rzgndzraoddu":"NULL",
  "hbhkiyykheeq":"NULL",
  "boxlrnnmjkhb":"NULL",
  "jqvoyyolpqgv":"NULL",
  "igezlfrivcar":"NULL",
  "fwywlrdttcoc":"NULL",
  "fuzvvipztlod":"NULL",
  "nyveugfueqrn":"NULL",
  "ospkpclnhxkj":"NULL",
  "yotuoourymyr":"NULL",
  "utbekttrwkug":"NULL",
  "tmodouudtfbl":"NULL",
  "zzjoppqteksh":"NULL",
  "rybmohpldpuq":"NULL",
  "uhbkffblgplp":"NULL",
  "uscckqoguchc":"NULL",
  "qtuuhjmqmvfh":"NULL",
  "wmebertagnxm":"NULL",
  "lnltescodihe":"NULL",
  "tgknyzwyexxt":"NULL",
  "beymvxmvhoct":"NULL",
  "spmuptretooz":"NULL",
  "zbwwxnwyxhps":"NULL",
  "xxnlcxflgfji":"NULL",
  "dvcslbfkmdsy":"NULL",
  "tvieoobotato":"NULL",
  "grmdtyheocuc":"NULL",
  "mqlroxfnufpz":"NULL",
  "lrjshshjmuym":"NULL",
  "nklodnkbtplk":"NULL",
  "tyrymrwgeovs":"NULL",
  "qixlkacosirp":"NULL",
  "bickiyziobgh":"NULL",
  "gbccmymngqwj":"NULL",
  "rrbdyhfiywqg":"Christmas 2014 Naka",
  "nkxhelerqbjl":"Christmas 2014 Naka Kai Ni",
  "rnofsrlqiegx":"Christmas 2014 Shigure Kai Ni",
  "qzsmwrrbnefu":"Christmas 2014 Ryuujou",
  "khvcelmbxlsq":"Christmas 2014 Ryuujou Kai Ni",
  "jsmytovrrxyx":"Christmas 2014 Sazanami",
  "hfqetnvodyhm":"New Years 2015 Akebono",
  "xfvfvoryqbyi":"New Years 2015 Yuudachi Kai Ni",
  "krnmyizepihr":"New Years 2015 Akashi",
  "dvxetgdwyopk":"New Years 2015 Akashi Kai",
  "wodfmwagpixg":"New Years 2015 Ooyodo",
  "klargseqljrb":"New Years 2015 Ooyodo Kai",
  "qwbicuxeliqj":"Valentines 2015 Mutsuki Kai Ni",
  "vptgugtdxqec":"Valentines 2015 Kisaragi Kai Ni",
  "pgazsjgtftrv":"Valentines 2015 Murakumo",
  "ggxbxoylnlkv":"Valentines 2015 Shigure Kai Ni",
  "jfpblepvbqlv":"Valentines 2015 Hamakaze",
  "vdtwxormhevo":"Rainy Season 2015 Shouhou",
  "scronrcptbfd":"Rainy Season 2015 Murasame",
  "uhmnbrdfrxjx":"Rainy Season 2015 Takanami",
  "cdsgfutghqlr":"Early Summer 2015 Oboro",
  "rqxbjmdizgzp":"Early Summer 2015 Akebono",
  "yfrcebhkfeme":"Early Summer 2015 Sazanami",
  "wlvqxbzvynds":"Early Summer 2015 Ushio",
  "ojdsvkgrgyun":"Early Summer 2015 Ushio Kai Ni",
  "ftowpnpiekhh":"Early Summer 2015 Shiratsuyu",
  "ecwcfrvdtktj":"Summer 2015 Shigure Kai Ni",
  "iakggseprkmv":"Summer 2015 Yuudachi Kai Ni",
  "syrrbygrimvl":"Summer 2015 Murasame",
  "kjftklsgiiqw":"Summer 2015 Tenryuu",
  "khkhnfcvzhlh":"Summer 2015 Tatsuta",
  "jkvjvdnyjvkg":"Summer 2015 Akashi Kai",
  "xgsjrrdbdkep":"Summer 2015 Littorio",
  "pmqlugofbygx":"Summer 2015 Italia",
  "drnqclocqniv":"Early Autumn 2015 Oboro",
  "khzhuwdqwlfd":"Early Autumn 2015 Isokaze",
  "oppmayouoaon":"Early Autumn 2015 Isokaze Kai",
  "kkvtzegqjmkf":"Early Autumn 2015 Urakaze",
  "wmwkglylqfhc":"Early Autumn 2015 Hamakaze",
  "eqboowhrhakv":"Early Autumn 2015 Kawakaze",
  "kwduknmgsaex":"Oktoberfest 2015 Z1",
  "ptdxmthckjut":"Mid Autumn 2015 Ikazuchi",
  "obicookwhnpj":"Mid Autumn 2015 Inazuma",
  "nrlysgpguqtd":"Early Autumn 2015 Nagara",
  "mcfmpizxyhiu":"Early Autumn 2015 Natori",
  "fizjatjjphkx":"Mid Autumn 2015 Kuma",
  "jywjvjcnbzsi":"Mid Autumn 2015 Tama",
  "svtoekyvdpju":"Early Autumn 2015 Ooyodo",
  "bmcvmonqyxoi":"Early Autumn 2015 Jintsuu Kai Ni",
  "pggrpfnrqfhg":"Early Autumn 2015 Mizuho",
  "nexgeqpuskju":"Saury Event 2015 Akebono",
  "euyqyxkfxnke":"Saury Event 2015 Ushio",
  "nnfnhrslnjub":"Saury Event 2015 Ushio Kai Ni",
  "htxwmiwimiwl":"Saury Event 2015 Murasame",
  "ttbyunrlgtlx":"Mid Autumn 2015 Chitose",
  "oofsntihjfmn":"Mid Autumn 2015 Chiyoda",
  "sbhjkklpufcq":"Mid Autumn 2015 Harusame",
  "cnhbdryxidwq":"Halloween 2015 Roma",
  "yfcyhhkhwigb":"Halloween 2015 Libeccio",
}

#Key is world number
#Value is how many maps there are
#Presumably, if we have a x-6, there is also an x-1 through x-5.
#
#Most old maps are inaccessible. (As in they don't exist on the server)
sortieMapMapping = {
  1:6,
  2:5,
  3:5,
  4:5,
  5:5,
  6:3,
  30:6,
  31:7,
  32:5,
}




# Returns a dictionary with every japanese name,
# every english name and every api_id set as a key
# with their values being a dict with keys
# "jp", "en", "obf", "id", "sortno", "isAbyssal"
# the value of each being what you'd imagine. id=api_id, sortno=api_sortno
# isAbyssal has boolean value.
def returnFullAssocShipIdentDict():
  mapping = dict()
  f = open(paths.kanmusu_data_mapping,"r")
  csvreader = csv.reader(f,delimiter=",")
  for line in csvreader:

    # This check is just for abyssals. Since some abyssal
    # bosses have multiple entries with the same jp/en name,
    # this checks if a name already exists, in which add a number to the end
    # until that name does not exist in the dictionary.
    temp = line[0].encode("utf-8")
    temp2 = line[1].encode("utf-8")
    i = 2
    while temp in mapping or temp2 in mapping:
      temp = line[0]+str(i)
      temp2 = line[1]+str(i)
      i+=1
    isAbyssal = True if line[5] == "True" else False
    data = {"jp":temp,"en":temp2,"obf":line[2],"id":line[3],"sortno":line[4],"isAbyssal":isAbyssal}
    mapping[temp.lower()] = data
    mapping[temp2.lower()] = data
    mapping[line[2]] = data
    mapping[line[3]] = data
    if "PT" in temp:
      for k,v in data.items():
        print k,v
  return mapping
#returnFullAssocShipIdentDict()
# for k,v in returnFullAssocShipIdentDict().items():
#   if "PT" in v["jp"]:
#     print k
#     for k1,v1 in v.items():
#       print "-", k1,repr(v1)

# Will return a dict containing all the obfuscated id's mapped to 
# their api_id's regardless of whether they're used or not by api_mst_ship
def returnDictOfAllObfIds():
  ids = dict()
  f = open(paths.api_mst_shipgraph_data,"r")
  for line in f.readlines():
    parsed = json.loads(line)
    ids[parsed["api_filename"]] = parsed["api_id"]
  return ids



# Recursively deletes any empty directories
def remEmptyFolders(path):
  dirContent = os.listdir(path)
  empty = True
  for item in dirContent:
    newPath = os.path.join(path,item)
    if os.path.isdir(newPath):
      remEmptyFolders(newPath)
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

#remEmptyFolders(paths.abyssalSoundDir)


# Returns a dict containing mapping between
# api_id and api_name of the port bgm's found in api_mst_bgm_data.json
# key is an int and value is a unicode string
def returnPortBGMMapping():
  mapping = dict()
  f = open(paths.api_mst_bgm_data,"r")
  for line in f.readlines():
    parsed = json.loads(line)
    mapping[int(parsed["api_id"])] = parsed["api_name"]
  return mapping


# Simply returns every ships' name in one language. (Includes abyssals)
# To get English names, just set isEn to true.
# side expects an "enum" between ["all","abyssals","kanmusu"]
# side specifies exactly what you think it specifies.
# 
def returnAllShipNames(isEn=False,side="all"):
  if side not in ["all", "abyssals", "kanmusu"]:
    raise Exception("Parameter \"side\" not valid in function \"returnAllShipNames\" in kclib.")
  names = set()
  ships = returnFullAssocShipIdentDict()
  for shipData in ships.values():
    #print shipData
    if ((side == "all") or
        (shipData["isAbyssal"] == True and side == "abyssals") or
        (shipData["isAbyssal"] == False and side == "kanmusu")):
      lang = "en" if isEn else "jp"
      names.add(shipData[lang])
  # for name in names:
  #   print name
  return list(names)
#print returnAllShipNames(side="abyssals")

# Given a ship, will return all its variants in lowercase.
# Eg, returnVariants("bismarck")
#     => ['bismarck', 'bismarck drei', 'bismarck kai', 'bismarck zwei']
# When giving the japanese name, make sure to set isEn to False
#
# Will also return all variants of abyssals if multiple entries
# for same abyssal exist, eg most bosses.
def returnVariants(ship, isEn=True):
  # Because fuck name changing ships.
  if ship in nameChangingShips:
    return nameChangingShips[ship]

  mapping = returnFullAssocShipIdentDict()
  names = set()
  for data in mapping.values():
    k = "en" if isEn else "jp"
    name = data[k]
    if name.find(ship)>-1:
      names.add(name)
  return list(names)

# Simply returns the inputted hiragana to its romaji equivalent.
# Pretty resilient.
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









