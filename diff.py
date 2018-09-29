import re
def doOneFile(file):
 theF = open(file,"r");
 listF="===="+file+"====="
 print(listF);
 for line in theF:
     buf = line.rstrip()
     p=re.search('(.*?)(chr.*?)\.(.*?)\.(.*?)\ -(.*)', buf,re.IGNORECASE)
     if p:
       fName = p.group(2)+"."+p.group(3)+"."+p.group(4)
       srcLine= p.group(2)+"."+p.group(3)
       for key in srcF:
         p2=re.search('^(.*?)\.(.*?)\.(.*)',key,re.IGNORECASE);
         if p2:
           theKey =p2.group(1)+"."+p2.group(2);
           if (theKey == srcLine): 
             print("==>"+fName);
srcF =[]
src = "key.txt"  
index = 0
file = open(src,"r")
for line in file:
  buf = line.rstrip()
  p = re.search('(chr.*)', buf,re.IGNORECASE)
  if p:
    srcF.append(p.group(1))
file.close()

flist = "list.txt";
flistH = open(flist,"r")
for line in flistH:
  buf = line.rstrip()
  doOneFile(buf)
flistH.close()




