echo "saisissez l'adresse du serveur: "
read add
echo '{ "addServ": "'$add'"}' > config/user.json

chmod -R +x ./*.sh
chmod -R +x ./*/*.sh
chmod -R +x ./*.py
chmod -R +x ./*/*.py

echo "Saisissez la frequence de repetition de la collecte de donnees (au format cron: min h j m a)"
echo "appuillez sur \"entrer\" pour la configuration par default (toutes les minutes)"
read freq
if test -c $freq
then
	crontab < <(crontab -l ; echo "*/1 * * * * cd `pwd` && ./collecteur.sh")
else
	crontab < <(crontab -l ; echo "$freq cd `pwd` && ./collecteur.sh")
fi