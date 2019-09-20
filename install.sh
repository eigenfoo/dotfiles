#!/bin/sh
cd ~
rm -f .bash_logout .bash_profile .bashrc .bash_aliases .gitconfig .hushlogin .profile .vimrc .zshrc
wget https://raw.githubusercontent.com/eigenfoo/dotfiles/master/bash/.bash_logout
wget https://raw.githubusercontent.com/eigenfoo/dotfiles/master/bash/.bash_profile
wget https://raw.githubusercontent.com/eigenfoo/dotfiles/master/bash/.bashrc
wget https://raw.githubusercontent.com/eigenfoo/dotfiles/master/bash/.bash_aliases
wget https://raw.githubusercontent.com/eigenfoo/dotfiles/master/bash/.profile
wget https://raw.githubusercontent.com/eigenfoo/dotfiles/master/bash/.hushlogin
wget https://raw.githubusercontent.com/eigenfoo/dotfiles/master/git/.gitconfig
wget https://raw.githubusercontent.com/eigenfoo/dotfiles/master/vim/.vimrc
wget https://raw.githubusercontent.com/eigenfoo/dotfiles/master/zsh/.zshrc
source .bash_logout .bash_profile .bashrc .bash_aliases .gitconfig .hushlogin .profile .vimrc .zshrc
exit 0
