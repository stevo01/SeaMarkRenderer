#!/bin/bash

#   tmp/   - input directory, application expect to find osm
#            file in this folder
#   tiles/ - output directory, application stores generated
#            tile files in this folder

echo "$(date) jrender.jar: start" >> logging/log.txt

# loop over all osm files in directory tmp
for file in $(ls tmp | grep "\.osm"); do
  tx=$(echo $file | cut -f 1 -d'-')
  ty=$(echo $file | cut -f 2 -d'-')
  z=$(echo $file | cut -f 3 -d'-')
  z=$(echo $z | cut -f 1 -d'.')
  echo "$(date) jrender.jar: rendering $z $tx $ty" >> logging/log.txt

  # start render application
  java -jar jrender.jar tmp/ tiles/ $z $tx $ty 2>/dev/null

  # remove the processed osm file
  rm tmp/$file
done

echo "$(date) jrender.jar: process is done" >> logging/log.txt
