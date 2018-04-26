#!/bin/bash
source config.sh
out="info.js"
while : 
do
  avg="0.00"
  num="0"
  perc=($(mpstat -P ALL 1 1 | awk '/Average:/ && $2 ~ /[0-9]/ {print $3}'))
  echo "var server$name = {" >> $out;
  totalCpu="0"
  for i in "${perc[@]}"
  do
    num=$((num+1))
    echo "core$num : "$i"," >> $out;
    avg=$(echo "$avg+$i" | bc)
    totalCpu=$((totalCpu+1))
  done
  avg=$(echo "$avg/$totalCpu" | bc -l)
  echo "coreAvg : "$avg"," >> $out
  echo "};" >> $out
  sleep 2
  echo "" > $out
  mv info.js /var/www/html/info.js
done
