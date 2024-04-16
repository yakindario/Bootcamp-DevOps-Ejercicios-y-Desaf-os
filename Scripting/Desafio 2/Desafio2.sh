#!/bin/bash
#Instalar y configurar apache, wordpress, y mysql

#Instalar paquetes
install_packeges(){
    local packages=("apache2" "php" "mysql-server" "php-mysql" "php-gd" "php-xml" "php-mbstring" "php-intl" )
    
    for package in "${packages[@]}"; do
        if ! dpkg -l "$package" &> /dev/null 2>&1; then
            echo "El paquete no esta instalado $package. Instalando $package ahora..."
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

configurar_database(){
    local DB_USER="wordpressuser"
    local DB_PASSWORD="wordpresspassword"
    local DB_NAME="wordpressdb"
    
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

configurar_apache(){
    systemctl stop apache2
    a2dissite  000-default
    wget https://wordpress.org/latest.tar.gz
    tar -zxvf latest.tar.gz -C /var/www/html/ > /dev/null
    mv /var/www/html/wordpress /var/www/html/wordpress
    rm latest.tar.gz
    chown -R www-data:www-data /var/www/html/wordpress

    cat <<EOF > /etc/apache2/sites-available/wordpress.conf
<VirtualHost *:80>
      ServerAdmin webmaster@localhost
      DocumentRoot /var/www/html/wordpress

      <Directory /var/www/html/wordpress>
          Options FollowSymLinks
          AllowOverride All
          Require all granted
      </Directory>

      ErrorLog ${APACHE_LOG_DIR}/error.log
      CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
EOF

    a2ensite wordpress.conf
    systemctl start apache2
}

install_packeges
configurar_database
configurar_apache

sleep 5
echo "Instalacion y configuracion de apache, wordpress y mysql terminada"
