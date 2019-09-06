#!/bin/bash
sudo docker build -t discordbot .
sudo docker run --name=discordbot --restart=always -d -p 8080:8080 discordbot
