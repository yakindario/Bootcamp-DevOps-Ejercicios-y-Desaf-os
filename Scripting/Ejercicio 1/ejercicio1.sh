#!/bin/bash - 
#===============================================================================
#
#          FILE: ejercicio1.sh
# 
#         USAGE: ./ejercicio1.sh 
# 
#   DESCRIPTION:  Enunciado
# El usuario ingresará un directorio por teclado.
# El script verificará si el directorio existe. Si existe, mostrará el listado de archivos en ese directorio junto con su tipo (archivo , directorio, etc.). Si no existe o no es un directorio válido, generará un mensaje de error.
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Yakin Dario, 
#  ORGANIZATION: 
#       CREATED: 12/03/24 22:41
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

read -p "Ingrsa un directorio: " dir

if [ -d $dir ]; then
  echo "Listar archivo  en $dir"
  ls $dir
else 
  echo "El directorio no exite $dir"
fi
