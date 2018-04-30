#!/usr/bin/env python

import json
import os
import sys

def detect(type,arg,limite):
	f = open('./data/'+type+'.json','r')
	f_new=open('./data/alerte_'+type+'.json','a+')
	for line in f.readlines():
		d=json.loads(line)
		info=d[arg]
		if (info >= limite):
			f_new.write(line)

#Recuperation des seuils:
f=open("../config/serveur.json", 'r')
for line in f.readlines():
	x=json.loads(line)
	cpuSeuil=x["cpuSeuil"]
	tempSeuil=x["tempSeuil"]
	diskSeuil=x["diskSeuil"]
	ramSeuil=x["ramSeuil"]
f.close()

detect("cpu","cpuUsage",cpuSeuil)
detect("disk","diskUsagePercent",diskSeuil)
detect("ram","percent",ramSeuil)
detect("temp","actuelle",tempSeuil)

./mail.sh
