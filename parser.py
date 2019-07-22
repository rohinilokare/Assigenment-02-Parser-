
import re
print("hello")
print("****************** Language Identification Parser***********************")

fname1 = "hellojava.txt"
fname2 = "hellophp.txt"
fname3 = "hellojavascript.txt"
fname4 = "helloruby.txt"

file=[fname1,fname2,fname3,fname4]
#file=[fname1]
javapatterns = ['public\sclass\s\w*\s\{[^*]+\}',
'public\sstatic\svoid\smain\(\String\[\]\s\args\)\s{[^*]+\}',
'System.out.println\(\"[^*]+\"\)\;',
'System.out.print\(\"[^*]+\"\)\;',
'class',
'public',
'private',
'protected',
'default']

rubypatterns = ['puts','def\s\w*\s\:']

phppatterns = ['<\?php','?>']

javascriptpatterns = ['<!DOCTYPE','<html>','<button\s\=\w*']

def checkLine(line):
	java = re.findall("public\sclass\s\w*\s\{[^*]+\} | public\sstatic\svoid\smain\(\String\[\]\s\args\)\s{[^*]+\} | System.out.println\(\"[^*]+\"\)\; | class | public | private | protected | default | String | Scanner",line)
	php = re.findall("<\?php | ?>", line)
	ruby = re.findall("puts | require | WEBrick",line)
	javascript = re.findall("<!DOCTYPE",line)

	if java:
		print ("langauage of line in a file is java")
	elif php:
		print ("language of line in a file is PHP")
	elif javascript:
		print("language of a line in a file is java script")
	elif ruby:
		print("language of a line in a file is ruby")
	else:
		print ("no language found")


for i in file:
	print("****************************************")
	print("file is :  ",i)
	with open(i) as f:
		for line in f:
			#print line
			checkLine(line)
