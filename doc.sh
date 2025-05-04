#!/bin/sh

GHUSER="public-domain"

echo "# PUBLIC DOMAIN SOFTWARE SOURCE CODE" > README.md

echo >> README.md

echo "![screen](shot.png)" >> README.md

echo >> README.md
date --utc --iso-8601=seconds >> README.md
echo >> README.md

while read l; do
	echo $l | awk -F $GHUSER '{print $2}'
	echo "["`echo $l | awk -F $GHUSER '{print $2}' | cut -c2-`"]($l)" >> README.md
echo >> README.md
       	
done < list.txt

echo "--" >> README.md
exit

