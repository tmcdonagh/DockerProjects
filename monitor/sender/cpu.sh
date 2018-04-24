#!/bin/bash
out="/var/www/html/info.js"
num="0"
avg="0.00"
while : 
do
  perc=($(mpstat -P ALL 1 1 | awk '/Average:/ && $2 ~ /[0-9]/ {print $3}'))
  echo "var cores = {" >> $out;
  totalCpu="0"
  for i in "${perc[@]}"
  do
    num=$((num+1))
    echo "core$num : "$i"," >> $out;
    avg=$(echo "$avg+$i" | bc)
    totalCpu=$((totalCpu+1))
  done
  avg=$(echo "$avg/$totalCpu" | bc)
  echo "coreAvg : "$avg"," >> $out;
  echo "};" >> $out
  sleep 2
  echo "" > $out
  num="0"
done
