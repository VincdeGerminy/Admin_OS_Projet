#!/usr/bin/env python

import smtplib


mailServer='smtp.gmail.com'
mailServerPort=587

fromAddr='testes0974@gmail.com'
toAddr='delfeilcasanova@gmail.com'


fromHead = 'From : %s\r\n' % fromAddr
toHead = 'To: %s\r\n\r\n' % toAddr
subjectHead='Subject: Alerte mail'

body='Une nouvelle alerte web a ete detectee!!!'

emailMessage= '%s\n%s\n%s\n\n%s' % (fromHead, toHead, subjectHead, body)

s=smtplib.SMTP(mailServer, mailServerPort)
s.set_debuglevel(1)
s.starttls()
s.login("testes0974@gmail.com", "fh2fe7ee")
s.sendmail(fromAddr, toAddr, emailMessage)
s.quit()
