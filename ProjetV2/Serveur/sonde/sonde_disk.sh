#!/usr/bin/env python

import json
import psutil
import os
import datetime

date=datetime.datetime.now()
heure=str(date.hour)+':'+str(date.minute)+':'+str(date.second)
mdy=str(date.month)+"/"+str(date.day)+"/"+str(date.year)
host=os.uname()[1]

diskInfo=psutil.disk_usage('/')
print(json.dumps({'diskUsagePercent':diskInfo.percent, "heure":heure, "date":mdy, "host":host }))

#os.system('echo { "diskUsagePercent":'+ str(diskInfo.percent) + ' }')
