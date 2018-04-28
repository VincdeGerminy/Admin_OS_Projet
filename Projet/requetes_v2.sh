if test $# -eq 0 
then
	if test -e ./data/cpu.json
	then
		http http://nom_serveur/cpu.json < ./data/cpu.json
	fi
	if test -e ./data/ram.json
	then
		http http://nom_serveur/ram.json < ./data/ram.json
	fi
	if test -e ./data/nb-users.json
		then
			http http://nom_serveur/nb-users.json < ./data/nb-users.json
		fi
	if test -e ./data/disk.json
		then
			http http://nom_serveur/disk.json < ./data/disk.json
		fi
	if test -e ./data/temp.json
		then
			http http://nom_serveur/temp.json < ./data/temp.json
		fi	
fi
