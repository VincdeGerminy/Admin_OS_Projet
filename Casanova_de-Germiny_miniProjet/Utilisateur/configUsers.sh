#Creation des repertoires data et config si ils n'existent pas
mkdir -p ./data/
mkdir -p ./config/
mkdir -p ./graph/

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


echo "Saisissez la frequence de repetition de l'envoie des donnees sur le serveur (au format cron: min h j m a)"
echo "appuillez sur \"entrer\" pour la configuration par default (toutes les 20 minutes)"
read freq
if test -c $freq
then
	crontab < <(crontab -l ; echo "*/20 * * * * cd `pwd` && ./requetes.sh")
else
	crontab < <(crontab -l ; echo "$freq cd `pwd` && ./requetes.sh")
fi