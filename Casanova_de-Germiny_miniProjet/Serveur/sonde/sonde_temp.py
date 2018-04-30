#!/usr/bin/env python
import psutil
import json
import os
import datetime

temp = psutil.sensors_temperatures()
cpu=temp['coretemp'][0]
date=datetime.datetime.now()
heure=str(date.hour)+":"+str(date.minute)+":"+str(date.second)
date=str(date.month)+"/"+str(date.day)+"/"+str(date.year)
host=os.uname()[1]
print (json.dumps({ "actuelle":cpu.current, "critique":cpu.critical, "heure":heure, "date":date, "host":host }))
