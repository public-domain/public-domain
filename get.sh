#!/bin/sh

GHUSER="public-domain"; 

rm -f list.txt

for p in 1 2 3; do
	curl -s "https://api.github.com/users/$GHUSER/repos?per_page=100&page=$p" | grep '"svn_url":' | grep -o 'https:[^"]*' >> list.txt;
	echo "https://api.github.com/users/$GHUSER/repos?per_page=100&page=$p"

done


while read l; do
	echo $l | awk -F $GHUSER '{print "." $2 ".zip"}'
	curl -s -L0  "$l/archive/refs/heads/master.zip" -o `echo $l | awk -F $GHUSER '{print "." $2 ".zip"}'`
done < list.txt

exit

