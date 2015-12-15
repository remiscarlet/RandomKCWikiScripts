# -*- coding: UTF-8 -*-
import sys
reload(sys)
sys.setdefaultencoding('utf8')
import os


import xchat
import random
import time
import io
import re
import copy
import math
import urllib
import urllib2
import sqlite3
import threading
import requests
import HTMLParser
import json
from py_expression_eval import Parser

if os.name == "posix":
	sys.path.insert(0,os.path.join("/Users","YutoTakamoto","Dropbox","YutoProgramming","RandomKCWikiScripts","amatsubot"))
else:
	sys.path.insert(0,'G:\\Dropbox\\YutoProgramming\\RandomKCWikiScripts\\amatsubot')
from chatterbotapi import ChatterBotFactory, ChatterBotType
import Amatsubot_Settings as settings

__module_name__ = "Amatsukaze" 
__module_version__ = "v0.1.8.3 You mean Remi's not dead?"
__module_description__ = "The Amatsukaze Bot" 
__latest_addition__ = "This wasn't even supposed to be used outside my company's IRC services \ o /"
__full_info__ = '''
This is the first iteration of the AmatsukazeBot. Random new features will be added on at random 
intervals. Feel free to suggest strange functionalities to Remi/w0lf/Yuto and he'll probably 
add it on when he's bored.
'''
factory = ChatterBotFactory()

bot = factory.create(ChatterBotType.CLEVERBOT)

sessions = list()

conn = sqlite3.connect(settings.AMATSUDB_PATH)
c = conn.cursor()

def isYuto(xChatNick):
	return xChatNick.lower() == "remi_scarlet" or xChatNick.lower() == "remiw0lf" or xChatNick.lower() == "amatsukaze"

def say(destination,msg):
	if type(msg) == unicode:
		thing = (u"say \00307"+msg).replace(u"\/",u"/").encode('utf-8')
	else:
		thing = ("say \00307"+msg).replace("\/","/")
	destination.command(thing)

