#!/bin/bash - 

# Instalacion de los paquetes necesarios para la instalacion de mediawiki
install_packeges(){
  local packages=("apache2" "mysql-server" "php" "php-mysql" "php-gd" "php-xml" "php-mbstring" "php-intl" "phpmyadmin")

  for package in "${packages[@]}"; do
    if ! dpkg -l "$package" &> /dev/null 2>&1; then
      echo "El paquete No esta instalado $package.  Installado ahora...."
      sudo apt-get install -y "$package" &> /dev/null
      if [ $? -eq 0 ]; then
	echo "El paquete $package se instalo correctamente"
      else
      	echo "Error al instalar el paquete $package"
	fi
    else
      echo "El paquete ya esta instalado $package"
    fi
 done

}

# Configuracion de la base de datos
configurar_database(){
  local DB_USER="mediawikiuser"
  local DB_PASSWORD="mediawikipassword"
  local DB_NAME="mediawikidb"
  
  systemctl start mysql

  if mysql -u root -e "SHOW DATABASES" | grep -q $DB_NAME; then
      echo "La base de datos ya existe"
  else
      echo "Creando la base de datos..."
mysql -u root <<MYSQL_SCRIPT
CREATE DATABASE $DB_NAME;
CREATE USER '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASSWORD';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'localhost';
FLUSH PRIVILEGES;
MYSQL_SCRIPT
  fi

}

# Configuracion de apache
configurar_apache(){
  systemctl stop apache2
  a2dissite  000-default
  wget https://releases.wikimedia.org/mediawiki/1.41/mediawiki-1.41.0.tar.gz
  tar -zxvf mediawiki-1.41.0.tar.gz -C /var/www/html/ > /dev/null
  mv /var/www/html/mediawiki-1.41.0 /var/www/html/mediawiki
  rm mediawiki-1.41.0.tar.gz
  chown -R www-data:www-data /var/www/html/mediawiki

  cat <<EOF > /etc/apache2/sites-available/mediawiki.conf
<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/html/mediawiki


    <Directory /var/www/html/mediawiki>
        Options FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>
    
    ErrorLog \${APACHE_LOG_DIR}/error.log
    CustomLog \${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
EOF

  

 a2ensite mediawiki
 systemctl restart apache2
}


# Configuracion de phpmyadmin
configurar_phpmyadmin(){
echo "Include /etc/phpmyadmin/apache.conf" >> /etc/apache2/apache2.conf
}

# Llamada a las funciones
install_packeges
configurar_database
configurar_apache
configurar_phpmyadmin

sleep 5
echo "Mediawiki instalado correctamente.  Acceder a http://localhost/mediawiki para configurar la base de datos."

sleep 5
systemctl reload apache2

