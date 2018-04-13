#!/bin/bash
# Asks whether or not to install
dialog \
  --yesno "\nInstall Monitor?" 10 30
if [ $? == 0 ]
then
  sudo docker build -t monitor .
else
  exit 1
fi

# Asks whether or not to run previously installed container
dialog \
  --yesno "\nRun Monitor?" 10 30
if [ $? == 0 ]
then 
  port=$(dialog --inputbox "What port should 80 be set to?" 10 25 --output-fd 1)
  sudo docker run --name=monitor --restart=always -d -p $port:80 monitor
fi
