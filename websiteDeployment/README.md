# Website Overview

Installs all website information from my other github repo

Install order

clouddb/./installer.sh
websiteDeployment/./installer.sh
clouddb/./networkCreator.sh
sudo docker network inspect webBridge
Copy ip of clouddb
sudo docker exec -i -t web /bin/bash
vim logs/connection.php
Change servername variable to correct ip
