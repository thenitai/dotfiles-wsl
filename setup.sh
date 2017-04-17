#!/bin/bash
#
# Script for installing all kinds of stuff on Ubuntu
#
# -------------------------------------------
# make sure to run this script with sudo !!!!
# -------------------------------------------
#

# Ask for ZSH or Bash shell


# Where are we?
scriptDir=${PWD}

# General packages
./scripts/packages.sh

# Development packages
./scripts/packages-dev.sh

# ZSH
# ./scripts/zsh.sh

# Node
./scripts/node.sh

## Configure stuff
echo 'Configuring things...'

# Create local repository directory
mkdir -p "$HOME/Documents/repos"
chown -r $USER "$HOME/Documents/repos"

# Link ZSH config
rm -f "$HOME/.zshrc"
rm -f "$HOME/.zshrc.d"
ln -s "$scriptDir/ohmyzsh/.zshrc" "$HOME/."
ln -s "$scriptDir/ohmyzsh/.zshrc.d" "$HOME/."

# Link vimrc
rm -f "$HOME/.vimrc"
ln -s "$scriptDir/vim/.vimrc" "$HOME/."

# Link Aliases
rm -f "$HOME/.aliases"
rm -f "$scriptDir/ohmyzsh/.zshrc.d/.aliases"
ln -s "$scriptDir/.aliases" "$HOME/.bash_aliases"

#echo 'All done. Switching to ZSH...'

# All done. Switch shell
#chsh -s /bin/zsh
