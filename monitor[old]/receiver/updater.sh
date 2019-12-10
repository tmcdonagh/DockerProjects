#!/bin/bash
while :
do
wget 10.0.0.63:8082/info.js
mv info.js /var/www/html/10.0.0.63.js
sleep 2
done
