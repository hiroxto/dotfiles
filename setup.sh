#!/bin/sh

finish() {
  echo -e "\033[0;36mFinish!\033[0;39m"
}

working_msg() {
  echo -e "\033[0;37m$1\033[0;39m"
}

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
    working_msg "Move $file to ~/$file"
    \cp -f $file ~/$file
  done
  finish
fi

echo -n "oh-my-zshをインストールしますか?[y/n]  ->  "
read input
if [ $input = "y" -o $input = "Y" ]; then
  git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
  finish
fi

echo -n "rbenvをインストールしますか?[y/n]  ->  "
read input
if [ $input = "y" -o $input = "Y" ]; then
  git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
  git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
  finish
fi

echo -n "phpenvをインストールしますか?[y/n]  ->  "
read input
if [ $input = "y" -o $input = "Y" ]; then
  git clone https://github.com/CHH/phpenv.git /tmp/phpenv
  /tmp/phpenv/bin/phpenv-install.sh
  git clone https://github.com/CHH/php-build.git ~/.phpenv/plugins/php-build
  rm -rf /tmp/phpenv
  finish
fi

echo -n "pyenvをインストールしますか?[y/n]  ->  "
read input
if [ $input = "y" -o $input = "Y" ]; then
  git clone git://github.com/yyuu/pyenv.git ~/.pyenv
  finish
fi

echo -n "nanorcをセットアップしますか?[y/n]  ->  "
read input
if [ $input = "y" -o $input = "Y" ]; then
  git clone git://github.com/scopatz/nanorc ~/.nano
  cat nanorc.nanorc >> ~/.nanorc
  finish
fi

echo -n "vimをセットアップしますか?[y/n]  ->  "
read input
if [ $input = "y" -o $input = "Y" ]; then
  mkdir -p ~/.vim/bundle
  git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
  mkdir -p ~/.vim/colors
  curl -sS https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim >> ~/.vim/colors/molokai.vim
  finish
fi

echo -n "composerをセットアップしますか?[y/n]  ->  "
read input
if [ $input = "y" -o $input = "Y" ]; then
  if type composer > /dev/null 2>&1 ; then
    working_msg "Create /usr/bin/composer"
    curl -sS https://getcomposer.org/installer | php
    sudo mv composer.phar /usr/bin/composer
  fi
  mkdir ~/.composer
  working_msg "Move ./.composer/composer.json to ~/composer.json"
  \cp -f .composer/composer.json ~/composer.json
  working_msg "Move ./composer/composer.lock to ~/composer.lock"
  \cp -f .composer/composer.lock ~/composer.lock
  working_msg "Install composer global package"
  composer g install
  finish
fi