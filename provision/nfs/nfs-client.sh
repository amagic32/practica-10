#!/bin/bash

sudo apt-get -y update
sudo apt-get install -y nfs-common

mount 192.168.33.10:/var/www/html /var/www/html

sed -i "/LABEL=cloudimg-rootfs   \/        ext4   defaults        0 0/a 192.168.33.10:\/var\/www\/html \/var\/www\/html  nfs auto,nofail,noatime,nolock,intr,tcp,actimeo=1800 0 0" /etc/fstab


