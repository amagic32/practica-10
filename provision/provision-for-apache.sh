#!/bin/bash

#INSTALACIÓN APACHE
apt-get update
apt-get -y upgrade
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
cd /var/www/html
mkdir -p sitio-practica-10
cd /var/www/html/sitio-practica-10
wget http://wordpress.org/latest.zip
unzip /var/www/html/sitio-practica-10/latest.zip
mv /var/www/html/sitio-practica-10/wordpress/wp-config-sample.php /var/www/html/sitio-practica-10/wordpress/wp-config.php
sed -i -e 's/database_name_here/wp/' /var/www/html/sitio-practica-10/wordpress/wp-config.php
sed -i -e 's/username_here/wp_user/' /var/www/html/sitio-practica-10/wordpress/wp-config.php
sed -i -e 's/password_here/wp_user/' /var/www/html/sitio-practica-10/wordpress/wp-config.php
sed -i -e 's/localhost/192.168.33.12/' /var/www/html/sitio-practica-10/wordpress/wp-config.php
sed -i -e 's/database_name_here/wp/' /var/www/html/sitio-practica-10/wordpress/wp-config.php

WP_HOME="define('WP_HOME','http://192.168.33.13');"
WP_SITEURL="define('WP_SITEURL','http://192.168.33.13/sitio-practica-10/wordpress');"

cd /var/www/html/sitio-practica-10/wordpress

sed -i "/<?php/a $WP_SITEURL" wp-config.php
sed -i "/<?php/a $WP_HOME" wp-config.php

#sed -i "/put your unique phrase here/d" wp-config.php
#SECRET_KEYS=`curl https://api.wordpress.org/secret-key/1.1/salt/`
#SECRET_KEYS=`echo $SECRET_KEYS | tr / _`
#sed -i "/#@-/a $SECRET_KEYS" wp-config.php

cd /var/www/html
mkdir -p wordpress/wp-content/uploads
chown -R www-data:www-data *

rm -f index.html

cp /var/www/html/sitio-practica-10/wordpress/index.php /var/www/html
sed -i -e 's%wp-blog-header.php%sitio-practica-10/wordpress/wp-blog-header.php%' /var/www/html/index.php
cp /vagrant/config/.htaccess /var/www/html/sitio-practica-10/
