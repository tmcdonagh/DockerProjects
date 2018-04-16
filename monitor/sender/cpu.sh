#!/bin/bash
out="/var/www/html/info.txt"
while : 
do
  perc=($(mpstat -P ALL 1 1 | awk '/Average:/ && $2 ~ /[0-9]/ {print $3}'))
  for i in "${perc[@]}"
  do
    echo "$i" >> $out
  done
  sleep 2
  echo "" > $out
done
