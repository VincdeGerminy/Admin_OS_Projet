if [ ! -f ./data/cpu.json ] 
then
	http http://nom_serveur/cpu.json > ./data/cpu.json
else
	http http://nom_serveur/cpu.json >> ./data/cpu.json
	
if [ ! -f ./data/disk.json ] 
then
	http http://nom_serveur/disk.json > ./data/disk.json
else	
	http http://nom_serveur/disk.json >> ./data/disk.json
	
if [ ! -f ./data/temp.json ] 
then
	http http://nom_serveur/temp.json > ./data/temp.json
else
	http http://nom_serveur/temp.json >> ./data/temp.json
	
if [ ! -f ./data/nb-users.json ] 
then
	http http://nom_serveur/nb-users.json > ./data/nb-users.json
else
	http http://nom_serveur/nb-users.json >> ./data/nb-users.json
	
if [ ! -f ./data/ram.json ] 
then
	http http://nom_serveur/ram.json > ./data/ram.json
else
	http http://nom_serveur/ram.json >> ./data/ram.json
	