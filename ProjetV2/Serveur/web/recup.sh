#!/bin/bash

	#Récupération d'une nouvelle version du fichier.html
url='https://www.cert.ssi.gouv.fr/alerte/feed/'
wget  $url

	#Différence entre deux fichiers
diff index.html index.html.1 > dif.txt

if [ `cat dif.txt | wc -c` != 0 ]
then
	echo Alerte
	./mailWeb.sh
fi

grep -o '<title>.*</title>\|<pubDate>.*</pubDate>' dif.txt | sed 's/<title>/{"titre":"/g' | sed 's/<\/title>/", /g' | sed 's/<pubDate>/"date":"/g' | sed 's/<\/pubDate>/"}/g' >> ../data/alertWeb.json #récup des tritres

rm index.html
rm dif.txt
mv index.html.1 index.html

./formatage.sh

./garbageCollectorWeb.sh
