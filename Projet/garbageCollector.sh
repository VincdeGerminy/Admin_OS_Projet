#!/usr/bin/env python

import json
import os
import datetime

date_curr=datetime.datetime.now()
mdy=str(date_curr.month)+"/"+str(date_curr.day)+"/"+str(date_curr.year)
mdy_v2="0"+str(date_curr.month)+"/0"+str(date_curr.day)+"/"+str(date_curr.year) # cas ou format:0x/0y/xxxx
mdy_v3="0"+str(date_curr.month)+"/"+str(date_curr.day)+"/"+str(date_curr.year) # cas ou format:0x/y/xxxx
mdy_v4=str(date_curr.month)+"/0"+str(date_curr.day)+"/"+str(date_curr.year) # cas ou format:x/0y/xxxx
l=os.listdir('./data')
for i in l:
	f = open('./data/'+i,'r')
	f_new=open('./data/new_'+i,'a+')
	for line in f.readlines():
		x=json.loads(line)
		date=x["date"]
		
		if date == mdy or date == mdy_v2 or date == mdy_v3 or date == mdy_v4 :
			f_new.write(line)			
	os.system('mv ./data/new_'+i+' ./data/'+i)
			
