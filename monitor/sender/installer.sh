#!/bin/bash
# Asks whether or not to install
dialog \
  --yesno "\nInstall Sender?" 10 30
if [ $? == 0 ]
then
  sudo docker build -t sender .
else
  exit 1
fi

# Asks whether or not to run previously installed container
dialog \
  --yesno "\nRun Sender?" 10 30
if [ $? == 0 ]
then 
  #port=$(dialog --inputbox "What port should 80 be set to?" 10 25 --output-fd 1)
  port="8082"
  sudo docker run --name=sender --restart=always -d -p $port:80 sender
  sudo docker exec sender /sender/tmux.sh

fi
