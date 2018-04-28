#!/usr/bin/env python

import smtplib
import json

#Recuperation des adresses mail et autres infos importantes
f=open("../config/serveur.json", 'r')
for line in f.readlines():
	x=json.loads(line)
	mailDest=x["mailDest"]
	mailOrigin=x["mailOrigin"]
	mdpMail=x["mdpMail"]
f.close()


mailServer='smtp.gmail.com'
mailServerPort=587

#fromAddr='testes0974@gmail.com'
#toAddr='delfeilcasanova@gmail.com'

fromAddr=mailOrigin
toAddr=mailDest

fromHead = 'From : %s\r\n' % fromAddr
toHead = 'To: %s\r\n\r\n' % toAddr
subjectHead='Subject: Alerte mail'

body='Une nouvelle alerte web a ete detectee!!!'

emailMessage= '%s\n%s\n%s\n\n%s' % (fromHead, toHead, subjectHead, body)

s=smtplib.SMTP(mailServer, mailServerPort)
s.set_debuglevel(1)
s.starttls()
#s.login("testes0974@gmail.com", "DCVdG2018")
s.login(fromAddr, mdpMail)
s.sendmail(fromAddr, toAddr, emailMessage)
s.quit()