def on_trigger_content(word, word_eol, userdata, destination) : #when triggered
	weatherAPI = settings.weatherAPI
	xChatNick = word[0].split("|")[0]
	xChatMessage = word[1].strip()
	xChatNickFull = word[0]
	xChatMessageSplitUnsanitized = xChatMessage.split(" ")
	xChatMessageSplit = list()
	isCaptions = (xchat.get_info("network") == "Slack")
	channel = destination.get_info("channel").lower()
	for word in xChatMessageSplitUnsanitized:
		xChatMessageSplit.append(word.lower())
	if xChatMessage[0] != "!":
		#is url
		for piece in xChatMessage.split(" "):
			if piece.find("http") >-1:
				def getURLTitle(url,destination):
					r = requests.head(url)
					# Don't bother printing anything to channel if image or non-text, eg an image.
					# Too many "puush.com - fj2i3cad.jpg shit lol"
					isText = False
					if r.headers["content-type"].find("text") > -1:
						isText = True
						r = requests.get(url)
					encoding = re.search("<meta.*?content=\".*?charset=(.*?)\"",r.text,re.DOTALL)
					print encoding
					print "AAAA" 
					encode = "utf8"
					if encoding != None:
						encode = encoding.group(1)
					title = re.search("<title.*?>(.*?)</title>",r.text.encode("utf8"), re.DOTALL)
					if title != None and title.group(1) != "":
						say(destination,title.group(1).strip())
					elif r.status_code != 404 and isText:
						url = urllib2.unquote(url).decode(encode)
						split = url.split("/")
						thing = split[:3]
						thing = ["/".join(thing)]
						thing.append(split[-1])
						say(destination," - ".join(thing))
					else:
						print "invalid url"
						print piece
				t = threading.Thread(target=getURLTitle, args=(piece.strip(), destination))
				t.start()

	if xChatMessage[0] == "!":
		firstWord = xChatMessageSplit[0]
		userList = xchat.get_list("users")
		opped = False
		for user in userList:
			if user.nick.split("|")[0].lower() == xChatNick.lower():
				if "@" in user.prefix:
					opped = True
		########################
		### OP ACCESS REQUIRED COMMANDS
		########################
		if firstWord == "!op":
			if opped:
				toOp = xChatMessageSplit[1]
				channel = xchat.get_info("channel")
				destination.command("cs flags "+channel+" "+toOp+" AOP")
				say(destination,"User "+toOp+" has been added to the Auto-Op list!")
			else:
				say(destination,"You need to be opped to use that!")
		#
		#
		if firstWord == "!deop":
			if opped:
				toDeop = xChatMessageSplit[1]
				channel = xchat.get_info("channel")
				destination.command("cs flags "+channel+" "+toDeop+" -O")
				say(destination,"User "+toDeop+" has been removed from the Auto-Op list!")
			else:
				say(destination,"You need to be opped to use that!")
		#
		#
		if firstWord == "!voice":
			if opped:
				chanUsers = xchat.get_list(users)
				print chanUsers
				toOp = xChatMessageSplit[1]
				channel = xchat.get_info("channel")
				destination.command("cs flags "+channel+" "+toOp+" +V")
				print "cs flags "+channel+" "+toOp+" +V"
				say(destination,"User "+toOp+" has been added to the Auto-Voice list!")
			else:
				say(destination,"You need to be opped to use that!")
		#
		#
		if firstWord == "!devoice":
			if opped:
				chanUsers = xchat.get_list(users)
				print chanUsers
				toDeop = xChatMessageSplit[1]
				channel = xchat.get_info("channel")
				destination.command("cs flags "+channel+" "+toDeop+" -V")
				say(destination,"User "+toDeop+" has been removed from the Auto-Voice list!")
			else:
				say(destination,"You need to be opped to use that!")
		#
		#
		if firstWord == "!topic" or firstWord == "!settopic":
			if opped:
				xChatMessageSplitUnsanitized.pop(0)
				string = ""
				for word in xChatMessageSplitUnsanitized:
					string += " "+word
				string.strip()
				channel = xchat.get_info("channel")
				destination.command("cs topic "+channel+" "+string)
			elif destination.get_info("network") == "Slack":
				say(destination,"There are no topics in Slack!")
			else:
				say(destination,"You need to be opped to use that!")
		#
		#
		if firstWord == "!herald":
			if len(xChatMessage.split(" "))>1:
				secondWord = xChatMessage.split(" ")[1]
				target = xChatMessage.split(" ")[2].lower()
				if secondWord == "add":
					if len(xChatMessage.split(" "))>2:
						message = xChatMessage.split(" ")[3:]
						if opped or isYuto(xChatNick):
							c.execute('SELECT * FROM Heralds WHERE Nick = ?', (target,))#check
							result = c.fetchone()
							if result == None:
								c.execute('INSERT INTO Heralds VALUES (?,?)', (target, " ".join(message)))
							else:
								c.execute('UPDATE Heralds SET Herald=? WHERE Nick=?', (" ".join(message),target))
							conn.commit()
							say(destination, "Got it! I'll say that from now on <3")
						else:
							pass
							#say(destination,"You need to be opped to use that!")
				if secondWord == "remove":
					if opped or isYuto(xChatNick):
						c.execute('SELECT * FROM Heralds WHERE Nick = ?', (target,))#check
						result = c.fetchone()
						if result != None:
							c.execute('DELETE FROM Heralds WHERE Nick = ?', (target,))
							say(destination, "Okay, I won't say anything when "+xChatMessage.split(" ")[2]+" joins anymore!")
						else:
							say(destination, "I don't say anything when that user joins right now!")
						conn.commit()
			else:
				say(destination,"You didn't provide enough arguments! \00307!herald <add|remove> <nick> [message]")
		########################
		# OP ACCESS NOT REQUIRED
		########################
		if firstWord == "!ver":
			say(destination,"Amatsukaze is currently on version \00304"+__module_version__)
			say(destination,"The Version summary is: \00304"+__latest_addition__)
			say(destination,"Type \00304!info\00307 to get the full version info.")
		#
		#
		if firstWord == "!info":
			say(destination,__full_info__.replace("\n",""))
		#
		#
		if firstWord == "!ping":
			say(destination,"Pong!")
		if firstWord == "!quote" or firstWord == "!quotes":
			channel = xchat.get_info("channel")
			if len(xChatMessage.split(" "))>2:
				secondWord = xChatMessage.split(" ")[1]
				#
				if secondWord in ["add","+"]:
					message = " ".join(xChatMessage.split(" ")[2:])
					timestamp = str(time.time())
					print timestamp
					print type(timestamp)
					c.execute("SELECT Id FROM Quotes ORDER BY Id DESC")
					currId = c.fetchone()
					currId = currId[0]+1 if currId != None else 1
					print currId
					nick = xChatNick.split("|")[0]
					c.execute("INSERT INTO Quotes VALUES (?,?,?,?,?)", (currId,timestamp,channel,nick,message))
					conn.commit()
					say(destination,"Got it! I've saved that quote as number #"+str(currId)+" <3")
				#
				if secondWord in ["delete","remove","del","rem","rm"] and isYuto(xChatNick):
					quoteId = xChatMessage.split(" ")[2]
					quoteId.replace("#","")
					# Removing "#" incase people put in "#134" for id instead of "134"
					if quoteId.isdigit():
						c.execute("SELECT * FROM Quotes WHERE Id=?",(quoteId,))
						if c.fetchone() != None:
							c.execute("DELETE FROM Quotes WHERE Id=?",(quoteId,))
					else:
						say(destination, "That quote id isn't even a number :(")
				#
				if secondWord in ["show", "tell", "see", "read"]:
					quoteId = xChatMessage.split(" ")[2]
					quoteId.replace("#","")
					if quoteId.isdigit():
						c.execute("SELECT * FROM Quotes WHERE Id=? AND channel=?",(quoteId,channel))
						result = c.fetchone()
						if result == None:
							say(destination,"I couldn't find a quote by that id or it doesn't belong to this channel!")
						else:
							timestamp = time.gmtime(float(result[1]))
							nick = result[3]
							message = '"'+result[4]+'"'
							days = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
							timeStr = (str(timestamp[3]).zfill(2)+":"+str(timestamp[4]).zfill(2)+":"+str(timestamp[5]).zfill(2)+" GMT 0:00 on "
										+str(timestamp[1])+"/"+str(timestamp[2])+"/"+str(timestamp[0]))
							say(destination,"Quote #"+quoteId+" was saved at "+timeStr+" by "+nick)
							say(destination,message)
				if secondWord in ["search","find","lookup"]:
					searchTerms = xChatMessage.split(" ")[2:]
					hits = list()
					for term in searchTerms:
						c.execute("SELECT Id FROM Quotes WHERE Message LIKE ? OR Nick LIKE ?",("%"+term+"%","%"+term+"%"))
						results = c.fetchall()
						for result in results:
							if result[0] not in hits:
								hits.append(result[0])
					hits.sort()
					if len(hits)>0:
						quoteMessage = ""
						for quoteId in hits:
							# [0] because they're returned as tuples, eg (1,), (2,), (3,)
							quoteMessage +="#"+str(quoteId)+", "
						quoteMessage = quoteMessage[:-2]
						say(destination,"Based on your search terms, these are the quotes I've found that match!")
						say(destination,quoteMessage)
					else:
						say(destination,"I'm sorry, but I couldn't find any quotes that contained those terms :(")

			#
			if len(xChatMessage.split(" "))>1:
				secondWord = xChatMessage.split(" ")[1]
				#
				if secondWord in ["list","all"]:
					c.execute("SELECT Id FROM Quotes WHERE Channel=? ORDER BY Id DESC LIMIT 40",(channel,))
					results = c.fetchall()
					print results
					if results != []:
						quoteMessage = ""
						for quoteId in reversed(results):
							# [0] because they're returned as tuples, eg (1,), (2,), (3,)
							quoteMessage +="#"+str(quoteId[0])+", "
						quoteMessage = quoteMessage[:-2]
						say(destination, "These are id's of the last 40 quotes I have for "+channel+"! You can search for quotes with !quotes find <search>")
						say(destination, quoteMessage)
					else:
						say(destination,"You don't have any quotes for this channel :(")
				if secondWord in ["random","shuffle","rand"]:
					c.execute("SELECT Id FROM Quotes WHERE Channel=?",(channel,))
					results = c.fetchall()
					print results
					quoteId = random.choice(results)[0]
					c.execute("SELECT * FROM Quotes WHERE Id=?",(quoteId,))
					result = c.fetchone()
					timestamp = time.gmtime(float(result[1]))
					nick = result[3]
					message = '"'+result[4]+'"'
					timeStr = (str(timestamp[3]).zfill(2)+":"+str(timestamp[4]).zfill(2)+":"+str(timestamp[5]).zfill(2)+" GMT 0:00 on "
								+str(timestamp[1])+"/"+str(timestamp[2])+"/"+str(timestamp[0]))
					say(destination,"Quote #"+str(quoteId)+" was saved at "+timeStr+" by "+nick)
					say(destination,message)
			if len(xChatMessage.split(" ")) == 1:
				say(destination,"!quotes <add|list|search|show> [message/searchterms/quote id]")
		#
		#
		if firstWord == "!dice":
			if len(xChatMessageSplit) > 1:
				numSides = xChatMessageSplit[1]
				if numSides == "2":
					face = "Heads" if random.randint(0,1) == 0 else "Tails"
					say(destination,"Randomly flipping a coin: \00304"+face )
				elif numSides.isdigit():
					numSides = xChatMessageSplit[1]

					if int(numSides) <=20:
						say(destination,"Randomly rolling a "+numSides+"-sided dice: \00304"+str(random.randint(1,int(numSides))))
					else:
						say(destination,"Randomly rolling a "+format(int(numSides),",")+"-sided dice:\00304"+format(random.randint(1,int(numSides)),",")+". \0037That's more like a sphere than a dice at that point, btw.")
				elif xChatMessageSplit[1] == "help":
					say(destination,"Usage: \00304!dice [number of sides]\00307. Argument optional. Will default to 6 sides.")
				else:
					say(destination,"Sorry, the argument wasn't an integer.")
			else:
				say(destination,"Randomly rolling a 6-sided dice: \00304"+str(random.randint(1,6)))
		if firstWord == "!flip" or firstWord == "!coin":
			flippingWhat = xChatMessage.split(" ")
			if len(flippingWhat) == 1:
				flippingWhat = "coin"
			elif len(flippingWhat)>1:
				flippingWhat = " ".join(flippingWhat[1:])
			face = "Heads" if random.randint(0,1) == 0 else "Tails"
			say(destination,"Randomly flipping a "+flippingWhat+": \00304"+face )
		#
		#
		if firstWord in ["!wolfram", "!wa", "!wolframalpha", "!alpha"]:
			def getWolframAndSend(destination,url):
				r = requests.get(url)
				p = re.compile("<pod title=[\'\"](?!Input).*?[\'\"].*?<plaintext>(.*?)<\/plaintext>", re.DOTALL)
				results = p.search(r.content)
				if results == None:
					say(destination,"Oops, something went wrong! Wolfram didn't understand your input!")
				else:
					say(destination,results.group(1))
			query = "+".join([urllib.quote(string) for string in xChatMessage.split(" ")[1:]])
			appid = settings.appid
			url = "http://api.wolframalpha.com/v2/query?input="
			url += query
			url += "&"
			url += appid
			t = threading.Thread(target=getWolframAndSend,args=(destination,url))
			t.start()
		#
		if firstWord == "!g":
			url = "http://www.google.com/search?q="
			if xChatMessage.find(" ")>-1:
				words = xChatMessage.split(" ")[1:]
				for i in xrange(len(words)):
					url+=words[i]
					if i != len(words)-1:
						url+="&"
				url+="&btnI"
				print "URL: "+url
				resp = urllib2.urlopen(url)
				print resp
		#
		#
		if firstWord in ["!c", "!calc", "!calculator"]:
			class customFuncParse(object):
				def __init__(self, expr, variables):
					self.expr = expr
					self.vars = variables
					self.functions = {"fact":self.fact, 
										"factorial":self.fact,
										"rand":self.rand,
										"random":self.rand,
										"randint":self.randint,
										"choose":self.choose}
				def fact(self,n):
					return math.factorial(n)
				def rand(self):
					return random.random()
				def randint(self,x,y):
					return random.randint(x,y)
				def choose(self,x,y):
					return fact(x)/(fact(x-y)*fact(y))
				def findClosingParen(self,startIndex):
					stack = []
					expr = self.expr
					for i in xrange(len(expr[startIndex:])):
						c = expr[i+startIndex]
						if c == "(":
							stack.append("(")
						elif c == ")":
							prev = stack.pop(len(stack)-1)
							if prev != "(":
								raise Exception("Malformed expression")
						if len(stack) == 0:
							return i+startIndex
					raise Exception("Malformed expression")
				def parse2(self, expression = None):
					expr = expression
					if expr == None:
						expr = self.expr
					for funcName,funcCall in self.functions.items():
						if expr.find(funcName)>-1:
							index = expr.find(funcName)
							nextIndex = index+len(funcName)
							#endIndex = expr.find(")",nextIndex)
							endIndex = self.findClosingParen(nextIndex)
							print nextIndex, endIndex
							arg = expr[nextIndex+1:endIndex]
							print "ARG: "+str(arg)
							if funcName in ["fact", "factorial"] and expr[nextIndex] == "(":
								if arg.isdigit():
									expr = expr.replace(funcName+"("+arg+")",str(funcCall(int(arg))))
								elif arg in self.vars:
									if arg in self.vars:
										var = self.vars[arg]
										expr = expr.replace(funcName+"("+arg+")",str(funcCall(int(var))))
							if funcName in ["rand","random"]:
								if endIndex-nextIndex == 1:
									expr = expr.replace(funcName+"("+arg+")",str(funcCall()))
							if funcName in ["randint", "choose"]:
								stringArgs = arg.split(",")
								numArgs = [0,0]
								if len(stringArgs) == 2:
									for i in xrange(len(stringArgs)):
										if stringArgs[i].isdigit():
											numArgs[i] = int(stringArgs[i])
										elif stringArgs[i] in self.vars:
											numArgs[i] = int(self.vars[stringArgs[i]])
										else:
											raise Exception("Invalid input for randint")
								if funcName == "randint":
									x = min(numArgs)
									y = max(numArgs)
									expr = expr.replace(funcName+"("+arg+")",str(funcCall(x,y)))
								if funcName == "choose":
									x = numArgs[0]
									y = numArgs[1]
									fact = math.factorial
									expr = expr.replace(funcName+"("+arg+")",str(fact(x)/(fact(x-y)*fact(y))))
					if expression == None:
						self.expr = expr
					return expr

				def parse2(self, expression=None):
					expr = expression
					if expr == None:
						expr = self.expr
					for funcName,funcCall in self.functions.items():
						if expr.find(funcName)>-1:
							index = expr.find(funcName)
							nextIndex = index+len(funcName)
							#endIndex = expr.find(")",nextIndex)
							endIndex = self.findClosingParen(nextIndex)
							print nextIndex, endIndex
							arg = expr[nextIndex+1:endIndex]
							print "ARG: "+str(arg)
							if funcName in ["fact", "factorial"] and expr[nextIndex] == "(":
								if arg.isdigit():
									expr = expr.replace(funcName+"("+arg+")",str(funcCall(int(arg))))
								elif arg in self.vars:
									if arg in self.vars:
										var = self.vars[arg]
										expr = expr.replace(funcName+"("+arg+")",str(funcCall(int(var))))
							if funcName in ["rand","random"]:
								if endIndex-nextIndex == 1:
									expr = expr.replace(funcName+"("+arg+")",str(funcCall()))
							if funcName in ["randint", "choose"]:
								stringArgs = arg.split(",")
								numArgs = [0,0]
								if len(stringArgs) == 2:
									for i in xrange(len(stringArgs)):
										if stringArgs[i].isdigit():
											numArgs[i] = int(stringArgs[i])
										elif stringArgs[i] in self.vars:
											numArgs[i] = int(self.vars[stringArgs[i]])
										else:
											raise Exception("Invalid input for randint")
								if funcName == "randint":
									x = min(numArgs)
									y = max(numArgs)
									expr = expr.replace(funcName+"("+arg+")",str(funcCall(x,y)))
								if funcName == "choose":
									x = numArgs[0]
									y = numArgs[1]
									fact = math.factorial
									expr = expr.replace(funcName+"("+arg+")",str(fact(x)/(fact(x-y)*fact(y))))
					if expression == None:
						self.expr = expr
					return expr
			def choose(x,y):
				fact = math.factorial
				return fact(x)/fact(x-y)/fact(y)
			def random1(asdf):
				return random.random()
			def randint(x):
				return int(round(x*random1(0)))
			expression = " ".join(xChatMessage.split(" ")[1:])
			var = expression.split("where")
			varsToEval = dict()

			if len(var)>1:
				var = var[1].strip()
				for delimiter in [";","|"," ","&",",","and"]:
					temp = var.split(delimiter)
					for variable in temp:
						for delimiter in ["=","is","is equal to", "is = to", "equal to", "equal"]:
							split = variable.split(delimiter)
							print split
							if len(split)==2:
								varName = split[0].strip()
								val = split[1].strip()
								for varType in ["float","int"]:
									try:
										eval(varType+"(val)")
										val = eval(varType+"(val)")
									except:
										pass
								varsToEval[varName] = val
			try:
				print "XXXX"
				print expression
				#expression = customFuncParse(expression,varsToEval).parse()
				expression = expression.split("where")[0].strip()
				parser = Parser()
				parser.ops1["factorial"] = math.factorial
				parser.ops1["fact"] = math.factorial
				parser.ops1["random"] = random1
				parser.ops1["randint"] = randint
				val = parser.parse(expression)
				#print val.toString()
				#print varsToEval
				val = val.evaluate(varsToEval)
				#parser.parse2(expression)
				if len(str(val))>426:
					say(destination,"The output was too long!")
				elif type(val) == float and val.is_integer():
					say(destination,str(int(val)))
				else:
					say(destination,str(val))
			except:
				say(destination,"That probably wasn't a valid expression :(")


		#
		#
		if firstWord == "!weather":
			xChatMessageSplit.pop(0)
			info = dict()
			if len(xChatMessageSplit) == 0:
					url = "http://api.wunderground.com/api/"+weatherAPI+"/geolookup/conditions/q/15213.json"
					jsonResponse = json.loads(urllib2.urlopen(url).read())
			if len(xChatMessageSplit) == 1:
				if xChatMessageSplit[0].isdigit() and len(xChatMessageSplit[0]) == 5:
					url = "http://api.wunderground.com/api/"+weatherAPI+"/geolookup/conditions/q/"+str(xChatMessageSplit[0])+".json"
					jsonResponse = json.loads(urllib2.urlopen(url).read())
				if xChatMessageSplit[0] == "help":
					say(destination,"Usage: \00304!weather [zipcode]\00307. At the moment, only zipcodes are supported. If no zipcode is provided, it will default to weather for \00304Pittsburgh, PA\0037.")
			else:
				pass
			info = jsonResponse["current_observation"]
			location = info["display_location"]["full"]
			weather = info["weather"]
			temp = info["temperature_string"]
			feelsLike = info["feelslike_string"]
			humidity = info["relative_humidity"]
			windStrength =info["wind_string"]
			windDir = info["wind_dir"]
			visibility = info["visibility_mi"]+"mi ("+info["visibility_km"]+"km)"
			lastUpdated = info["observation_time"]
			printString = "The weather in \00304"+location+"\0037 is currently \00304"+weather+"\0037 at \00304"+temp+"\0037 which feels like \00304"+feelsLike+"\0037. "
			printString += "Humidity is at \00304"+humidity+". "
			printString += "Wind strength is expected to be \00304"+windStrength+"\0037 with visibility ranges of \00304"+visibility+"\0037. "
			printString += "This information was \00304"+lastUpdated+"\0037."
			say(destination,printString)

		#
		#
		if firstWord in ["!define","!definition","!d","!def","!dict","!dictionary"]:
			def sorted(lst):
				tmp = copy.copy(lst)
				tmp.sort()
				return tmp
			if len(xChatMessage.split(" ")) == 1:
				say(destination,"You didn't provide enough arguments! \00307!<define|def|dict|dictionary|d> <searchterm> [definition label]")
			else:
				searchWord = xChatMessage.split(" ")[1]
				if len(xChatMessage.split(" "))>2:
					searchedDef = " ".join(xChatMessage.split(" ")[2:])
				else:
					searchedDef = ""

				urlList = ["http://www.dictionaryapi.com/api/v1/references/collegiate/xml/",searchWord,"?key=",settings.merriam_dictionary_api]
				url = "".join(urlList)
				r = requests.get(url)


				if r.text != u"Invalid API key or reference name provided.":
					# Pull the first definition block. Ignore the rest since
					# they tend to be less relevent. This is just a quick search function.
					# If they want a full set of definition they can google it.
					p = re.compile("<def>.*?</def>")
					definitionText = p.search(r.text,re.DOTALL)
					#print definitionText.group(0)

					# Pull the labels (1,2a,2b,3,etc) and their corresponding definitions
					p = re.compile("<sn>(.*?)</sn>.*?<dt>(.*?)</dt>")
					labelAndDefs = p.findall(definitionText.group(0),re.DOTALL)

					# init vars
					defDict = {}
					exampleDict = {}
					lastNumLabel = None
					lastNumAndSubLabel = None

					for labelAndDef in labelAndDefs:
						label,definition = labelAndDef
						# Get various examples. These are in <vi></vi> tags.
						p = re.compile("<vi>(.*?)</vi>")
						egs = p.findall(definition)
						# Remove the examples from the text
						definition = p.sub("",definition)
						p = re.compile("<.*?>")
						definition = p.sub("",definition)
						# If def is like 4 a (1), so first def in a numbered series has sub def
						if label[0].isdigit() and "<snp>" in label:
							temp = str(re.sub("<.*?>","",label))
							label = temp
							lastNumLabel = temp[0]
							lastNumAndSubLabel = temp.split("(")[0].strip()
						# Starts with a number
						elif label[0].isdigit() and "<snp>" not in label+"1":
							lastNumLabel = label[0]
							lastNumAndSubLabel = label
						# starts with a <, so is a sub sub definition (4 a (1) etc)
						elif label[0] == "<":
							temp = re.sub("<.*?>","",label)
							label = lastNumAndSubLabel + " " + temp
						# We have a label sub definition but it has the letter and sub category, eg first sub-sub def
						elif label[0] != "<" and "<" in label:
							temp = re.sub("<.*?>","",label)
							label = lastNumLabel + " " + temp
							lastNumAndSubLabel = lastNumLabel + " " + temp[0]
						# None of the above meaning it should just be a sub definition (4 a)
						else:
							label = lastNumLabel + " " + label
							lastNumAndSubLabel = label

						defDict[label] = definition[1:]
						for eg in egs:
							eg = re.sub("<.*?>","",eg)
							if label not in exampleDict:
								exampleDict[label] = []
							exampleDict[label].append(eg)
					sortedDefLabels = sorted(list(defDict.keys()))
					# If they want the definition labels.
					if searchedDef == "defs":
						say(destination,"Definition labels: " + " | ".join(sortedDefLabels))
					else:
						if searchedDef != "" and searchedDef not in sortedDefLabels:
							say(destination,"The definition label you gave was invalid! Defaulting to first definition")
							searchedDef = sortedDefLabels[0]
						if searchedDef == "": 
							searchedDef = sortedDefLabels[0]
						say(destination,"Definition labels: Type \00304!define <word> defs \00307for a list of other definitions.")
						say(destination,"\"\00305" + searchWord.capitalize() + "\00307\" - definition #" + searchedDef + ": " + defDict[searchedDef])
						examples = " - ".join( \
											 map(lambda x: x.capitalize(), exampleDict[searchedDef])) \
											 if searchedDef in exampleDict else ""
						if examples != "":
							say(destination,"\00305Examples: \00307"+examples)
				elif "suggestion" in r.text:
					p = re.compile("<suggestion>(.*?)</suggestion>")
					suggestions = p.findall(r.text)
					say(destination,"That word didn't exist! Did you mean any of the following?")
					say(destination," | ".join(sorted(suggestions)))

				else:
					say(destination,"Error!")
					say(destination,r.text[:512])





		#
		#
		if firstWord == "!compass":
			listOfDirs = ["North", "South", "East", "West", 
							"NE", "NW", "SE", "SW", 
							"NEE", "NNE", "NNW", "NWW",
							"SEE", "SSE", "SSW", "SWW",
							"Up", "Down", "Left", "Right"]
			direc = ""
			if random.randint(1,100)>80:
				direc = random.choice(listOfDirs)
				say(destination,"Go "+direc)
			else:
				angle = random.randint(0,360)
				subAngle = random.random()
				angleStr = str(angle+subAngle)
				direc = random.choice(["diagonally", "forward", "diagonally forward", 
										 "reversed", "inversed", "upside down", "over your shoulder and to the right",
										 "inside out", "tuturuu"])
				end = random.choice(["hit a bus", "die", "end up back where you started", "find an elephant",
									 "get to the voidzone", "sink", "get burned by love", "walk off a building",
									 "tear a hole in spacetime and end up playing cards with Mecha Hitler",
									 "happen across an ancient samurai sword of lost tradition and commit sudoku"])
				string = "Go "+angleStr+" degrees "+direc+" until you "+end+"."
				say(destination,string)
		#
		#
		if firstWord == "!help":
			if len(xChatMessage.split(" ")) == 1:
				say(destination, "Just add the name of the command after \00304!help\00307 to get more info")
			if len(xChatMessage.split(" ")) >1:
				secondWord = xChatMessage.split(" ")[1].strip("!")
				if secondWord in ["c", "calculator", "calc"]:
					say(destination,"This is a smart calculator! It supports most major functions like trig, rounding(floor/round/ceil), logs, exponents, etc. You can also use variable names. Use the word 'where' in your equation to separate your eq from variables. Try typing in natural language as I account for multiple interpretations!")
					say(destination,"Eg, \00304!c (x+y-5)/t where x is 5 and y=2 and t is equal to 20")
				elif secondWord in ["dice"]:
					say(destination,"Usage: \00304!dice [number of sides]\00307. Argument optional. Will default to 6 sides.")
				elif secondWord in ["todo"]:
					say(destination,"Usage: \00304!todo <add|rem|show> <message|id>\00307 Alternatively, you can just type \00304!todo\00307 to show.")
				elif secondWord in ["wa","wolfram"]:
					say(destination,"Usage: \00304!"+secondWord+" <query>\00307 where <query> can be anything you would type into wolfram's actual site.")
				else:
					say(destination,"Remi's a lazy bum so he hasn't added a help to that yet :( Or it wasn't a valid command. You can get a commandlist with \00304!commands")
		#
		#

		if firstWord == "!lsc":
			secondWord = xChatMessage.split(" ")[1]
			delimiters = ["|","/",".","-"]
			for delimiter in delimiters: 
				if secondWord.find(delimiter)>0:
					recipe = secondWord.strip().split(delimiter)
					valid = True
					for val in recipe:
						if not val.isdigit():
							valid = False
					if valid:
						if len(recipe) == 4:
							fuel = recipe[0]
							ammo = recipe[1]
							steel = recipe[2]
							baux = recipe[3]
							say(destination,"Not quite implemented yet Teehee")
						else:
							pass#say(destination,"You can't make a recipe without all four resources!")
					else:
						pass#say(destination,"One of the arguments wasn't even a number :(")
		if firstWord == "!todo":
			def showTodos(destination,nick,page):
				if type(page) == int or page.isdigit():
					page = int(page)
					c.execute("SELECT Message,Date_Added FROM Todo WHERE Nick=? ORDER BY Date_Added ASC",(nick,))
					results = c.fetchall()
					if results != []:
						if len(results)>5:
							if page == 1:
								say(destination,"\00312Here are your first 5 Todos with Ids! Type \00304!todo show <pagenum>\00307 to view more!")
								results = results[:5]
							else:
								say(destination,"\00312Here are your Todos on the page you specified!")
								results = results[(page-1)*5:page*5]
						else:
							say(destination,"\00312Here are your current Todos with Ids!")
						for i in xrange(len(results)):
							msg ="\00304"+str(i+1+(page-1)*5)+"\00307 - "+results[i][0]
							say(destination,msg)
					else:
						say(destination,"You don't seem to have any Todos under your current nick!")

			####
			nick = xChatNick.split("|")[0]
			split = xChatMessage.split(" ")
			if len(split)>1:
				secondWord = split[1]
				if secondWord == "add":
					if len(split)>2:
						message = " ".join(split[2:])
						# c.execute("INSERT INTO Quotes VALUES (?,?,?,?,?)", (currId,timestamp,channel,nick,message))
						c.execute("INSERT INTO Todo VALUES (?,?,?)", (str(time.time()),nick,message))
						say(destination,"Okay! I've added that to your todo list!")
						conn.commit()
					else:
						say(destination,"You need to tell me what to add as your todo!")
				if secondWord in ["show","list"]:
					if len(split)>2:
						page = split[2]
						if page.isdigit():
							showTodos(destination,nick,int(page))
						else:
							say(destination,"Oops, that page number wasn't a valid number!")
					else:
						showTodos(destination,nick,1)
				if secondWord in ["delete","remove","rem","del"]:
					if len(split)>2:
						deleteId = split[2]
						if deleteId.isdigit():
							deleteId = int(deleteId)
							c.execute("SELECT Date_Added from Todo WHERE Nick=? ORDER BY Date_Added ASC", (nick,))
							results = c.fetchall()
							if deleteId>0 and deleteId<=len(results):
								timeToDelete = results[deleteId-1][0]
								c.execute("DELETE FROM Todo WHERE Date_Added=? AND Nick=?",(timeToDelete,nick))
								conn.commit()
								say(destination,"Okay, I've deleted your todo with that Id!")
							else:
								say(destination,"The provided id isn't valid!")

						else:
							say(destination,"The provided id wasn't a valid number!")
					else:
						say(destination,"You need to tell me which todo to delete!")
			else:
				showTodos(destination,nick,1)

		#
		#
		if firstWord in ["!tell","!later"]:
			if len(xChatMessage.split(" "))>2:

				fromNick = xChatNickFull
				split = xChatMessage.split(" ")
				toNick = split[1].lower()
				message = " ".join(split[2:])
				timeEntered = str(time.time())
				c.execute("INSERT INTO Laters VALUES (?,?,?,?,?)",(fromNick,toNick,timeEntered,message,str(destination.get_info("channel"))))
				conn.commit()
				say(destination,"Alright! I'll tell \00304"+toNick+" \00307your message next time I see them active or join the channel!")
			else:
				say(destination,"You didn't provide enough arguments! \00304!<later|tell> <destination nick> <message>")

		#	
		#
		if firstWord in ["!remind","!reminder"]:
			def parseTime(string):
				params = dict()
				p = re.compile("(\d+?)([a-zA-Z])")
				results = p.findall(string)
				for result in results:
					if result[-1] not in "smhdw":
						return None
					params[result[-1]] = result[:-1][0]
				return params if results != [] else None
			def convertTime(timeDict):
				secs = 0
				for tVal,value in timeDict.items():
					value = int(value)
					if tVal == "s":
						secs += value
					elif tVal == "m":
						secs += value * 60
					elif tVal == "h":
						secs += value * 60 * 60
					elif tVal == "d":
						secs += value * 60 * 60 * 24
					elif tVal == "w":
						secs += value * 60 * 60 * 24 * 7
				return time.localtime(time.time() + secs)

			split = xChatMessage.split(" ")
			if len(split)>3:
				toNick = split[1]
				if toNick == "me":
					toNick = sanitizeNick(xChatNick)
				timeArg = parseTime(split[2])
				msg = " ".join(split[3:])
				if timeArg == None:
					say(destination,"Your time argument was formatted incorrectly! Please enter it in the format of \00304\"15s30m2h1d6w\"\00307, or 15 seconds, 30 minutes, 2 hours, 1 day, 6 weeks. No spaces.")
				else:
					fromNick = xChatNickFull
					timeToRemind = convertTime(timeArg)
					currTime = time.time()
					c.execute("INSERT INTO Reminders (FromNick,ToNick,ReminderDate,DateAdded,Message) VALUES (?,?,?,?,?)",
									  (str(fromNick),str(toNick),float(time.mktime(timeToRemind)),float(currTime),str(msg)))
					remindee = "you" if fromNick.split("|")[0].lower() == toNick.lower() else toNick
					say(destination,"Alright! I'll remind \00304"+remindee+" \00307about that on \00304"+time.strftime("%a, %d %b %Y %H:%M:%S +0000",timeToRemind))
					highestID = c.lastrowid
					say(destination, "If you want to delete that reminder, use the command  \00304!reminder del \00305"+str(highestID))
					conn.commit()
			elif len(split)==3:
				if split[1] in ["del","delete","rem","remove"]:
					if split[2].isdigit():
						c.execute("SELECT * FROM Reminders WHERE ID = ?",(int(split[2]),))
						result = c.fetchall()

						fromNick = result[0][0].split(" ")[0].lower()
						toNick = result[0][1].lower()
						currNick = xChatNick.lower()

						if result == []:
							say(destination,"A reminder with that ID didn't exist!")
						elif not (currNick != fromNick and currNick != toNick):
							say(destination,"You can't delete a reminder that you didn't set or are set to receive!")
						else:
							c.execute("DELETE FROM Reminder WHERE ID = ?",(int(split[2]),))
							conn.commit()
							say(destination,"Reminder with that ID deleted!")

			else:
				say(destination,"You didn't provide enough arguments! \00304!<remind|reminder> <me|nick> <time(eg 30m2h4d2w no space)> <message>")

		#
		#
		if firstWord in ["!commands", "!command"]:
			commands = ["ver", "settopic\0037 or \0034!topic","!define\0037 or \0034!d","flip","compass","calc\0037 (or just \0034!c\0037)","help","info","dice","weather", "herald","quotes","todo","ping","wolfram\0037 (or \0034!wa\0037)"]
			if isCaptions: commands.extend(["mecab", "quack"])
			commands.sort()
			fullString = ""
			isFirst = True
			for command in commands:
				if not isFirst:
					fullString += "\0037, "
				fullString += "\0034!"+command
				isFirst = False
			say(destination,"The following are our commands: "+fullString)
			say(destination,"You can also prepend % to a message to talk to Amatsukaze! A conversation will last for 60 seconds from the last message before a new one is started. Try it out! Type \"%Hi!\"")
	#
	#	
	if xChatMessage[0] == "%":
		if channel not in ["#kancollewiki", "#kancolle"]:
			def thinker (destination, sessionToUse, xChatMessage):
				message = sessionToUse["session"].think(xChatMessage[1:])
				say(destination,sessionToUse["name"]+": "+message)
				sessionToUse["lastSpoke"] = time.time()
			def thinkerNew (destination, data, xChatMessage, sessions):
				data["session"] = bot.create_session()
				message = data["session"].think(xChatMessage[1:])
				say(destination,data["name"]+": "+message)
				sessions.append(data)
			data = {"name":xChatNick, "lastSpoke":time.time(),"session": None}
			sessionToUse = None
			toBotTL = {"amatsukaze":"cleverbot","ama-chan":"cleverbot","amatsu":"cleverbot"}
			for word,tl in toBotTL.items():
				xChatMessage = xChatMessage.lower().replace(word,tl)
			xChatMessage.capitalize()
			for session in sessions:
				if session["name"] == xChatNick:
					sessionToUse = session
					break
			if sessionToUse != None:
				if time.time() - sessionToUse["lastSpoke"] >60:
					t = threading.Thread(target=thinker, args=(destination, sessionToUse, xChatMessage))
					t.start()
				else:
					sessionToUse = None
			if sessionToUse == None:
				t = threading.Thread(target=thinkerNew, args=(destination, data, xChatMessage, sessions))
				t.start()
		else:
			say(destination,"If you want to talk to me, you'll have to come over to \00304#amatsukaze\00307! Just remember that I'm married to Remi.")




				
