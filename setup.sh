#!/bin/bash
#
# Script for installing all kinds of stuff on Ubuntu
#
# -------------------------------------------
# make sure to run this script with sudo !!!!
# -------------------------------------------
#

# Check for run level
if (( $EUID != 0 )); then
	echo "---------------------------------------"
	echo "Please run this script as root or sudo!"
	echo "---------------------------------------"
	exit
fi

# Ask for ZSH or Bash shell
echo "--------------------------------------------------"
echo "With which shell would you like to use? [bash/zsh]"
echo "--------------------------------------------------"
read _shell
if [ $_shell = 'zsh' ]
then
	echo "Will install ZSH"
elif [ $_shell = 'bash' ]
then
	echo "Will use BASH"
	# Maybe we install bash-it here?
else
	echo "Nothing entered. Aborting..."
	exit
fi

# Where are we?
scriptDir=${PWD}

# General packages
./scripts/packages.sh

# Development packages
./scripts/packages-dev.sh

if [ $_shell = 'zsh' ]
then
	# ZSH
	./scripts/zsh.sh
fi

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

if [ $_shell = 'zsh' ]
# ZSH
then
	echo 'All done. Switching to ZSH...'
	# All done. Switch shell
	chsh -s /bin/zsh
fi



