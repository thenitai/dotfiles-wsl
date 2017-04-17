#!/bin/bash

#
# Install all packages from repository
#
# Repository stuff
#

# Enable Universe repro
add-apt-repository -y universe

# Update and upgrade
apt-get update
apt-get -y upgrade

# ZSH
apt -y install zsh aptitude tmux s3cmd exuberant-ctags preload exfat-fuse exfat-utils p7zip-full ntp fonts-font-awesome curl

# NTP restart
service ntp restart
