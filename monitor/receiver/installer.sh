#!/bin/bash
# Asks whether or not to install
dialog \
  --yesno "\nInstall Receiver?" 10 30
if [ $? == 0 ]
then
  echo "#!/bin/bash" > updater.sh
  echo "while :" >> updater.sh
  echo "do" >> updater.sh
  while :
  do
    addr=$(dialog --inputbox "What ip or domain do you want to connect to?" 10 25 --output-fd 1)
    #name=$(dialog --inputbox "What should it be titled?" 10 25 --output-fd 1)
    dialog \
      --yesno "\nIs this correct? \n$addr" 10 30
    if [ $? == 0 ]
    then
      echo "wget $addr:8082/info.js" >> updater.sh
      echo "wget -N $addr:8082/config.sh" >> updater.sh
      echo "mv info.js /var/www/html/$addr"$num".js" >> updater.sh
      dialog \
        --yesno "\nAdd another?" 10 30
      if [ $? == 1 ]
      then
        break
      fi
    fi
  done
  echo "sleep 2" >> updater.sh
  echo "done" >> updater.sh

  sudo docker build -t receiver .
else
  exit 1
fi

# Asks whether or not to run previously installed container
dialog \
  --yesno "\nRun Receiver?" 10 30
if [ $? == 0 ]
then 
  #port=$(dialog --inputbox "What port should 80 be set to?" 10 25 --output-fd 1)
  port="8083"

  sudo docker run --name=receiver --restart=always -d -p $port:80 receiver
  sudo docker exec receiver /receiver/tmux.sh

fi