def on_trigger_PM(word, word_eol, userdata) :
	xChatNick = word[0]
	destination = xchat.get_context()
	testForStatus = xChatNick.split("|")
	xChatNick = testForStatus[0]
	xChatMessage = word[1]
	xChatMessageSplit = xChatMessage.split(" ")
	xChatNickFull = word[0]
	pass

def on_trigger(word,word_eol,userdata):
	global HOOK
	checkForBotNick()
	destination = xchat.get_context()
	activeChannels = ["#captions", "#kancollewiki", "#asdf","#kancolle", "#amatsukaze","#kcad"]
	activeNetworks = ["Slack", "EsperNet", "EsperNet (Bot)"]
	blacklistChannels = []
	activeNicks = ["captionsbot","amatsukaze"]
	bypass = (xchat.get_info("network") == "Slack")
	channel = destination.get_info("channel").lower()
	if xchat.get_info("network") in activeNetworks or bypass:
		if channel in activeChannels or (bypass and channel not in blacklistChannels):
			if destination.get_info("nick").lower() in activeNicks:
				if HOOK == None:
					HOOK = xchat.get_context()
					HOOK.command("msg remi_scarlet HOOK acquired")
				###### WARNING ######
				# JUST MODIFY THE
				# ON_TRIGGER_CONTENT FUNCTION
				#######################
				on_trigger_content(word, word_eol, userdata, destination)
				checkForLaters(word[0].split("|")[0].lower(),destination)

