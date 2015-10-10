import xchat
import json
import re
import threading
import HTMLParser
import sys
sys.path.insert(0,'G:\\Dropbox\\YutoProgramming\\RandomKCWikiScripts\\amatsubot')

from tweepy import Stream
from tweepy import OAuthHandler
from tweepy.streaming import StreamListener
import Amatsubot_Settings as settings


ckey = settings.ckey
csecret = settings.csecret
atoken = settings.atoken
asecret = settings.asecret

def say(destination,msg):
	if type(msg) == unicode:
		thing = (u"say \00307"+msg).replace(u"\/",u"/").encode('utf-8')
	else:
		thing = ("say \00307"+msg).replace("\/","/")
	destination.command(thing)

class listener(StreamListener):
	def __init__(self):
		self.destinations = []
		channels = ["#asdf","#kancollewiki"]
		for channel in channels:
			dest = xchat.find_context(channel=channel) 
			#dest = None
			print dest
			self.destinations.append(dest)



	def on_data(self, data):
		h = HTMLParser.HTMLParser()
		#say(xchat.get_context(),"Test2")
		#print data.encode("utf-8")
		time = u""
		name = u""
		text = u""
		try:
			data = json.load(data, encoding="utf-8")
			time = unicode(data["created_at"])
			name = unicode(data["user"]["screen_name"])
			text = unicode(data["text"]).split(u"\n")
		except:
			try: 
				#This is pretty disgusting.
				time = u":".join(re.findall(u'"created_at":".+?"',unicode(h.unescape(data)))[0].split(u":")[1:])[1:-1].decode("unicode-escape").encode("utf-8")
				name = u":".join(re.findall(u'"screen_name":".+?"',unicode(h.unescape(data)))[0].split(u":")[1:])[1:-1].decode("unicode-escape").encode("utf-8")
				text = u":".join(re.findall(u'"text":".+?"',unicode(h.unescape(data)))[0].split(u":")[1:])[1:-1].decode("unicode-escape").encode("utf-8").split("\n")
				
			except:
				print "BACKUP FAILED FUCK"
		if text[0].find("@KanColle_STAFF")==-1 and text[0].find("@kancolle_staff")==-1:
			try:
				for dest in self.destinations:	
					# print "a"
					# print "TEST"
					# print (unicode(time,"utf-8")+u" "+unicode(name,"utf-8")+u" "+unicode(text,"utf-8")).encode("utf-8")
					print repr(text)
					if len(text)>0:
						say(dest,(u"\00304Twitter Update! \00312"+unicode(name,"utf-8")+u" \00307said at \00312"+unicode(time,"utf-8")+u"\00307: \00313"+unicode(text[0],"utf-8")).encode("utf-8"))
						if len(text)>1:
							for line in text[1:]:
								say(dest,(u"\00313"+unicode(line,"utf-8")).encode("utf-8"))
			except:
				print repr(text)
				print "WTF"
		return True

	def on_error(self, status):
		print status
def listenFunc():
	while True:
		try:
			auth = OAuthHandler(ckey, csecret)
			auth.set_access_token(atoken, asecret)
			twitterStream = Stream(auth, listener())
			#twitterStream.filter(track=["python"])
			twitterStream.filter(follow=["294025417"],async=True)
		except Exception as e:
			print e



LISTEN = threading.Thread(target=listenFunc)
LISTEN.start()