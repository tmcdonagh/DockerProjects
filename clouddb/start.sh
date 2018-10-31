#!/bin/bash
while :
do
  mysqladmin -uroot -ptest processlist
  if [ $? -eq 0 ]
  then
    # Exists
    if [ -d /var/lib/mysql/clouddb ]
    then
      echo "something"
      # Exists
    else
      mysql -ptest < /src/main.sql
    fi
    /src/connectionChecker.sh &
    break
  fi
  sleep 1
done
