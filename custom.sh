#!/bin/bash
echo "-- custom.ch from inno-drupal INO_ENV=$INO_ENV --"
dom=`hostname -d`
date1=$(date +"%s")

echo "postfix VIRTUAL_HOST=$VIRTUAL_HOST";
  postconf -e "myhostname = `hostname`"
  postconf -e "mydestination = $VIRTUAL_HOST localhost.localdomain, localhost"

date2=$(date +"%s")
diff=$(($date2-$date1))
#echo "$(($diff / 60)) minutes and $(($diff % 60)) seconds elapsed."
echo "---------------- custom.sh done: $(($diff / 60)) min $(($diff % 60)) sec "


