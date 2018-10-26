#!/bin/bash
time=$(date)
mysql -ptest < main.sql
connected=true
while :
do
  curl -s --head http://www.google.com/ | head -n 1 | grep "HTTP/1.[01] [23].." > /dev/null
  if [ $? == 1 ]
  then
    if [ $connected == true ]
    then
      time=$(date)
      echo "Lost connection at          $(date)" >> connectionChecker.log
      connected=false
      echo "INSERT INTO logs (status,time) VALUES ('Lost connection:','$time')"| mysql -uroot -ptest clouddb
    fi
  else
    if [ $connected == false ]
    then
      time=$(date)
      echo "INSERT INTO logs (status,time) VALUES ('Reconnected:','$time')"| mysql -uroot -ptest clouddb
      echo "Reestablished connection at $(date)" >> connectionChecker.log
      connected=true
    fi
  fi
  sleep 10
done
