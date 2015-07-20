def upperFirst(string):
  c = string[0]
  lst = list(string)
  lst[0] = c.upper()
  return "".join(lst)

print upperFirst("asDf")