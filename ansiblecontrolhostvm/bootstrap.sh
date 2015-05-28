#!/bin/sh

# add ansible repo
apt-get install software-properties-common
apt-add-repository ppa:ansible/ansible

# update package lists
apt-get update

# install ansible + source ctrl tools
apt-get -y install ansible git subversion

echo "versions installed:"
ansible --version | head -1
git --version | head -1
svn --version | head -1

echo "Done."