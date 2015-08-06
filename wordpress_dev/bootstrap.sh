#!/usr/bin/env bash

# update all packages
apt-get update

# install mysql
debconf-set-selections <<< 'mysql-server mysql-server/root_password password password'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password password'
apt-get -y install mysql-server

# set up wordpress database and user
mysql -u root -ppassword -e "CREATE DATABASE wordpress";
mysql -u root -ppassword -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'username'@'%' IDENTIFIED BY 'password' WITH GRANT OPTION; FLUSH PRIVILEGES;"

# install apache
apt-get -y install apache2 php5 php5-mysql

# install wordpress
cd /tmp
wget http://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz
cp -R /tmp/wordpress/* /var/www/html
rm /var/www/html/index.html
chown -R www-data:www-data html



echo "Browse to http://localhost/ to complete your installation. (use default values)"

echo "Done."