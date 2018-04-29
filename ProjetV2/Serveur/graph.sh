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
	si l'argument argHost est vide:
		Fonction creant 1 graphe par host
		contenant l'utilisation du CPU en %, en fonction de la date
	sinon:
		on cree un graphe pour l'host passe en argument
"""
def cpu(file, hList, argHost):
	if(argHost==""):
		for host in hList:
			os.system("rm -f ./graph/cpuUsage_"+host+".svg")
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
				graph.render_to_file("./graph/cpuUsage_"+host+".svg")
			f.close()
	else:
		os.system("rm -f ./graph/cpuUsage_"+argHost+".svg")
		f=open(file, 'r')
		dateL= []
		cpuUsage=[]
		for line in f.readlines():
			x=json.loads(line)
			xHost=x["host"]
			if argHost==xHost:
				date=x["date"]+" - "+x["heure"]
				dateL.append(date)
				cpuUsage.append(x["cpuUsage"])
		if len(dateL)!=0:
			graph=pygal.StackedLine(fill=True)
			graph.title="host: "+argHost+" \nUtilisation du cpu en %"
			graph.x_labels=dateL
			graph.add('cpu usage (%)', cpuUsage)
			graph.render_to_file("./graph/cpuUsage_"+argHost+".svg")
		f.close()

"""
	si l'argument argHost est vide:
		Fonction creant 1 graphe par host
		contenant la temperature en degre celsius en fonction du temps
	sinon:
		on cree un graphe pour l'host passe en argument
"""
def temp(file, hList, argHost):
	if(argHost==""):
		for host in hList:
			os.system("rm -f ./graph/temp_"+host+".svg")
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
				graph.render_to_file("./graph/temp_"+host+".svg")
			f.close()
	else:
		os.system("rm -f ./graph/temp_"+argHost+".svg")
		f=open(file, 'r')
		dateL=[]
		curent=[]
		critique=[]
		for line in f.readlines():
			x=json.loads(line)
			xHost=x["host"]
			if argHost==xHost:
				date=x["date"]+" - "+x["heure"]
				dateL.append(date)
				curent.append(x["actuelle"])
				critique.append(x["critique"])
		if len(dateL)!=0:
			graph=pygal.Line()
			graph.title="host: "+argHost+" \nTemperatures en degre celsius"
			graph.x_labels=dateL
			graph.add('Temperature actuelle (deg c)', curent)
			graph.add('Temperature critique (deg c)', critique)
			graph.render_to_file("./graph/temp_"+argHost+".svg")
		f.close()

"""
	Si l'argument argHost est vide:
		Fonction creant 1 graphe par host
		contenant l'utilisation de la RAM en %, en fonction de la date
	sinon:
		on cree un graphe pour l'host passe en argument
"""
def ram(file, hList, argHost):
	if(argHost==""):	
		for host in hList:
			os.system("rm -f ./graph/ram_"+host+".svg")
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
				graph.render_to_file("./graph/ram_"+host+".svg")
			f.close()
	else:
		os.system("rm -f ./graph/ram_"+argHost+".svg")
		f=open(file, 'r')
		dateL=[]
		percent=[]
		for line in f.readlines():
			x=json.loads(line)
			xHost=x["host"]
			if argHost==xHost:
				date=x["date"]+" - "+x["heure"]
				dateL.append(date)
				percent.append(x['percent'])
		if len(dateL)!=0:
			graph=pygal.StackedLine(fill=True)
			graph.title="host: "+argHost+" \nUtilisation de la RAM en %"
			graph.x_labels=dateL
			graph.add('utilisation de la RAM (%)', percent)
			graph.render_to_file("./graph/ram_"+argHost+".svg")
		f.close()

"""
	Si l'argument argHost est vide:
		Fonction creant 1 graphe par host
		contenant le nombre d'utilisateurs, en fonction de la date
	sinon:
		on cree un graphe pour l'host passe en argument
