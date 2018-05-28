#!/bin/bash

apt-get -y update
apt-get install -y nfs-kernel-server

chown nobody:nogroup /var/www/html


sed -i "/# \/srv\/nfs4\/homes  gss\/krb5i(rw,sync,no_subtree_check)/a \/var\/www\/html      192.168.33.11(rw,sync,no_root_squash,no_subtree_check)" /etc/exports

systemctl restart nfs-kernel-server