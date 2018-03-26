
if test $# -eq 0 
then
	./sonde/sonde_nb-users.sh >> data/nb-users.json
	python ./sonde/sonde_temp.py >> data/temp.json
	./sonde/sonde_ram.sh >> data/ram.json
	./sonde/sonde_cpu.sh >> data/cpu.json
	./sonde/sonde_disk.sh >> data/disk.json
else
		if test $1 = "nb-users" || test $1 = "ram" || test $1 = "cpu" || test $1 = "disk"
		then
			./sonde/sonde_$1.sh >> data/$1.json
		else
			if  test $1 = "temp" 
			then 
				python ./sonde/sonde_temp.py >> data/temp.json
			else
				echo 'Erreur'
			fi	
		fi
fi