"""
def nbUsers(file, hList, argHost):
	if(argHost==""):
		for host in hList:
			os.system("rm -f ./graph/nb-users_"+host+".svg")
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
				graph.render_to_file("./graph/nb-users_"+host+".svg")
			f.close()
	else:
		os.system("rm -f ./graph/nb-users_"+argHost+".svg")
		f=open(file, 'r')
		dateL=[]
		nbUser=[]
		for line in f.readlines():
			x=json.loads(line)
			xHost=x["host"]
			if argHost==xHost:
				date=x["date"]+" - "+x["heure"]
				dateL.append(date)
				nbUser.append(x["nbusers"])
		if len(dateL)!=0:
			graph=pygal.StackedLine(fill=True)
			graph.title="host: "+argHost+" \nNombre d'utilisateurs"
			graph.x_labels=dateL
			graph.add("Nombre d'utilisateurs", nbUser)
			graph.render_to_file("./graph/nb-users_"+argHost+".svg")
		f.close()

"""
	Si l'argument argHost est vide:
		Fonction creant 1 graphe par host
		contenant l'utilisation des disques en %, en fonction de la date
	sinon:
		on cree un graphe pour l'host passe en argument
"""
def disk(file, hList, argHost):
	if(argHost==""):
		for host in hList:
			os.system("rm -f ./graph/disk_"+host+".svg")
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
				graph.render_to_file("./graph/disk_"+host+".svg")
			f.close()
	else:
		os.system("rm -f ./graph/disk_"+argHost+".svg")
		f=open(file, 'r')
		dateL=[]
		disk=[]
		for line in f.readlines():
			x=json.loads(line)
			xHost=x["host"]
			if argHost==xHost:
				date=x["date"]+" - "+x["heure"]
				dateL.append(date)
				disk.append(x["diskUsagePercent"])
		if len(dateL)!=0:
			graph=pygal.StackedLine(fill=True)
			graph.title="host: "+argHost+" \nUtilisation des disques en %"
			graph.x_labels=dateL
			graph.add("Utilisation des disques (%)", disk)
			graph.render_to_file("./graph/disk_"+argHost+".svg")
		f.close()

"""
Arguments:
-vide: on fait tous les graphes possible de tous les utilisateurs
-1 argument:(ype ou host) soit le type de gragrphe pour tous les utilisateurs
	soit tous les graphes de tel machine
-2 arguments:(type, host) on fait le graphe de la machine du type choisi
"""

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
			cpu('./data/'+i, hList, "")
		elif i == "temp.json":
			temp('./data/'+i, hList, "")
		elif i == "ram.json":
			ram('./data/'+i, hList, "")
		elif i == "nb-users.json":
			nbUsers('./data/'+i, hList, "")
		elif i== "disk.json":
			disk('./data/'+i, hList, "")
elif(len(sys.argv)==2):
	if sys.argv[1]=="cpu":
		cpu('./data/'+sys.argv[1]+'.json', hList, "")
	elif sys.argv[1]=="temp":
		temp('./data/'+sys.argv[1]+'.json', hList, "")
	elif sys.argv[1]=="ram":
		ram('./data/'+sys.argv[1]+'.json', hList, "")
	elif sys.argv[1]=="nb-users":
		nbUsers('./data/'+sys.argv[1]+'.json', hList, "")
	elif sys.argv[1]=="disk":
		disk('./data/'+sys.argv[1]+'.json', hList, "")
	else:
		l=os.listdir('./data')
		for i in l:
			if i == "cpu.json":
				cpu('./data/'+i, hList, sys.argv[1])
			elif i == "temp.json":
				temp('./data/'+i, hList, sys.argv[1])
			elif i == "ram.json":
				ram('./data/'+i, hList, sys.argv[1])
			elif i == "nb-users.json":
				nbUsers('./data/'+i, hList, sys.argv[1])
			elif i== "disk.json":
				disk('./data/'+i, hList, sys.argv[1])
elif(len(sys.argv)==3):
	if sys.argv[1]=="cpu":
		cpu('./data/'+sys.argv[1]+'.json', hList, sys.argv[2])
	elif sys.argv[1]=="temp":
		temp('./data/'+sys.argv[1]+'.json', hList, sys.argv[2])
	elif sys.argv[1]=="ram":
		ram('./data/'+sys.argv[1]+'.json', hList, sys.argv[2])
	elif sys.argv[1]=="nb-users":
		nbUsers('./data/'+sys.argv[1]+'.json', hList, sys.argv[2])
	elif sys.argv[1]=="disk":
		disk('./data/'+sys.argv[1]+'.json', hList, sys.argv[2])
