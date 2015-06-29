#!/bin/sh
echo "Move files."
mv .editorconfig ~/.editorconfig
mv .zshrc ~/.zshrc
mv .nanorc ~/.nanorc
mv .vimrc ~/.vimrc
mv .gitignore_global ~/.gitignore_global
mv .gitconfig ~/.gitconfig

# oh-my-zsh
echo "Setup oh-my-zsh"
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# nanorc
echo "Setup nanorc"
mkdir ~/nanorc
curl -sS https://nanosyntax.googlecode.com/svn/trunk/syntax-nanorc/apache2.nanorc > ~/nanorc/apache2.nanorc
curl -sS https://nanosyntax.googlecode.com/svn/trunk/syntax-nanorc/apacheconf.nanorc > ~/nanorc/apacheconf.nanorc
curl -sS https://nanosyntax.googlecode.com/svn/trunk/syntax-nanorc/js.nanorc > ~/nanorc/js.nanorc
curl -sS https://nanosyntax.googlecode.com/svn/trunk/syntax-nanorc/vhost.nanorc > ~/nanorc/vhost.nanorc

# vim
# neobundle
echo "Setup vim"
mkdir -p ~/.vim/bundle
git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

# molokai
mkdir -p ~/.vim/colors
curl -sS https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim > ~/.vim/colors/molokai.vim

echo "Finish!"