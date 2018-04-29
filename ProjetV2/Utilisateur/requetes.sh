#!/usr/bin/env python

import json
import os
import requests

l=os.listdir('./data')
for i in l:
	if i == "cpu.json" or "ram.json" or "temp.json" or "disk.json" or "nb-users.json":
		pos=len(i-4)
		name=i[0:pos]
		f = open('./data/'+i,'r')
		for line in f.readlines():
			x=json.loads(line)
			req=requests.post("http://localhost/Supervise/name.php", data=x)	
		f.close()	
