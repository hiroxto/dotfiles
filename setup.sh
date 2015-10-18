#!/bin/sh

echo -n "ファイルを移動しますか?[y/n]  ->  "
read res
case $res in
  [yY])
    files=(
      .zshrc
      .vimrc
      .tmux.conf
      .editorconfig
      .nanorc
      .gitconfig
      .gitignore_global
      .hgrc
      .hgignore_global
    )
    for file in ${files[@]}; do
      mv $file ~/$file
    done
  ;;
esac

echo -n "oh-my-zshをインストールしますか?[y/n]  ->  "
read res
case $res in
  [yY])
    git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
  ;;
esac

echo -n "rbenvをインストールしますか?[y/n]  ->  "
read res
case $res in
  [yY])
    git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
    git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
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
esac

echo -n "pyenvをインストールしますか?[y/n]  ->  "
read res
case $res in
  [yY])
    git clone git://github.com/yyuu/pyenv.git ~/.pyenv
  ;;
esac

echo -n "nanorcをセットアップしますか?[y/n]  ->  "
read res
case $res in
  [yY])
    git clone git://github.com/scopatz/nanorc ~/.nano
    cat nanorc.nanorc >> ~/.nanorc
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
esac