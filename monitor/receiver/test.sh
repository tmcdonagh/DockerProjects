#!/bin/bash
avg="1.00"
i="1.01"
#while : 
#do
  #avg=$(echo "$avg+$i" | bc)
#done
avg=$(echo "$avg/$i" | bc )

echo $avg
