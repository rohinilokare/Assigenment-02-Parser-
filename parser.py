import re
print("hello")
print("****************** Language Identification Parser***********************")
print("******************java******************")
fname1 = "/home/rohini/Documents/treeni/hellojava.txt"
fname2 = "/home/rohini/Documents/treeni/helloPHP.txt"
fname3 = "/home/rohini/Documents/treeni/helloJavaScript.txt"
fname4 = "/home/rohini/Documents/treeni/helloRuby.txt"

#file=[fname1,fname2,fname3,fname4]
file=[fname1]
javapatterns = ['public\sclass\s\w*\s\{[^*]+\}',
'public\sstatic\svoid\smain\(\String\[\]\s\args\)\s{[^*]+\}',
'System.out.println\(\"[^*]+\"\)\;',
'System.out.print\(\"[^*]+\"\)\;',
'class',
'public',
'private',
'protected',
'default']

rubypatterns = [
]

phppatterns = [
]

javascriptpatterns = []


def checkLine(line):


	if java = re.findall()
	#print (line)
	if line in javapatterns:
		for i in javapatterns:
			java = re.findall(i, line)
		#print java
			if java:
				print("languageis java")

	elif  line in rubypatterns:
		for i in rubypatterns:
			ruby = re.findall(i, line)
		#print java
			if ruby:
				print("languageis ruby")

	elif line in javascriptpatterns:
		for i in javascriptpatterns:
			javascript = re.findall(i, line)
		#print java
			if javascript:
				print("languageis javascript")

	elif line in phppatterns:
		for i in phppatterns:
			php = re.findall(i, line)
		#print java
			if php:
				print("languageis is PHP")


for i in file:
	print("file is :  ",i)
	with open(i) as f:
		for line in f:
			#print line
			checkLine(line)
