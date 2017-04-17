#!/bin/bash

#
# Install all packages from repository for development
#

#
# Repository stuff
#

# Add the Oracle repro
apt-get -y install software-properties-common
apt-add-repository -y ppa:webupd8team/java

# Add MongoDB
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6
echo "deb [ arch=amd64 ] http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.4.list

# Add Elasticsearch
apt-get -y install apt-transport-https
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
echo "deb https://artifacts.elastic.co/packages/5.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-5.x.list

# Update and upgrade
apt-get update
apt-get -y upgrade

# Install some tools
apt -y install git make g++ cmake python python-pip

# Java
apt -y install oracle-java8-installer

# Upgrading pip
pip install --upgrade pip

# Imagemagick
apt -y install imagemagick

# MySQL
apt -y install mysql-server mysql-client

# MongoDB
# (courtesy of https://www.digitalocean.com/community/tutorials/how-to-install-mongodb-on-ubuntu-16-04)
apt -y install mongodb-org
# Copy systemd file
cp ../mongodb-systemd /etc/systemd/system/mongodb.service
# Unmask service (just in case)
systemctl unmask mongodb

# Disable autostart of MySQL
service mysql stop
update-rc.d mysql disable

# Disable autostart of MongoDB
service mongodb stop
update-rc.d mongodb disable

# ElasticSearch
# apt -y install elasticsearch

# Disable autostart of ElasticSearch
# service elasticsearch stop
# update-rc.d elasticsearch disable
# systemctl disable elasticsearch.service

