#!/bin/bash
sudo docker build -t dbwordpress .
sudo docker run \
  --name=dbwordpress \
  --restart=always \
  -e MYSQL_ROOT_PASSWORD=test \
  -d dbwordpress \
  #-v /home/tom/clouddb-data:/var/lib/mysql \ # Issue with new data not being put in
  #-p 2162:3306 \ #Exposes internal port 3306 to external port 2162

