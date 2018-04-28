if test $# -eq 0 
then
	if test -e ./data/cpu.json
	then
		http \\samba.univ-avignon.fr\\uapv1602054\\cpu.json < ./data/cpu.json
	fi	
fi