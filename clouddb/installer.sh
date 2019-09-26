#!/bin/bash
sudo docker build -t clouddb .
sudo docker run \
  --name=clouddb \
  -v /home/tom/clouddb-data:/var/lib/mysql \
  -e MYSQL_ROOT_PASSWORD=test \
  -d clouddb \
  #-p 2162:3306 \ #Exposes internal port 3306 to external port 2162
  #--restart=always \

