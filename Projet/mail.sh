#!/usr/bin/env python

import os
import smtplib
import sys
import json

	#Fonctions complétant le body avec les différentes alertes détectées
def cpu(f):
	cpuBody="Alertes cpu:\n"
	f=open(file, 'r')
	for line in freadlines():
		cpuBody=cpuBody+line+"\n"
		


def Collecte(): 
	l=os.listdir('./data')
	for i in l:
		if i == "alerte_cpu.json":
			cpuBody=cpu('./data/'+i)
		elif i == "alerte_temp.json":
			#tempBody=temp('./data/'+i)
		elif i == "alerte_ram.json":
			#ramBody=ram('./data/'+i)
		elif i== "alerte_disk.json":
			#diskBody=disk('./data/'+i)



mailServer='smtp.gmail.com'
mailServerPort=587

fromAddr='testes0974@gmail.com'
toAddr='delfeilcasanova@gmail.com'

body=collecte();


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