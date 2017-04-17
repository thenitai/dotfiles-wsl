#!/bin/bash

#
# Install node and global packages
#

echo 'Installing node and global npm libs'

curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
apt -y install nodejs

npm -g install nodemon
npm -g install node-dev
npm -g install mocha
npm -g install should
npm -g install expect
npm -g install n

# Activate Node
n lts

