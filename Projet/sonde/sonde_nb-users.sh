#!/bin/bash

nbUsers=`users | wc -l`
heure=`date +%H:%M:%S`
date=`date +%D`
echo '{ "nbusers":'$nbUsers' "heure":"'$heure'", "date":"'$date'" }'
