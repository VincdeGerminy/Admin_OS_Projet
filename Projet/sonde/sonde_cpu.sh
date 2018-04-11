#!/usr/bin/env python

import json
import psutil
import os
import datetime

date=datetime.datetime.now()
heure=str(date.hour)+':'+str(date.minute)+':'+str(date.second)
mdy=str(date.month)+"/"+str(date.day)+"/"+str(date.year)
host=os.uname()[1]

cpuInfo=psutil.cpu_percent(interval=0.5)

print(json.dumps({'cpuUsage': cpuInfo, "heure":heure, "date":mdy, "host":host }))