def on_invite(word, word_eol, userdata):
	pass


def on_join_content(word, word_eol, userdata, destination):
	xChatNick = word[0].split("|")[0].lower()
	xChatMessage = word[1]
	xChatNickFull = word[0]
	c.execute('SELECT * FROM heralds WHERE Nick = ?', (xChatNick,))#check
	result = c.fetchone()
	if result != None:
		say(destination, result[1])
	checkForLaters(xChatNick,destination)

def on_nick_join(word, word_eol, userdata):
	global HOOK
	destination = xchat.get_context()
	activeChannels = ["#captions", "#kancollewiki", "#asdf","#kancolle", "#amatsukaze","#kcad"]
	activeNetworks = ["Slack", "EsperNet", "EsperNet (Bot)"]
	blacklistChannels = []
	activeNicks = ["captionsbot","amatsukaze"]
	bypass = (xchat.get_info("network") == "Slack")
	channel = destination.get_info("channel").lower()
	if xchat.get_info("network") in activeNetworks or bypass:
		if channel in activeChannels or (bypass and channel not in blacklistChannels):
			if destination.get_info("nick").lower() in activeNicks:
				if HOOK == None:
					HOOK = xchat.get_context()
					HOOK.command("msg remi_scarlet HOOK acquired")

				###### WARNING ######
				# JUST MODIFY THE
				# ON_TRIGGER_CONTENT FUNCTION
				#######################
				on_join_content(word, word_eol, userdata, destination)

