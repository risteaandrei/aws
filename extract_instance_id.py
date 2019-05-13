#!python
import json
import sys

data = json.loads(sys.argv[1])
for i in data['Instances']:
    print(i['InstanceId'])
