#!/bin/bash
dialog \
  --yesno "\nInstall DB?" 10 30
if [ $? == 0 ]
then
  sudo docker build -t db db/
  dialog \
    --yesno "\nRun DB?" 10 30
  if [ $? == 0 ]
  then
    sudo docker run --name=db --restart=always -d -p 3306:3306 db
  fi

fi