xchat.hook_print("Channel Message", on_trigger); #non-highlight words CONTAINING "loli"
xchat.hook_print("Channel Msg Hilight", on_trigger); #highlight words that contain "loli" (in other words, loli and lolis
xchat.hook_print("Private Message to Dialog", on_trigger_PM);
xchat.hook_print("Invited", on_invite);
xchat.hook_print("Join", on_nick_join);

def checkForLaters(xChatNick,destination):
	c.execute("SELECT ToNick FROM Laters ")
	nicksToLater = c.fetchall()
	for nick in nicksToLater:
		if xChatNick.lower() == nick[0].lower():
			c.execute("SELECT * FROM Laters WHERE ToNick = ?",(xChatNick.lower(),))
			messages = c.fetchall()
			for message in messages:
				fromNick = message[0]
				toNick = message[1]
				timeEntered = float(message[2])
				msg = message[3]
				channel = message[4]

				xchat.get_context().command("msg "+toNick+" \00304"+fromNick+" \00307sent you a message in \00304" + channel + "\00307 on \00304"+time.strftime("%a, %d %b %Y %H:%M:%S +0000",time.gmtime(timeEntered)))
				xchat.get_context().command("msg "+toNick+" \00307"+msg)
			c.execute("DELETE FROM Laters WHERE ToNick = ?",(xChatNick.lower(),))
			conn.commit()

