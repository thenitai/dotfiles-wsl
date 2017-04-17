# dotfiles-wsl
Dotfiles for the Windows 10 WSL (Windows Subsystem for Linux)

WSL doesn't change the shell on startup.To do so edit .bashrc and add:

# Switch to ZSH shell
if test -t 1; then
exec zsh
fi
