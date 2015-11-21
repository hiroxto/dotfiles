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
    .gemrc
  )
  for file in ${files[@]}; do
    working_msg "Link $file -> ~/$file"
    #\cp -f $file ~/$file
    ln -sf ~/dotfiles/$file ~/$file
  done
  finish
fi

echo -n "oh-my-zshをインストールしますか?[y/n]  ->  "
read input
if [ $input = "y" -o $input = "Y" ]; then
  if [ ! -e ~/.oh-my-zsh ]; then
    working_msg "Install oh-my-zsh"
    git clone git@github.com:robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
    finish
  fi
fi

echo -n "rbenvをインストールしますか?[y/n]  ->  "
read input
if [ $input = "y" -o $input = "Y" ]; then
  if [ ! -e ~/.rbenv ]; then
    working_msg "Install rbenv"
    git clone git@github.com:sstephenson/rbenv.git ~/.rbenv
    git clone git@github.com:sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
    finish
  fi
fi

echo -n "phpenvをインストールしますか?[y/n]  ->  "
read input
if [ $input = "y" -o $input = "Y" ]; then
  if [ ! -e ~/.phpenv ]; then
    working_msg "Install phpenv"
    git clone git@github.com:CHH/phpenv.git /tmp/phpenv
    /tmp/phpenv/bin/phpenv-install.sh
    git clone git@github.com:CHH/php-build.git ~/.phpenv/plugins/php-build
    rm -rf /tmp/phpenv
    finish
  fi
fi

echo -n "pyenvをインストールしますか?[y/n]  ->  "
read input
if [ $input = "y" -o $input = "Y" ]; then
  if [ ! -e ~/.pyenv ]; then
    working_msg "Install pyenv"
    git clone git@github.com:yyuu/pyenv.git ~/.pyenv
    finish
  fi
fi

echo -n "nanorcをセットアップしますか?[y/n]  ->  "
read input
if [ $input = "y" -o $input = "Y" ]; then
  if [ ! -e ~/.nano ]; then
    working_msg "Install nanorc"
    git clone git@github.com:scopatz/nanorc ~/.nano
    cat nanorc.nanorc >> ~/.nanorc
    finish
  fi
fi

echo -n "vimをセットアップしますか?[y/n]  ->  "
read input
if [ $input = "y" -o $input = "Y" ]; then
  if [ ! -e ~/.vim/bundle ]; then
    working_msg "Install neobundle"
    mkdir -p ~/.vim/bundle
    git clone git@github.com:Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
    finish
  fi
  if [ ! -e ~/.vim/colors ]; then
    working_msg "Install vim color"
    mkdir -p ~/.vim/colors
    if [ ! -e ~/.vim/colors/molokai.vim ]; then
      working_msg "Install vim color (molokai)"
      curl -sS https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim >> ~/.vim/colors/molokai.vim
      finish
    fi
    if [ ! -e ~/.vim/colors/onedark.vim ]; then
      working_msg "Install vim color (onedark)"
      curl -sS https://raw.githubusercontent.com/geoffharcourt/one-dark.vim/master/colors/onedark.vim >> ~/.vim/colors/onedark.vim
      finish
    fi
  fi
fi

echo -n "composerをセットアップしますか?[y/n]  ->  "
read input
if [ $input = "y" -o $input = "Y" ]; then
  if [ ! type composer > /dev/null 2>&1 ]; then
    working_msg "Create /usr/bin/composer"
    curl -sS https://getcomposer.org/installer | php
    sudo mv composer.phar /usr/bin/composer
  fi
  if [ ! -e ~/.composer ]; then
    mkdir ~/.composer
  fi
  working_msg "Move ./.composer/composer.json to ~/.composer/composer.json"
  \cp -f ./.composer/composer.json ~/.composer/composer.json
  working_msg "Move ./composer/composer.lock to ~/.composer/composer.lock"
  \cp -f ./.composer/composer.lock ~/.composer/composer.lock
  working_msg "Install composer global package"
  composer g install
  finish
fi