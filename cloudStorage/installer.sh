#!/bin/bash
dialog \
  --yesno "\nInstall and Run Cloud Storage DB?" 10 30
if [ $? == 0 ]
then
  sudo docker build -t clouddb .
  sudo docker run --name=clouddb --restart=always -e MYSQL_ROOT_PASSWORD=test1 -d -p 3306:3306 clouddb
fi


