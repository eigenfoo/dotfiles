#!/bin/sh

# Install dotfiles.
cd ~
rm -f .bash_logout .bash_profile .bashrc .bash_aliases .profile .hushlogin .vimrc .zshrc .tmux.conf .gitconfig
wget https://raw.githubusercontent.com/eigenfoo/dotfiles/master/bash/.bash_logout
wget https://raw.githubusercontent.com/eigenfoo/dotfiles/master/bash/.bash_profile
wget https://raw.githubusercontent.com/eigenfoo/dotfiles/master/bash/.bashrc
wget https://raw.githubusercontent.com/eigenfoo/dotfiles/master/bash/.bash_aliases
wget https://raw.githubusercontent.com/eigenfoo/dotfiles/master/bash/.profile
wget https://raw.githubusercontent.com/eigenfoo/dotfiles/master/bash/.hushlogin
wget https://raw.githubusercontent.com/eigenfoo/dotfiles/master/vim/.vimrc
wget https://raw.githubusercontent.com/eigenfoo/dotfiles/master/zsh/.zshrc
wget https://raw.githubusercontent.com/eigenfoo/dotfiles/master/tmux/.tmux.conf
# I usually have a .gitconfig for work.
# wget https://raw.githubusercontent.com/eigenfoo/dotfiles/master/git/.gitconfig
source .bash_logout .bash_profile .bashrc .bash_aliases .profile .hushlogin .vimrc .zshrc .tmux.conf # .gitconfig

# Install bash scripts. Assumes that ~/bin/ is on the $PATH.
mkdir -p ~/bin/
cd ~/bin/
wget https://raw.githubusercontent.com/eigenfoo/dotfiles/master/bin/extract
chmod +x extract

# Install Vim plugins.
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

exit 0
