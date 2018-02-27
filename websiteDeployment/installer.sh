#!/bin/bash
# Asks whether or not to install
dialog \
  --backtitle "WebsiteOverview Installer" \
  --title "Installation" \
  --yesno "\nInstall WebsiteOverview?" 10 30
echo $?  
if [ $? == 0 ]
then
  sudo docker build -t websiteoverview .
fi

# Asks whether or not to run previously installed container
dialog \
  --backtitle "WebsiteOverview Installer" \
  --title "Installation" \
  --yesno "\nRun WebsiteOverview?" 10 30
if [ $? == 0 ]
then 
  port=$(dialog --inputbox "What port should 80 be set to?" 10 25 --output-fd 1)
  sudo docker run -d -p $port:80 websiteoverview
fi
