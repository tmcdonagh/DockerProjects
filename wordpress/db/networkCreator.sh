#!/bin/bash
# Creates a Docker network bridge for this container and web container
sudo docker network disconnect wordpressBridge wordpress
sudo docker network disconnect wordpressBridge db-wordpress
sudo docker network remove wordpressBridge
sudo docker network create -d bridge --subnet=172.18.0.0/16 wordpressBridge
sudo docker network connect --ip=172.18.0.2 webBridge db-wordpress
sudo docker network connect --ip=172.18.0.3 webBridge wordpress
