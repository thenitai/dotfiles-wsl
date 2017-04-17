#!/bin/bash

#
# Fetches remote apps and installs them
#

echo 'Downloading and installing apps'

# Installing ZSH
echo 'Installing ZSH Shell...'
cd "$HOME"
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# Install powerline
echo 'Powerline stuff'
sudo pip install powerline-status
cd "$HOME"
mkdir -p .fonts
mkdir -p .config/fontconfig/conf.d
wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf 
wget https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
mv PowerlineSymbols.otf .fonts/
fc-cache -vf
mv 10-powerline-symbols.conf .config/fontconfig/conf.d/

