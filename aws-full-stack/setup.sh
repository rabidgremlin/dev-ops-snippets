#!/usr/bin/env bash

#uncomment this if you want to grab the latest ec inventory script
#mkdir inventory
#cd inventory
#wget https://raw.githubusercontent.com/ansible/ansible/devel/contrib/inventory/ec2.py
#wget https://raw.githubusercontent.com/ansible/ansible/devel/contrib/inventory/ec2.ini
#chmod +x ec2.py
#cd ..

mkdir keys
sudo apt-get install ansible
sudo apt-get install python-pip
sudo pip install boto
