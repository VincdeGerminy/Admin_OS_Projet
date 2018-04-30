#!/usr/bin/env python

import json
import os

os.system('echo "System Info:"')
	
def most_recent(type,arg,host):
	f = open('./data/'+type+'.json','r')
	f_lines=f.readlines()
	f.close()
	f_lines.reverse()
	#last_line=f_lines[len(f_lines)-1]
	for line in f_lines:
		d=json.loads(line)
		info=d[arg]
		h=d["host"]
		if (h==host):
			return str(info)
	return None
	#os.system('echo '+arg+':'+str(cpu))
	
hList=[]
l=os.listdir('./data')
for i in l:
	if (i == "cpu.json") or (i=="temp.json") or (i=="ram.json") or (i=="nb-users.json") or (i=="disk.json"):
		file='./data/'+i
		f=open(file, 'r')
		for line in f.readlines():
			x=json.loads(line)
			host=x["host"]
			if host not in hList:
				hList.append(host)
		f.close()	

for i in hList:	
	os.system('echo info host='+i+':')
	if (os.path.exists("./data/cpu.json")):
		if(most_recent("cpu","cpuUsage",i) is None):
			os.system('echo Cpu: no data')
		else:
			os.system('echo Cpu: cpuUsage:'+most_recent("cpu","cpuUsage",i))	
	if (os.path.exists("./data/disk.json")):
		if(most_recent("disk","diskUsagePercent",i) is None):
			os.system('echo Disk: no data')
		else:		
			os.system('echo Disk: diskUsagePercent:'+most_recent("disk","diskUsagePercent",i))	
	if (os.path.exists("./data/nb-users.json")):
		if(most_recent("nb-users","nbusers",i) is None):
			os.system('echo NbUsers: no data')
		else:
			os.system('echo NbUsers: '+most_recent("nb-users","nbusers",i))
	if (os.path.exists("./data/ram.json")):	
		if(most_recent("ram","percent",i) is None):
			os.system('echo RAM: no data')
		else:
			os.system('echo RAM: percent:'+most_recent("ram","percent",i))
	if (os.path.exists("./data/temp.json")):
		if(most_recent("temp","actuelle",i) is None):
			os.system('echo Temperature: no data')
		else:	
			os.system('echo Temperature: actuelle:'+most_recent("temp","actuelle",i))
	else :
		os.system('echo "No data"')
