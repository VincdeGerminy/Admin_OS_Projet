#!/usr/bin/env python

import os
import smtplib
import sys
import json

	#Fonctions completant le body avec les differentes alertes detectees
def info(file):
	info=""
	f=open(file, 'r')
	for line in f.readlines():
		info=info+line
	f.close()
	return info
		
def temp(file):

def collecte():
	Body=""
	l=os.listdir('./data')
	for i in l:
		if i == "alerte_cpu.json":
			cpuBody="Alertes cpu:\n"
			cpuBody=cpuBody+info('./data/'+i)+"\n"
			Body=Body+cpuBody
		elif i == "alerte_temp.json":
			tempBody="Alertes temp:\n"
			tempBody=tempBody+temp('./data/'+i)+"\n"
			Body=Body+tempBody
		elif i == "alerte_ram.json":
			ramBody="Alertes ram:\n"
			ramBody=ramBody+ram('./data/'+i)+"\n"
			Body=Body+ramBody
		elif i== "alerte_disk.json":
			diskBody="Alertes disk:\n"
			diskBody=diskBody+disk('./data/'+i)+"\n"
			Body=Body+diskBody
	return Body



mailServer='smtp.gmail.com'
mailServerPort=587

fromAddr='testes0974@gmail.com'
toAddr='delfeilcasanova@gmail.com'

Head="Alertes:\n"
body=collecte();
if(body=""):
	return 0

fromHead = 'From : %s\r\n' % fromAddr
toHead = 'To: %s\r\n\r\n' % toAddr
subjectHead='Subject: Alerte mail'

emailMessage= '%s\n%s\n%s\n\n%s' % (fromHead, toHead, subjectHead, body)

s=smtplib.SMTP(mailServer, mailServerPort)
s.set_debuglevel(1)
s.starttls()
s.login("testes0974@gmail.com", "fh2fe7ee")
s.sendmail(fromAddr, toAddr, emailMessage)
s.quit()
