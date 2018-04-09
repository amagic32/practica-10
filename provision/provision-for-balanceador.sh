#!/bin/bash

#INSTALACIÓN APACHE
apt-get update
apt-get upgrade
apt-get install -y apache2
apt-get install -y php libapache2-mod-php php-mcrypt php-mysql
/etc/init.d/apache2 restart

#INSTALACIÓN DE MÓDULOS
a2enmod proxy
a2enmod proxy_http
a2enmod proxy_ajp
a2enmod rewrite
a2enmod deflate
a2enmod headers
a2enmod proxy_balancer
a2enmod proxy_connect
a2enmod proxy_html
a2enmod lbmethod_byrequests