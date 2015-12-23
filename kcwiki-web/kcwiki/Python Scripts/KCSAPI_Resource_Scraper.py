# -*- coding: UTF-8 -*-
import cfscrape
import json
import requests
'''http://125.6.187.253/kcsapi/
 3044e4c80b2f59d028baedf0017a6c2ba
 kcsapi/api_start2
 POST'''

baseURL = "http://125.6.187.253/"
api_start = "kcsapi/api_start2"
sound_url = "ksc/sound/kc+[SHIPFNAME]/[NUMBERS].mp3"

payload = {
	"api_token":"3044e4c80b2f59d028baedf0017a6c2ba",
	"api_verno":"1"
}
headers = {
	"content-type":"application/x-www-form-urlencoded",
	"User-Agent":"Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36"
}

url = baseURL + api_start

scraper = cfscrape.create_scraper()
r = scraper.post(url, data=payload, headers=headers)
text = 'svdata={"api_result":100,"api_result_msg":"\u7533\u3057\u8a33\u3042\u308a\u307e\u305b\u3093\u304c\u30d6\u30e9\u30a6\u30b6\u3092\u518d\u8d77\u52d5\u3057\u518d\u30ed\u30b0\u30a4\u30f3\u3057\u3066\u304f\u3060\u3055\u3044\u3002"}'
text2 = 'svdata={"api_result":100,"api_result_msg":"\u7533\u3057\u8a33\u3042\u308a\u307e\u305b\u3093\u304c\u30d6\u30e9\u30a6\u30b6\u3092\u518d\u8d77\u52d5\u3057\u518d\u30ed\u30b0\u30a4\u30f3\u3057\u3066\u304f\u3060\u3055\u3044\u3002"}'
print text2.decode("unicode-escape").encode("utf-8")
print r.text.decode("unicode-escape").encode("utf-8")
print r.url
print r.cookies.__dict__

























