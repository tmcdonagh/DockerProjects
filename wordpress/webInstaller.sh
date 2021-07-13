#!/bin/bash
sudo docker build -t web-wordpress .
port=80
sudo docker run --name=web-wordpress --restart=always -d -p $port:80 web-wordpress
