#!/usr/bin/env python

import json
import os
import smtplib
import sys

def detect(type,arg,limite):
	f = open('./data/'+type+'.json','r')
	f_new=open('./data/alerte_'+type+'.json','a+')
	for line in f.readlines():
		d=json.loads(line)
		info=d[arg]
		if (info >= limite):
			f_new.write(line)	

detect("cpu","cpuUsage",100)
detect("disk","diskUsagePercent",90)
detect("ram","percent",100)
detect("temp","actuelle",90)
