thing = '$("[name=description1]").val("asdf")'

description = """

Kiyoshimo Hourly Lines

"""
javascript = ""
for i in xrange(1,51):
	javascript +="$(\"[name=description"+str(i)+"]\").val(\""+description.strip()+"\");"

print javascript