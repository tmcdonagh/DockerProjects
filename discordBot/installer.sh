#!/bin/bash
# Asks whether or not to install
dialog \
  --yesno "\nInstall Discord Bot?" 10 30
if [ $? == 0 ]
then
  sudo docker build -t discordbot .
else
  exit 1
fi

# Asks whether or not to run previously installed container
sudo docker run --name=discordbot --restart=always -d -p 8080:8080 discordbot
