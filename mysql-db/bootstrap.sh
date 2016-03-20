#!/usr/bin/env bash

apt-get update

sudo apt-get update

debconf-set-selections <<< 'mysql-server mysql-server/root_password password password123'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password password123'

apt-get -y install mysql-server
sed -i "s/^bind-address/#bind-address/" /etc/mysql/my.cnf
mysql -u root -ppassword123 -e "CREATE DATABASE dev;"
mysql -u root -ppassword123 -e "GRANT ALL PRIVILEGES ON dev.* TO 'dev'@'%' IDENTIFIED BY 'password123' WITH GRANT OPTION; FLUSH PRIVILEGES;"

service mysql restart

echo "Done!"
