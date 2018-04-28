#!/usr/bin/env python

import json
import os
import requests

l=os.listdir('./data')
for i in l:
	if i == "cpu.json" or "ram.json" or "temp.json" or "disk.json" or "nb-users.json":
		

testDir={"bob":"bobi"}
testDir["Bob"]="blip"

req=requests.post("http://localhost/Supervise/cpu.php", data=testDir)
print(req.text)
