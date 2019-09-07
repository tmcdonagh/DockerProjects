#!/bin/bash
# Creates a Docker network bridge for this container and web container
sudo docker network create -d bridge webBridge
sudo docker network connect webBridge clouddb
sudo docker network connect webBridge web
