


if test $# -eq 0 
then
	if test -e ./data/cpu.json
	then
		cat ./data/cpu.json | nc 10.104.29.108 1111
	fi
	
	if test -e ./data/disk.json
	then
		cat ./data/disk.json | nc 10.104.29.108 1112
	fi
	
	if test -e ./data/ram.json
	then
		cat ./data/ram.json | nc 10.104.29.108 1114
	fi
	
	if test -e ./data/temp.json
	then
		cat ./data/temp.json | nc 10.104.29.108 1115
	fi
	
	if test -e ./data/nb-users.json
	then
		cat ./data/nb-users.json | nc 10.104.29.108 1113
	fi
else
	if [ $1 = "cpu" ]
	then
		if test -e ./data/cpu.json
		then
			cat ./data/cpu.json | nc 10.104.29.108 1111
		fi
	elif [ $1 = "disk" ]
	then
		if test -e ./data/disk.json
		then
			cat ./data/disk.json | nc 10.104.29.108 1112
		fi
	elif [ $1 = "ram" ]
	then
		if test -e ./data/ram.json
		then
			cat ./data/ram.json | nc 10.104.29.108 1114
		fi
	elif [ $1 = "nb-users" ]
	then
		if test -e ./data/nb-users.json
		then
			cat ./data/nb-users.json | nc 10.104.29.108 1113
		fi
	elif [ $1 = "temp" ]
	then
		if test -e ./data/temp.json
		then
			cat ./data/temp.json | nc 10.104.29.108 1115
		fi
	fi
fi
