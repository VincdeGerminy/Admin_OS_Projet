#!/usr/bin/env python

import json
from datetime import datetime
from datetime import timedelta
import os

f = open('../data/alertWeb.json', 'r')
f2 = open('../data/alertWeb.json.tmp', 'w+')

curDate=datetime.now()
for line in f.readlines():
		print line
		x=json.loads(line)
		Sdate=x["date"]
		date=datetime.strptime(Sdate, '%a, %d %b %Y %H:%M:%S +0000')
		if(curDate - date <=timedelta(days=31)):
			f2.write(line)
f.close()
f2.close()			

os.system('mv ../data/alertWeb.json.tmp ../data/alertWeb.json')

