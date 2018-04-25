#!/bin/bash
# Constantly sends bash variables to local js storage
while :
do
  # Grabs data from sender at localhost
  wget 10.0.0.84:8082/info.js

  #rm /var/www/html/info.js

  mv info.js /var/www/html/


  sleep 2

done
