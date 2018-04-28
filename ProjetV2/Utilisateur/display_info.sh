#!/usr/bin/env python

import json
import os

os.system('echo "System Info:"')
def most_recent(type,arg):
	f = open('./data/'+type+'.json','r')
	f_lines=f.readlines();
	last_line=f_lines[len(f_lines)-1]
	d=json.loads(last_line)
	info=d[arg]
	return str(info)
	#os.system('echo '+arg+':'+str(cpu))

if (os.path.exists("./data/cpu.json")):
	os.system('echo Cpu: cpuUsage:'+most_recent("cpu","cpuUsage"))	
if (os.path.exists("./data/disk.json")):		
	os.system('echo Disk: diskUsagePercent:'+most_recent("disk","diskUsagePercent"))	
if (os.path.exists("./data/nb-users.json")):
	os.system('echo NbUsers:'+most_recent("nb-users","nbusers"))
if (os.path.exists("./data/ram.json")):	
	os.system('echo RAM: percent:'+most_recent("ram","percent"))
if (os.path.exists("./data/temp.json")):	
	os.system('echo Temperature: actuelle:'+most_recent("temp","actuelle"))
else :
	os.system('echo "No data"')
