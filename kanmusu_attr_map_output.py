# -*- coding: UTF-8 -*-
import sys
reload(sys)
sys.setdefaultencoding('utf8')
import os



attrDict = dict()
with open("kanmusu_jp-en_mapping.txt","r") as attrMapping:
	for line in attrMapping.readlines():
		split = line.split(",")
		for attr in split:
			attrDict[attr] = split

######################################
# INPUTS SHOULD BE A LIST OF NAMES. DELIMITER IS CONFIGURABLE
inputs = """
Abukuma
Akagi
Akashi
Akitsushima
Ayanami
Chikuma
Choukai
Fubuki
Fusou
Hatsuyuki
Isonami
Jintsuu
Kaga
Kinu
Kisaragi
Kiso
Kongou
Kuroshio
Littorio
Miyuki
Mochizuki
Murakumo
Murasame
Mutsu
Mutsuki
Myoukou
Nagato
Naka
Roma
Samidare
Satsuki
Sendai
Shigure
Shikinami
Shimakaze
Shirayuki
Shouhou
Shoukaku
Suzukaze
Takanami
Tama
Tatsuta
Tenryuu
Tokitsukaze
Tone
Uzuki
Yamashiro
Yayoi
Yukikaze
Yuudachi
Zuikaku
"""
delimiter = "\n"
valToGet = "shipClass" #can be "jp", "en", "shipClass" or "speed"


### FILL THIS OUT ONLY IF JPWIKI HAS THE TRANSLATIONS
jpVoiceMapping = u"""
明石「梅雨の季節ですね。工廠施設が傷んじゃうなあ…よく整備して、油差しておかないと」
秋津洲「提督、梅雨はちょっと嫌ですね。大艇ちゃんも困ってるかも…てるてる坊主作ろっかな」
赤城「梅雨の季節ですね。また雨…こんな日は間宮で息抜きもいいですね、提督。…提督？」
加賀「雨？…この季節は、何かあまり好きではないわ。…え、赤城さんも？そう…いえ、何でもないわ」
翔鶴「梅雨の季節ですね。MO作戦の頃を思い出します。あのときのスコールは…ね、瑞鶴」
瑞鶴「この季節は嫌だな…何かやだ、苦手。翔鶴姉、大丈夫かな。なんか、心配…」
日向「この季節はよく雨が降るな。瑞雲の運用に影響が出るのはあまり好ましくないが…」
扶桑「山城、梅雨の季節は、やっぱり雨が多いわね。時雨は元気にしているかしら…」
山城「姉様、梅雨の季節は艤装が傷みがちで困りますね。ほんっと、もう…不幸だわ」
長門「陸奥。…なんだ、傘か？…ああ、有り難い。梅雨の雨か…ま、たまにはこんな落ち着いた日も、悪くはないな…」
陸奥「あっ長門、出掛けるの？この傘を持っていって。今日は降り続けるわよ、雨」
金剛「Oh、Rainyな梅雨のSeason、私苦手デース！うぅ～！」
Littorio「何か雨が多いですね最近。これが日本の、梅雨というものなんですね。勉強になります」
Roma「梅雨…ふーん、これが梅雨か。雨が多いけど、空襲も少ないから、悪くは無いわね」
祥鳳「梅雨かあ…この季節は、私が進水した季節でもあり、私が……ああいえ、何でもないの。大丈夫です…」
妙高「雨の季節、梅雨ですね。雨の音も、目を閉じて聞いていると…心が落ち着きますね」
鳥海「司令官さん。梅雨の季節は、少し落ち着きますね…え、違いますか！？す、すみません…」
利根「塀の上にかたつむりがおるぞ！風流じゃなぁ。ぅえ!?これは塀を食しておるのか!?なんと！」
筑摩「姉さん、カタツムリをいじめてはダメですよ。あ、愛でている？　そ、そうですか…」
天龍「提督、出掛けるのか？今日は傘持って出た方がいいぜ。と、オレの電探が言ってるな」
龍田「もう、いつまで降り続けるのかしら。湿度が高いと、傷が痛むのよね…うふふ」
球磨「･･･梅雨は苦手だクマ…クーマー･･･クーマー･･･あー雨は苦手だクマー…クーマー…」
多摩「雨の日は、お部屋の中で丸まっていたいにゃ。なんか眠いにゃ。おやすみにゃ。」
木曾「雨の季節は、体の傷が疼く。早く早くとけしかけてくるようだ…いや、気にするな」
鬼怒「梅雨の季節、雨の日多いよね～。あっ、退屈だからしりとりしよっか！えっと、提督、く…駆逐艦！…あっ、終わりじゃん！」
阿武隈「雨の日が多い、梅雨の季節かあ…心なしか、白露型がはしゃいでる。…駆逐艦、うざい。…やだ、誰かさんの口癖が移っちゃった！？」
川内「梅雨かぁ…艤装が傷むから嫌なんだよねー。でもいっか、夜戦は雨もなにもないしね！」
神通「梅雨の季節、雨の音…落ち着いた気持ちになれますね。…提督、今日は静かですね」
那珂「梅雨の季節も、那珂ちゃんはもちろんセンター！那珂ちゃんてるてる坊主も、もちろんセンターでぇす！」
睦月「如月ちゃん、最近雨が多いね。あ、そうだ！てるてる坊主作ろ！如月ちゃんと睦月の。」
如月「あら、睦月ちゃんのてるてる坊主、かわいいわね。如月のもあるの？ありがとう。」
弥生「梅雨……あ、このてるてる坊主、かわいい…あ、気にしないで…ください……」
卯月「雨の日は苦手だぴょん…ぷっぷくぷぅ～！」
皐月「皐月の、季節…ボクの季節だね！うふふっ。」
望月「眠い…梅雨かあ～。雨音って眠気を誘うよね～…司令官も一緒に寝よう、あふぅ…」
吹雪「今日も雨ですね。梅雨ですから、仕方ないですね、雨。そうだ！訓練しましょう、うん！あれ、白露型が元気、ですね…」
白雪「雨には雨の戦い方がある、そう教えてくれたのは司令官です。大丈夫、雨の日もご一緒に参りましょう」
初雪「梅雨の、雨。雨は、嫌い。引きこもる」
深雪「梅雨はうっとうしいよなあ、なあ磯波よお。…おい、聞いてる？」
叢雲「梅雨か…ま、嫌いじゃないわ。少しゆっくりできるじゃない。アンタは嫌いなの？」
綾波「梅雨の季節、雨の音も、気持ちを切り替えれば、心地良いですね。司令官も、そう思われます？」
磯波「梅雨ですね。なんか、落ち着いた気持ちになって、これはこれでいいですね。え、深雪ちゃん？違うの!?ええ!?」
敷波「梅雨の季節は、あんま外出る気がしなくて少しやだな。まあ、いいんだけどさ、ん」
Верный「司令官の手は、温かいな。…いや、その…ロシアでは、重宝される手だ」
時雨「提督。……止まない雨は無いさ。……そう、心配しなくていいんだ。……僕も、いつでも一緒にいる。そばにいて……いいんだよね」
夕立「うぅ、うぅ～んっ、気持ちいいっぽーい！」
五月雨「梅雨の季節、五月雨、結構好きなんです。なんかこう、雨の日って良くないですか？…ねっ！」
涼風「う～ん、梅雨だな。雨かあ、嫌いじゃねえけど…なっ五月雨、なあ！」
黒潮「雨やね。雨の季節は、それはそれでええもんやね」
雪風「しれぇ……最近雨の日がおおいです。制服や洗濯物が乾きにくくて困りますね。しれぇ♪」
時津風「雨の季節はやだね～、なんか嫌～。…そんな時はぁ、司令の頭にでも登るかぁ～っ！がーるる～っ♪」
高波「雨の日が続く…かも…です。でも、雨の日は静かで良いですね。高波、好きかもです」
島風「この季節は雨が多くて、連装砲ちゃんたちがかわいそう。早く夏になれ～、はやくはやく～！」
"""

