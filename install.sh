#!/bin/sh

# Install dotfiles.
cd ~
rm -f .bash_logout .bash_profile .bashrc .bash_aliases .profile .hushlogin .vimrc .zshrc .tmux.conf .gitconfig
wget https://raw.githubusercontent.com/eigenfoo/georgelib/master/dotfiles/.bash_logout
wget https://raw.githubusercontent.com/eigenfoo/georgelib/master/dotfiles/.bash_profile
wget https://raw.githubusercontent.com/eigenfoo/georgelib/master/dotfiles/.bashrc
wget https://raw.githubusercontent.com/eigenfoo/georgelib/master/dotfiles/.bash_aliases
wget https://raw.githubusercontent.com/eigenfoo/georgelib/master/dotfiles/.profile
wget https://raw.githubusercontent.com/eigenfoo/georgelib/master/dotfiles/.hushlogin
wget https://raw.githubusercontent.com/eigenfoo/georgelib/master/dotfiles/.vimrc
wget https://raw.githubusercontent.com/eigenfoo/georgelib/master/dotfiles/.zshrc
wget https://raw.githubusercontent.com/eigenfoo/georgelib/master/dotfiles/.tmux.conf
# I usually have a .gitconfig for work.
# wget https://raw.githubusercontent.com/eigenfoo/georgelib/master/dotfiles/.gitconfig
source .bash_logout .bash_profile .bashrc .bash_aliases .profile .hushlogin .vimrc .zshrc .tmux.conf # .gitconfig

# Install bash scripts. Assumes that ~/bin/ is on the $PATH.
mkdir -p ~/bin/
cd ~/bin/
rm -f extract ff
wget https://raw.githubusercontent.com/eigenfoo/georgelib/master/bin/extract
wget https://raw.githubusercontent.com/eigenfoo/georgelib/master/bin/ff
chmod +x extract ff

# Install Vim plugins.
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

exit 0
