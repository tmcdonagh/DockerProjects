#!/bin/bash 
sudo docker stop receiver
sudo docker rm receiver 
sudo docker rmi receiver
sudo docker stop monitordb
sudo docker rm monitordb
sudo docker rmi monitordb
