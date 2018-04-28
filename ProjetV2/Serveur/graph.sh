#!/usr/bin/env python

import json
import os
from datetime import datetime
import pygal
import sys


"""
	Fonction retournant la liste des host dont les resultats des sondes ont ete recuperes
"""
def hostList():
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
	return hList

"""
	Fonction creant 1 graphe par host
	contenant l'utilisation du CPU en %, en fonction de la date
"""
def cpu(file, hList):
	for host in hList:
		f=open(file, 'r')
		dateL= []
		cpuUsage=[]
		for line in f.readlines():
			x=json.loads(line)
			xHost=x["host"]
			if host==xHost:
				date=x["date"]+" - "+x["heure"]
				dateL.append(date)
				cpuUsage.append(x["cpuUsage"])
		if len(dateL)!=0:
			graph=pygal.StackedLine(fill=True)
			graph.title="host: "+host+" \nUtilisation du cpu en %"
			graph.x_labels=dateL
			graph.add('cpu usage (%)', cpuUsage)
			graph.render_to_file("cpuUsage_"+host+".svg")
		f.close()

"""
	Fonction creant 1 graphe par host
	contenant la temperature en degre celsius en fonction du temps
"""
def temp(file, hList):
	for host in hList:
		f=open(file, 'r')
		dateL=[]
		curent=[]
		critique=[]
		for line in f.readlines():
			x=json.loads(line)
			xHost=x["host"]
			if host==xHost:
				date=x["date"]+" - "+x["heure"]
				dateL.append(date)
				curent.append(x["actuelle"])
				critique.append(x["critique"])
		if len(dateL)!=0:
			graph=pygal.Line()
			graph.title="host: "+host+" \nTemperatures en degre celsius"
			graph.x_labels=dateL
			graph.add('Temperature actuelle (deg c)', curent)
			graph.add('Temperature critique (deg c)', critique)
			graph.render_to_file("temp_"+host+".svg")
		f.close()

"""
	Fonction creant 1 graphe par host
	contenant l'utilisation de la RAM en %, en fonction de la date
"""
def ram(file, hList):
	for host in hList:
		f=open(file, 'r')
		dateL=[]
		percent=[]
		for line in f.readlines():
			x=json.loads(line)
			xHost=x["host"]
			if host==xHost:
				date=x["date"]+" - "+x["heure"]
				dateL.append(date)
				percent.append(x['percent'])
		if len(dateL)!=0:
			graph=pygal.StackedLine(fill=True)
			graph.title="host: "+host+" \nUtilisation de la RAM en %"
			graph.x_labels=dateL
			graph.add('utilisation de la RAM (%)', percent)
			graph.render_to_file("ram_"+host+".svg")
		f.close()

"""
	Fonction creant 1 graphe par host
	contenant le nombre d'utilisateurs, en fonction de la date
"""
def nbUsers(file, hList):
	for host in hList:
		f=open(file, 'r')
		dateL=[]
		nbUser=[]
		for line in f.readlines():
			x=json.loads(line)
			xHost=x["host"]
			if host==xHost:
				date=x["date"]+" - "+x["heure"]
				dateL.append(date)
				nbUser.append(x["nbusers"])
		if len(dateL)!=0:
			graph=pygal.StackedLine(fill=True)
			graph.title="host: "+host+" \nNombre d'utilisateurs"
			graph.x_labels=dateL
			graph.add("Nombre d'utilisateurs", nbUser)
			graph.render_to_file("nb-users_"+host+".svg")
		f.close()

"""
	Fonction creant 1 graphe par host
	contenant l'utilisation des disques en %, en fonction de la date
"""
def disk(file, hList):
	for host in hList:
		f=open(file, 'r')
		dateL=[]
		disk=[]
		for line in f.readlines():
			x=json.loads(line)
			xHost=x["host"]
			if host==xHost:
				date=x["date"]+" - "+x["heure"]
				dateL.append(date)
				disk.append(x["diskUsagePercent"])
		if len(dateL)!=0:
			graph=pygal.StackedLine(fill=True)
			graph.title="host: "+host+" \nUtilisation des disques en %"
			graph.x_labels=dateL
			graph.add("Utilisation des disques (%)", disk)
			graph.render_to_file("disk_"+host+".svg")
		f.close()


os.system('rm *.svg')
#On recupere les differents hosts repertories
hList=hostList()
"""
	un argument peut-etre passe,
	 il doit correspondre a 1 type de donne souhaitee (cpu, ram, nbUsers, disk, temp)
	 Si aucuns argument n'est passe, on vas chree des graphes pour chaques types de donnees
"""
if(len(sys.argv)==1):
	l=os.listdir('./data')
	for i in l:
		if i == "cpu.json":
			cpu('./data/'+i, hList)
		elif i == "temp.json":
			temp('./data/'+i, hList)
		elif i == "ram.json":
			ram('./data/'+i, hList)
		elif i == "nb-users.json":
			nbUsers('./data/'+i, hList)
		elif i== "disk.json":
			disk('./data/'+i, hList)
else:
	for i in range(1, len(sys.argv)):
		if sys.argv[i]=="cpu":
			cpu('./data/'+sys.argv[i]+'.json', hList)
		elif sys.argv[i]=="temp":
			temp('./data/'+sys.argv[i]+'.json', hList)
		elif sys.argv[i]=="ram":
			ram('./data/'+sys.argv[i]+'.json', hList)
		elif sys.argv[i]=="nb-users":
			nbUsers('./data/'+sys.argv[i]+'.json', hList)
		elif sys.argv[i]=="disk":
			disk('./data/'+sys.argv[i]+'.json', hList)