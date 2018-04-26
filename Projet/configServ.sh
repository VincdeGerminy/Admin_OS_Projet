echo "saisissez l'adresse du serveur: "
read add

echo "Saisissez l'adresse main sur laquelle seront envoyer les alertes: "
read mailDest

echo '{ "addServ": "'$add'", "mailDest": "'$mailDest'"}' > config/serveur.json


crontab < <(crontab -l ; echo "*/1 * * * * `pwd`/collecteur.sh")
#crontab < <(crontab -l ; echo "*/1 * * * * `pwd`/.sh")
