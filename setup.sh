#!/bin/sh

echo -n "ファイルを移動しますか?[y/n]  ->  "
read input
if [ $input = "y" -o $input = "Y" ]; then
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
fi

echo -n "oh-my-zshをインストールしますか?[y/n]  ->  "
read input
if [ $input = "y" -o $input = "Y" ]; then
  git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi

echo -n "rbenvをインストールしますか?[y/n]  ->  "
read input
if [ $input = "y" -o $input = "Y" ]; then
  git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
  git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
fi

echo -n "phpenvをインストールしますか?[y/n]  ->  "
read input
if [ $input = "y" -o $input = "Y" ]; then
  git clone https://github.com/CHH/phpenv.git /tmp/phpenv
  /tmp/phpenv/bin/phpenv-install.sh
  git clone https://github.com/CHH/php-build.git ~/.phpenv/plugins/php-build
  rm -rf /tmp/phpenv
fi

echo -n "pyenvをインストールしますか?[y/n]  ->  "
read input
if [ $input = "y" -o $input = "Y" ]; then
  git clone git://github.com/yyuu/pyenv.git ~/.pyenv
fi

echo -n "nanorcをセットアップしますか?[y/n]  ->  "
read input
if [ $input = "y" -o $input = "Y" ]; then
  git clone git://github.com/scopatz/nanorc ~/.nano
  cat nanorc.nanorc >> ~/.nanorc
fi

echo -n "vimをセットアップしますか?[y/n]  ->  "
read input
if [ $input = "y" -o $input = "Y" ]; then
  mkdir -p ~/.vim/bundle
  git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
  mkdir -p ~/.vim/colors
  curl -sS https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim >> ~/.vim/colors/molokai.vim
fi