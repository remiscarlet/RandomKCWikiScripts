##
## Literally just put the description you want on everything below.
## Run by opening up javascript console on your web browser and pasting the printed text in.
## On chrome it's under "More Tools", "Javascript Console"
##
description = """

Kiyoshimo Hourly Lines

"""
javascript = ""
for i in xrange(1,51):
	javascript +="$(\"[name=description"+str(i)+"]\").val(\""+description.strip()+"\");"

print javascript