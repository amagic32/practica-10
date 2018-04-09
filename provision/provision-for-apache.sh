#!/bin/bash

#INSTALACIÓN APACHE
apt-get update
apt-get upgrade
apt-get install -y apache2
apt-get install -y php libapache2-mod-php php-mcrypt php-mysql
/etc/init.d/apache2 restart

#INSTALACIÓN MYSQL CLIENTE
apt-get -y install debconf-utils

DB_ROOT_PASSWD=root

debconf-set-selections <<< "mysql-server mysql-server/root_password password $DB_ROOT_PASSWD"

debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $DB_ROOT_PASSWD"

apt-get install -y mysql-server

sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mysql/mysql.conf.d/mysqld.cnf

/etc/init.d/mysql restart