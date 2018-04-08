#!/usr/bin/env python

import json
import os
from datetime import datetime
import pygal
import sys


def cpu(file):
	f=open(file, 'r')
	dateL= []
	cpuUsage=[]
	for line in f.readlines():
		x=json.loads(line)
		date=x["date"]+" - "+x["heure"]
		dateL.append(date)
		cpuUsage.append(x["cpuUsage"])
	graph=pygal.StackedLine(fill=True)
	graph.title="Utilisation du cpu en %"
	graph.x_labels=dateL
	graph.add('cpu usage (%)', cpuUsage)
	graph.render_to_file("cpuUsage.svg")

def temp(file):
	f=open(file, 'r')
	dateL=[]
	curent=[]
	critique=[]
	for line in f.readlines():
		x=json.loads(line)
		date=x["date"]+" - "+x["heure"]
		dateL.append(date)
		curent.append(x["actuelle"])
		critique.append(x["critique"])
	graph=pygal.Line()
	graph.title="Temperatures"
	graph.x_labels=dateL
	graph.add('Temperature actuelle', curent)
	graph.add('Temperature critique', critique)
	graph.render_to_file("temp.svg")


def ram(file):
	f=open(file, 'r')
	dateL=[]
	percent=[]
	for line in f.readlines():
		x=json.loads(line)
		date=x["date"]+" - "+x["heure"]
		dateL.append(date)
		percent.append(x['percent'])
	graph=pygal.StackedLine(fill=True)
	graph.title="Utilisation de la RAM en %"
	graph.x_labels=dateL
	graph.add('utilisation de la RAM en %', percent)
	graph.render_to_file("ram.svg")

def nbUsers(file):
	f=open(file, 'r')
	dateL=[]
	nbUser=[]
	for line in f.readlines():
		x=json.loads(line)
		date=x["date"]+" - "+x["heure"]
		dateL.append(date)
		nbUser.append(x["nbusers"])
	graph=pygal.StackedLine(fill=True)
	graph.title="Nombre d'utilisateurs"
	graph.x_labels=dateL
	graph.add("Nombre d'utilisateurs", nbUser)
	graph.render_to_file("nb-users.svg")

def disk(file):
	f=open(file, 'r')
	dateL=[]
	disk=[]
	for line in f.readlines():
		x=json.loads(line)
		date=x["date"]+" - "+x["heure"]
		dateL.append(date)
		disk.append(x["diskUsagePercent"])
	graph=pygal.StackedLine(fill=True)
	graph.title="Utilisation des disques"
	graph.x_labels=dateL
	graph.add("Utilisation des disques en %", disk)
	graph.render_to_file("disk.svg")


if(len(sys.argv)==1):
	l=os.listdir('./data')
	for i in l:
		if i == "cpu.json":
			cpu('./data/'+i)
		elif i == "temp.json":
			temp('./data/'+i)
		elif i == "ram.json":
			ram('./data/'+i)
		elif i == "nb-users.json":
			nbUsers('./data/'+i)
		elif i== "disk.json":
			disk('./data/'+i)
else:
	for i in range(1, len(sys.argv)):
		if sys.argv[i]=="cpu":
			cpu('./data/'+sys.argv[i]+'.json')
		elif sys.argv[i]=="temp":
			temp('./data/'+sys.argv[i]+'.json')
		elif sys.argv[i]=="ram":
			ram('./data/'+sys.argv[i]+'.json')
		elif sys.argv[i]=="nb-users":
			nbUsers('./data/'+sys.argv[i]+'.json')
		elif sys.argv[i]=="disk":
			disk('./data/'+sys.argv[i]+'.json')