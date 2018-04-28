#!/usr/bin/env python
import os

f1=os.fork()
if f1==0 :
	os.system('nc -l -k 1111 >> /home/etudiants/inf/uapv1603134/Admin_sys_exploitation/Projet/data/cpu.json')
f2=os.fork()	
if f2==0:
	os.system('nc -l -k 1112 >> /home/etudiants/inf/uapv1603134/Admin_sys_exploitation/Projet/data/disk.json')
f3=os.fork()	
if f3==0:
	os.system('nc -l -k 1113 >> /home/etudiants/inf/uapv1603134/Admin_sys_exploitation/Projet/data/nb-users.json')	
f2=os.fork()	
if f2==0:
	os.system('nc -l -k 1114 >> /home/etudiants/inf/uapv1603134/Admin_sys_exploitation/Projet/data/ram.json')
f2=os.fork()	
if f2==0:
	os.system('nc -l -k 1115 >> /home/etudiants/inf/uapv1603134/Admin_sys_exploitation/Projet/data/temp.json')
