#!/bin/bash

#INSTALACIÓN APACHE
apt-get update
apt-get -y upgrade
apt-get install -y apache2
apt-get install -y php libapache2-mod-php php-mcrypt php-mysql


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

#EDITAMOS 000-DEFAULT.CONF
cp /vagrant/config/000-default.conf /etc/apache2/sites-enabled/000-default.conf
/etc/init.d/apache2 restart