#!/bin/bash - 

if dpkg -l apache2 > /dev/null 2>&1; then
  echo "Apache esta instalado"
  exit 0
fi 

sudo apt-get update 
sudo apt-get install -y apache2

if [ $? -eq 0 ]; then
  echo "Apache se instalo correctamente"
  sudo systemctl start apache2
  sudo systemctl enable apache2
else
  echo "Error: no  se puedo instalar Apache"
fi


