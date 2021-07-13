#!/bin/bash
sudo docker build -t webwordpress .
port=80
sudo docker run --name=webwordpress --restart=always -d -p $port:80 webwordpress
