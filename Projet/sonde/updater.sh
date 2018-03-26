#!/usr/bin/env python
import json

with open('./data/temp.json') as temp:
		temp_dict = json.load(temp)

print(temp_dict)
