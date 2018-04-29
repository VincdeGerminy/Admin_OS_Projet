#!/usr/bin/env python

import json
import os
import requests

#Recuperation de l'adresse du serveur
f=open("../config/user.json", 'r')
for line in f.readlines():
	x=json.loads(line)
	add=x["addServ"]
f.close()

l=os.listdir('./data')
for i in l:
	if i == "cpu.json" or "ram.json" or "temp.json" or "disk.json" or "nb-users.json":
		pos=len(i)-5
		name=i[0:pos]
		#print(name)
		f = open('./data/'+i,'r')
		for line in f.readlines():
			x=json.loads(line)
			#req=requests.post("http://localhost/Supervise/webService/"+name+".php", data=x)
			req=requests.post("http://"+add+"/webService/"+name+".php", data=x)
			#print(req.text)
		f.close()
os.system('rm ./data/*.json')