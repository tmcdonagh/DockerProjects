#!/bin/bash
# Constantly sends bash variables to local js storage
while :
do
  # Grabs data from sender at localhost
  wget localhost:8082/info.js

  node info.js

  sleep 2

done
