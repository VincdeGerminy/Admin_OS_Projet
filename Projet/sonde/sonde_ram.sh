#!/usr/bin/env python
import psutil
import os
import json
import datetime


ram=psutil.virtual_memory()
used='"used":'+str(ram.used)+', '
available='"available":'+str(ram.available)+', '
percent='"percent":'+str(ram.percent)+', '
date=datetime.datetime.now()
heure='"heure":'+str(date.hour)+":"+str(date.minute)+":"+str(date.second)+', '
date='"date":'+str(date.month)+"/"+str(date.day)+"/"+str(date.year)
os.system('echo \'{ ' + used + available + percent + heure + date + ' }\'') 
