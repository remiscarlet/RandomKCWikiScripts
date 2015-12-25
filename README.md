# RandomKCWikiScripts
Scripts and webserver for en.kancollewiki.net for the purpose of scraping resources and information from the kantai collection game in an automated way to aid in the updating of the kancollewiki.

## Important directories (That you probably care about)
* JSON Data and analysis: ```api decoding/```
* Python scripts: ```kcwiki-web/kcwiki/Python Scripts/``` <- This is probably what you care about the most
* NodeJS stuff: ```kcwiki-web/nodeShit/```
* MediaWiki Lua scripts: ```lua scripts (mw scribunto)/```

There are separate readme's for most major directories so further information can be found in there.

##IMPORTANT NOTE
If you want any of the python shit to work, you're going to have to add a .pth file that leads to this root folder. If you fail to do so this shit will not work because of imports and relative pathing. To find out how to add a .pth file to this directory, please read [This Link](https://docs.python.org/2/library/site.html).

I personally have my file located at ```/Library/Python/2.7/site-packages/kcwiki.pth```

For those who want a dump of what resources my scripts gather so far, [Click This Link](https://mega.nz/#F!V0E0SAQL!zE7O2yTspljIdjs_AoRVxw)(Last updated 12/25/15). Obviously these scripts are a work in process and I plan on pulling a lot more resources.

##Credit
Everything here is written by Remi_Scarlet, aka Yuto Takamoto except for the Django webserver default files.

##Copyright
Please no stealerino kthx. GNU GPL license kthx.