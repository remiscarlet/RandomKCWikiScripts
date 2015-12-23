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
Katori
Akashi
Shoukaku
Zuikaku
Hyuuga
Nagato
Mutsu
Littorio
Roma
Suzuya
Kumano
Nachi
Ashigara
Furutaka
Kako
Choukai
Ooi
Sendai
Naka
Tatsuta
Kinu
Abukuma
Yuubari
Shirayuki
Kagerou
Shiranui
Maikaze
Hatsukaze
Tokitsukaze
Takanami
Kisaragi
Fumizuki
"""
delimiter = "\n"
valToGet = "shipClass" #can be "jp", "en", "shipClass" or "speed"


### FILL THIS OUT ONLY IF JPWIKI HAS THE TRANSLATIONS
jpVoiceMapping = u"""
香取「また……夏がやってきましたね。駆逐艦たちがはしゃいでる。提督も一泳ぎされます？」
明石「夏ですねえ……。私もおしゃれな水着欲しいなあ。……提督、買ってくれてもいいのよ？　キラキラ（ひひ）」
翔鶴「瑞鶴、新しい水着を買ったの？　あら♪いいわねぇ。とても可愛いわ…。　えっ、私？　私は去年のでいいわ…。　えっ？そう…？　そうかしら…。」
瑞鶴「翔鶴姉、見てみて！　今年のおニューの水着だよ♪　買っちゃった！　だってもうすぐ夏だよ、夏！　翔鶴姉も買いに行こうよ、ね？」
日向「この季節は嫌いではないな……。伊勢……伊勢？　なんだ、寝てるのか？」
長門「よし、夏だなッ！　艦隊、水着で浜辺に集合だッ！　演習……“びーちばれー”というのをやるぞッ！　チーム分けはこの長門が考えておいたッ！」
陸奥「なぁに長門ったら……ビーチバレー？　いいけど、貴女ルール知ってるの？　……（苦笑）あらあら、仕方ないわね……任せて」
Littorio「もうすぐ夏ですね……提督。新しい水着を試してみたいですね。ふふふ、楽しみです♪」
Roma「大分暑くなってきたけれど、もうすぐ夏か。……姉さん、水着新調したんだ……ふぅん」
鈴谷「……ん～、ちょっち暑くなってきた、かな～？　ん～、何か蒸し蒸しするぅ～。……熊野は平気？」
熊野「夏の足音を感じますわ。鈴谷、わたくし、最新の水着を買いに行きたいですわ！」
那智「夏だな。……暑いがまあ、気になる程でもないな。さあ、暑気払いで一杯やるか！」
足柄「今年も夏が近づいてきたわね。……何だか、みなぎってきたわ！　イケる！　今年はイケるわ！」
古鷹「今年も夏がやってきますね……。新しい水着、加古と買いに行こうかな？」
加古「い～よいよ暑くなってきましたねえ！　夏が来るねえ……ふひひ。いいねぇ夏！　いいよ！」
鳥海「夏、ですね。……え？　水着ですか？　……あぁ、い、いえ、私はそのような……。あ……はい、では今度」
大井「もうすぐ夏ねぇ♪　北上さんとお揃いの水着、買わなくちゃ♪　ふふ、ふふふ♪」
川内「夏だぁ！！　やったぁ！！　夜戦の季節だぁ！！　提督、夜戦だよ夜戦！！　はやく！！　や・せ・ん！！」
那珂「夏だよ、夏！　那珂ちゃんサマーライブの夏だよぉ！　よーし歌うよ～！　衣装衣装♪」
龍田「今年も暑くなるわねぇ～。執務室にクーラーですって？　何をふざけているのかしら？　その服を……涼しくしてあげましょうね」
鬼怒「……あっついなあ。もう夏かあ……初夏（しょっかぁ）……みーんみんみーん……あ、ダメ？」
阿武隈「日の入りがずいぶんと長くなりましたねぇ。もうすぐ夏ですねぇ。……ふぅ。そうなるとどこかの三水戦のがうるさくなるなぁ……」
夕張「ふあ～、少し暑くなってきたわねえ。今年も夏が来るのかぁ、はっやいな～」
白雪「ん……この季節、飛び交う虫は苦手です。ぐるぐる型のお香を焚きましょう。白雪にお任せください、一網打尽です！」
陽炎「不知火ぃ～。あんたも今年は、新しい水着買いなさい、よっ。……え？　んぁ～、もうっ！　私が選んだげるっ！」
不知火「いや、不知火はそんな買い物には行か……いや、仕方ない。……あ、これはいいかも」
舞風「もうすぐ夏ですねぇ提督。夏は、どんなステップで踊る？　ん～、どうしようか？　ねえ、提督？」
初風「……はぁ、もうすぐ夏ね。え？　水着？　買ってないわ。なぁに、プレゼントしてくれるの？」
時津風「しれぇ～、そろそろ夏だねぇ～。今年の夏はぁ～、雪風たちと泳ぎに行こ～よぉ～♪　ねぇ～ねぇ～」
高波「暑くなってきましたね。もうすぐ、夏かも。……司令官は暑くないかもですか？」
如月「もうすぐ夏ねぇ～。新しい水着、買っちゃおう……かな？　……ねぇ、どれがいいと思う？」
文月「そろそろ夏～。気の早いセミが、もう鳴いてる～」
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

for k,v in jpVoiceMappingDict.items():
	print unicode(k)+u" : "+unicode(v)


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
			else:
				print jpShipName

			finalString+="===[["+ship+"]]===\n"
			finalString+="{| class=\"wikitable\"\n"
			finalString+=" |{{lang|ja|%s}}\n" % jpLine
			finalString+=" |''''\n"
			finalString+=" |}\n"


print finalString

