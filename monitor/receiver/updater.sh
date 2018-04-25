#!/bin/bash
while :
do
wget 10.0.0.84:8082/info.js
wget -N 10.0.0.84:8082/config.sh
mv info.js /var/www/html/10.0.0.84.js
wget 10.0.0.95:8082/info.js
wget -N 10.0.0.95:8082/config.sh
mv info.js /var/www/html/10.0.0.95.js
sleep 2
done
