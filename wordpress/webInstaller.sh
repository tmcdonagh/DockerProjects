#!/bin/bash
sudo docker build -t wordpress .
port=80
sudo docker run --name=wordpress --restart=always -d -p $port:80 wordpress
