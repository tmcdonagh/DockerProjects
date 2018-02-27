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
echo $?
if [ $? == 0 ]
then 
  sudo docker run -d -p 80:80 websiteoverview
fi
