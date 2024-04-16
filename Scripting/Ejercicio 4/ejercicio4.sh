#!/bin/bash 

# Reemplaza estos valores con los tuyos
# TOKEN: El token de acceso para la API de Telegram.
TOKEN="tocke"

# ID: El ID del chat al que se enviará el mensaje.
ID="id"

# MENSAJE: El contenido del mensaje a enviar.
MENSAJE="Hola que haces este es un mensaje"

# URL: La URL de la API de Telegram para enviar mensajes.
URL="https://api.telegram.org/bot$TOKEN/sendMessage"

# Envia el mensaje utilizando curl y la API de Telegram.
curl -s -X POST $URL -d chat_id=$ID -d text="$MENSAJE"




# curl -s -X POST https://api.telegram.org/bot"30534591:AAH5d23KtktfTQSWJMT9CiuginbsFQiF_2nB4"/sendMessage -d chat_id="57384545" -d text="Esto es un Mensaje de Prueba"

