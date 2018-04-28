#!/usr/bin/env python

import json
import os
import requests

testDir={"bob":"bobi"}
testDir["Bob"]="blip"

req=requests.post("http://localhost/Supervise/Serveur/cpu.php", data=testDir)
print(req.text)
