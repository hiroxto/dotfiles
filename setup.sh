#!/bin/sh

echo -n "ファイルを移動しますか?[y/n]  ->  "
read res
case $res in
  [yY])
    mv .editorconfig ~/.editorconfig
    mv .zshrc ~/.zshrc
    mv .nanorc ~/.nanorc
    mv .vimrc ~/.vimrc
    mv .tmux.conf ~/.tmux.conf
    mv .gitignore_global ~/.gitignore_global
    mv .gitconfig ~/.gitconfig
    mv .hgignore_global ~/.hgignore_global
    mv .hgrc ~/.hgrc
  ;;
  [nN])
  ;;
esac

echo -n "oh-my-zshをインストールしますか?[y/n]  ->  "
read res
case $res in
  [yY])
    git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
  ;;
  [nN])
  ;;
esac

echo -n "rbenvをインストールしますか?[y/n]  ->  "
read res
case $res in
  [yY])
    git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
    git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
  ;;
  [nN])
  ;;
esac

echo -n "phpenvをインストールしますか?[y/n]  ->  "
read res
case $res in
  [yY])
    git clone https://github.com/CHH/phpenv.git /tmp/phpenv
    /tmp/phpenv/bin/phpenv-install.sh
    git clone https://github.com/CHH/php-build.git ~/.phpenv/plugins/php-build
    rm -rf /tmp/phpenv
  ;;
  [nN])
  ;;
esac

echo -n "pyenvをインストールしますか?[y/n]  ->  "
read res
case $res in
  [yY])
    git clone git://github.com/yyuu/pyenv.git ~/.pyenv
  ;;
  [nN])
  ;;
esac

echo -n "nanorcをセットアップしますか?[y/n]  ->  "
read res
case $res in
  [yY])
    git clone git://github.com/scopatz/nanorc ~/.nano
    cat nanorc.nanorc >> ~/.nanorc
  ;;
  [nN])
  ;;
esac

echo -n "vimをセットアップしますか?[y/n]  ->  "
read res
case $res in
  [yY])
    mkdir -p ~/.vim/bundle
    git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
    mkdir -p ~/.vim/colors
    curl -sS https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim >> ~/.vim/colors/molokai.vim
  ;;
  [nN])
  ;;
esac