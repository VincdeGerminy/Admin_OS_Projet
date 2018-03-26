#!/usr/bin/env python

import psutil
import os

cpuInfo=psutil.cpu_percent(interval=0.5)

os.system('echo { "cpuUsage":'+ str(cpuInfo)+' }')
