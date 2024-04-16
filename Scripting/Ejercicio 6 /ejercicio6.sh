#!/bin/bash

# Script para instalar Apache, Git y hacer disponible un repositorio en Apache
paquetes=("apache2" "git")

for paquete in "${paquetes[@]}"; do
  if ! dpkg -l "$paquete" > /dev/null 2>&1; then
		apt-get update
		echo "Instalando $paquete"
		sudo apt-get install -y "$paquete"
	else
		echo "$paquete ya está instalado"
	fi
done

a2dissite 000-default

repo_directory="/var/www/html/startbootstrap"
if [ -d "$repo_directory" ]; then
    echo -e "El directorio del repositorio ya existe. Realizando pull para obtener cambios..."
    cd "$repo_directory" || exit
    git pull origin main
else
    git clone -b main https://gitlab.com/training-devops-cf/startbootstrap.git "$repo_directory"
fi

cat <<EOF > /etc/apache2/sites-available/startbootstrap.conf
<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    DocumentRoot $repo_directory

    <Directory $repo_directory>
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
EOF

a2ensite startbootstrap

systemctl restart apache2

