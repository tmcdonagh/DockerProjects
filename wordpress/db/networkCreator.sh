#!/bin/bash
# Creates a Docker network bridge for this container and web container
sudo docker network disconnect wordpressBridge webwordpress
sudo docker network disconnect wordpressBridge dbwordpress
sudo docker network remove wordpressBridge
sudo docker network create -d bridge --subnet=172.18.0.0/16 wordpressBridge
sudo docker network connect --ip=172.18.0.2 wordpressBridge dbwordpress
sudo docker network connect --ip=172.18.0.3 wordpressBridge webwordpress