def sanitizeNick(nick):
	return nick.split("|")[0].lower()


def checkForReminders(userdata):
	global HOOK

	if HOOK != None:
		destination = HOOK
		c.execute("SELECT * FROM Reminders ORDER BY ReminderDate ASC")
		results = c.fetchall()
		currTime = time.time()
		activeNicks = ["amatsukaze","amatsukaze|bot"]
		destination.command("")
		if destination.get_info("nick").lower() in activeNicks:
			for data in results:
				remindTime = float(data[2])
				if currTime>remindTime:
					fromNick = data[0]
					toNick = data[1]
					dateAdded = float(data[3])
					msg = data[4]
					ID = data[5]
					you = "yourself" if fromNick == "You" else "you"
					c.execute("DELETE FROM Reminders WHERE ID=?",(ID,))
					conn.commit()
					destination.command("msg "+toNick+ " \00304" + fromNick + " \00307set a reminder for " + you + " on \00304"+time.strftime("%a, %d %b %Y %H:%M:%S ",time.gmtime(dateAdded)))
					destination.command("msg "+toNick+ " \00307" + msg)
					#remind
					pass
				else:
					break
	return 1

HOOK = None
HOOK_OBJ = xchat.hook_timer(5000,checkForReminders) #Call every 5 seconds

def checkForBotNick():
	nick = xchat.get_info("nick")
	if "amatsukaze" in nick.lower():
		if nick.lower() != "amatsukaze":
			xchat.get_context().command("nick Amatsukaze")

print "\0034",__module_name__, __module_version__,"has been loaded\003"

