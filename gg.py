srcF =[]
src = "key.txt"  
index = 0
file = open(src,"r")
for line in file:
  buf = line.rstrip()
  srcF.append(buf)
  index=index+1
  print(buf)
file.close()


