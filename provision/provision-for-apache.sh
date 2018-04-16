#!/bin/bash

#INSTALACIÓN APACHE
apt-get update
apt-get upgrade
apt-get install -y apache2
apt-get install -y php libapache2-mod-php php-mcrypt php-mysql
/etc/init.d/apache2 restart
apt-get install -y unzip

#INSTALACIÓN MYSQL CLIENTE
apt-get -y install debconf-utils

DB_ROOT_PASSWD=root

debconf-set-selections <<< "mysql-server mysql-server/root_password password $DB_ROOT_PASSWD"

debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $DB_ROOT_PASSWD"

apt-get install -y mysql-server

sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mysql/mysql.conf.d/mysqld.cnf

/etc/init.d/mysql restart

#DESCARGAMOS E INSTALAMOS WORDPRESS  
wget http://wordpress.org/latest.zip
mv latest.zip /var/www/html
sudo unzip /var/www/html/latest.zip
mv /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php
sed -i -e 's/database_name_here/wp/' /var/www/html/wordpress/wp-config.php
sed -i -e 's/username_here/wp_user/' /var/www/html/wordpress/wp-config.php
sed -i -e 's/password_here/wp_user/' /var/www/html/wordpress/wp-config.php
sed -i -e 's/localhost/192.168.33.12/' /var/www/html/wordpress/wp-config.php
sed -i -e 's/database_name_here/wp/' /var/www/html/wordpress/wp-config.php

