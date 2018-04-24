#!/bin/bash
perc=($(mpstat -P ALL 1 1 | awk '/Average:/ && $2 ~ /[0-9]/ {print $3}'))
for j in "${perc[@]}"
do
  
avg=$(echo "1/1" | bc)
echo $avg
