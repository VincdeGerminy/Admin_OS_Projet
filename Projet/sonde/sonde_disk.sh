#!/usr/bin/env python

import psutil
import os

diskInfo=psutil.disk_usage('/')
os.system('echo { "diskUsagePercent":'+ str(diskInfo.percent) + ' }')
