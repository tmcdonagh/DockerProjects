#!/bin/bash
out="/var/www/html/info.js"
num="0"
while : 
do
  perc=($(mpstat -P ALL 1 1 | awk '/Average:/ && $2 ~ /[0-9]/ {print $3}'))
  for i in "${perc[@]}"
  do

    echo "localStorage.setItem('$num', $i);" >> $out
    num=$((num+1))
    # echo "$i" >> $out
  done
  sleep 2
  echo "" > $out
  num="0"
done

# Print out to a js file with an array that will be wget'ed to host and run to put each into local storage
