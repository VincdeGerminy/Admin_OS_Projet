echo "saisissez l'adresse du serveur: "
read add
echo '{ "addServ": "'$add'"}' > config/user.json

crontab < <(crontab -l ; echo "*/1 * * * * `pwd`/collecteur.sh")