print jpVoiceMapping

######################################

toGet = inputs.strip().split(delimiter)
attrToIndex = {"jp":0,"en":1,"shipClass":2,"speed":3}

#####################################
#### WRITE OUT CUSTOM LOGIC HERE ####
#####################################

##### SEASONAL CHAR LINE FORMATTING #####
output = dict()

for item in toGet:
	kanmusuClass = attrDict[item.lower()][attrToIndex["shipClass"]]
	if kanmusuClass not in output:
		output[kanmusuClass] = list()
	output[kanmusuClass].append(item)
for k,v in output.items():
	v.sort()
	output[k] = v

for k,v in output.items():
	pass#print k+" : "+repr(v)


jpVoiceMappingDict = dict()
voices = jpVoiceMapping.strip().split(u"\n")
for voice in voices:
	split = voice.split(u"「")
	jpVoiceMappingDict[split[0]] = split[1][:-1]


classMapping = {
	"DD":"Destroyer",
	"CL":"Light Cruiser",
	"CLT":"Torpedo Cruiser",
	"CA":"Heavy Cruiser",
	"CAV":"Heavy Cruiser",
	"FBB":"Fast Battleship",
	"BB":"Battleship",
	"BBV":"Aviation Battleship",
	"CVL":"Light Carrier",
	"CV":"Standard Carrier",
	"CVB":"Armored Carrier",
	"AV":"Seaplane Tender",
	"AR":"Repair Ship",
	"LHA":"Amphibious Assault Ship",
	"SS":"Submarine",
	"SSV":"Aviation Submarine",
	"CLP":"Practice Cruiser"
}
order = ["DD","CL","CLT","CA","CAV","FBB","BB","BBV","CVL","CV","CVB","AV","SS","SSV","AR","LHA","CLP"]

finalString = ""
for classType in order:
	if classType in output:
		finalString+="=="+classMapping[classType]+"==\n"
		for ship in output[classType]:
			jpLine = ""
			jpShipName = attrDict[ship.lower()][attrToIndex["jp"]]
			if unicode(jpShipName) in jpVoiceMappingDict:
				jpLine = jpVoiceMappingDict[unicode(jpShipName)][:-1]

			finalString+="===[["+ship+"]]===\n"
			finalString+="{| class=\"wikitable\"\n"
			finalString+=" |{{lang|ja|%s}}\n" % jpLine
			finalString+=" |''''\n"
			finalString+=" |}\n"


print finalString

