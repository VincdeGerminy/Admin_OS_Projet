./garbageCollector.sh

if [ ! -d ./data ]
then 
	mkdir data
fi

if test $# -eq 0 
then

	if [ ! -f ./data/nb-users.json ] 
	then
		./sonde/sonde_nb-users.sh > data/nb-users.json
	else
		./sonde/sonde_nb-users.sh >> data/nb-users.json
	fi
	
	if [ ! -f ./data/temp.json ] 
	then
		python ./sonde/sonde_temp.py > data/temp.json
	else
		python ./sonde/sonde_temp.py >> data/temp.json
	fi
	
	if [ ! -f ./data/ram.json ] 
	then
		./sonde/sonde_ram.sh > data/ram.json
	else
		./sonde/sonde_ram.sh >> data/ram.json
	fi
	
	if [ ! -f ./data/cpu.json ] 
	then
		./sonde/sonde_cpu.sh > data/cpu.json
	else
		./sonde/sonde_cpu.sh >> data/cpu.json
	fi
	
	if [ ! -f ./data/disk.json ] 
	then
		./sonde/sonde_disk.sh > data/disk.json
	else
		./sonde/sonde_disk.sh >> data/disk.json
	fi
		
else
	if test $1 = "nb-users" || test $1 = "ram" || test $1 = "cpu" || test $1 = "disk"
	then
		if  [ ! -f ./data/$1.json ]
		then
			./sonde/sonde_$1.sh > data/$1.json
		else 
			./sonde/sonde_$1.sh >> data/$1.json
		fi	
	else
		if  test $1 = "temp" 
		then
			if 	[ ! -f ./data/$1.json ]
			then
				python ./sonde/sonde_temp.py > data/temp.json
			else
				python ./sonde/sonde_temp.py >> data/temp.json	
			fi	
		else
			echo 'Erreur'
		fi	
	fi
fi
 
./detect_crise.sh
./mail.sh
