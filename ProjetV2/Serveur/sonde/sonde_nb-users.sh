#!/bin/bash

nbUsers=`users | wc -l`
heure=`date +%H:%M:%S`
date=`date +%m/%d/%Y`
host=`hostname`
echo '{ "nbusers": '$nbUsers', "heure": "'$heure'", "date": "'$date'", "host": "'$host'" }'
