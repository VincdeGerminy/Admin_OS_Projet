echo "saisissez l'adresse du serveur: "
read add

echo "Saisissez l'adresse mail sur laquelle seront envoyer les alertes: "
read mailDest

echo "Saisissez l'adresse gmail qui enveiras les alertes mails: (!l'adresse doit être une adresse gmail)"
echo "!Veuillez créer une adresse gmail secondaire"
read mailOrig

echo "Saisissez le mot de passe lié à cette adresse mail: "
read mdp

echo "Saisissez le seuil d'alerte pour le pourcentage d'utilisation CPU: "
read cpuPour

echo "Saisissez le seuil d'alerte pour la temperature des machines (en degre): "
read tempSeuil

echo "Saisissez le seuil d'alerte pour le pourcentage d'utilisation des disques: "
read diskSeuil

echo "Saisissez le seuil d'alerte pour le pourcentage d'utilisation de la RAM: "
read ramSeuil

echo '{ "addServ": "'$add'",  "mailDest": "'$mailDest'", "mailOrigin": "'$mailOrig'", "mdpMail": "'$mdp'", "cpuSeuil": "'$cpuPour'", "tempSeuil": "'$tempSeuil'", "diskSeuil": "'$diskSeuil'", "ramSeuil": "'$ramSeuil'"}' > config/serveur.json

#Permet de rendre exécutables les differents scriptes (sinon la crontab ne pouras pas les lencer)
chmod -R +x ./*.sh
chmod -R +x ./*/*.sh
chmod -R +x ./*.py
chmod -R +x ./*/*.py

cd ./web/
./firstDl.sh
cd ../

#base:
#collecte: */1 * * * * (toutes les minutes)
#verif crise: */15 * * * * (toutes les 15 minutes)
#verif alerte web: 0 20 * * * (toutes les jours à 20h)
#Création des graphes: 0 20 * * * (toutes les jours à 20h)

echo "Saisissez la frequence de repetition de la collecte de donnees (au format cron: min h j m a)"
echo "appuillez sur \"entrer\" pour la configuration par default (toutes les minutes)"
read freq
if test -c $freq
then
	crontab < <(crontab -l ; echo "*/1 * * * * cd `pwd` && ./collecteur.sh")
else
	crontab < <(crontab -l ; echo "$freq cd `pwd` && ./collecteur.sh")
fi


echo "Saisissez la frequence de repetition de la detection de crise (au format cron: min h j m a)"
echo "appuillez sur \"entrer\" pour la configuration par default (toutes les 15 minutes)"
read freq
if test -c $freq
then
	crontab < <(crontab -l ; echo "*/15 * * * * cd `pwd` && ./detect_crise.sh")
else
	crontab < <(crontab -l ; echo "$freq cd `pwd` && ./detect_crise.sh")
fi


echo "Saisissez la frequence de repetition de la recuperation d'alertes web (au format cron: min h j m a)"
echo "appuillez sur \"entrer\" pour la configuration par default (toutes les jours à 20h)"
read freq
if test -c $freq
then
	crontab < <(crontab -l ; echo "0 20 * * * cd `pwd`/web/ && ./recup.sh")
else
	crontab < <(crontab -l ; echo "$freq cd `pwd`/web/ && ./recup.sh")
fi


echo "Saisissez la frequence de repetition de la creation de graphiques (au format cron: min h j m a)"
echo "appuillez sur \"entrer\" pour la configuration par default (toutes les jours à 20h)"
read freq
if test -c $freq
then
	crontab < <(crontab -l ; echo "0 20 * * * cd `pwd` && ./graph.sh")
else
	crontab < <(crontab -l ; echo "$freq cd `pwd` && ./graph.sh")
fi