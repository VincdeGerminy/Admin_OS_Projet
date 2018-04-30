#!/usr/bin/env python

import os

f=open('../data/alertWeb.json', 'r')
f2=open('../data/alertWeb2.json', 'w+')
info=""
count=0
for line in f.readlines():
	f2.write(line.replace('\n', ""))
	if(count % 2!=0 and count!=0):
			f2.write("\n")
	count=count+1
f.close()
f2.close()

os.system('mv ../data/alertWeb2.json ../data/alertWeb.json')
			
