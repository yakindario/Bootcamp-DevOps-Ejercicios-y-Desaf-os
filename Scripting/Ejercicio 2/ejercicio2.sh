#!/bin/bash - 

# Colors
Red='\033[0;31m'    # Red
Green='\033[0;32m'  # Green
Color_Off='\033[0m' # Text Reset

# Verificar si se proporcionaron 3 argumentos
if [ "$#" -eq 3 ]; then 
  nombre=$1
  apellido=$2
  apellido2=$3

  inicial_nombre=$(echo $nombre | cut -c 1)
  inicial_a1=$(echo $apellido   | cut -c 1)
  inicial_a2=$(echo $apellido2  | cut -c 1)
  
   resultado="$inicial_nombre.$inicial_a1.$inicial_a2"
  echo -e  "${Green}Los iniciales son::: $resultado"
else 
  echo -e "${Red}Error: debes prorciona 3 argumentos"
fi

