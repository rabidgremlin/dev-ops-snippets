#!/bin/sh

# add ansible repo
apt-get install software-properties-common
apt-add-repository ppa:nginx/stable

# update package lists
apt-get update

# install ansible + source ctrl tools
apt-get -y install nginx

# override default config to load content from host disk
cp /vagrant/nginx_conf /etc/nginx/sites-enabled/default
service nginx restart

echo "versions installed:"
nginx -v

echo "Browse to http://127.0.0.1:8989/"
echo "Done."