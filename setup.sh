#!/bin/bash

if [ -e ~/.ssh/GitHub/id_rsa ];then
  GIT_URL=git://github.com/
else
  GIT_URL=git@github.com:
fi

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
    .railsrc
  )
  for file in ${files[@]}; do
    working_msg "Link $file -> ~/$file"
    ln -sf ~/dotfiles/$file ~/$file
  done
  finish
fi

echo -n "~/binのシンボリックリンクを作成しますか?[y/n]  ->  "
read input
if [ $input = "y" -o $input = "Y" ]; then
  if [ ! -e ~/bin ]; then
    ln -sf ~/dotfiles/bin ~/bin
    finish
  fi
fi

echo -n "oh-my-zshをインストールしますか?[y/n]  ->  "
read input
if [ $input = "y" -o $input = "Y" ]; then
  if [ ! -e ~/.oh-my-zsh ]; then
    working_msg "Install oh-my-zsh"
    git clone ${GIT_URL}robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
    finish
  fi
fi

echo -n "anyenvをインストールしますか?[y/n]  ->  "
read input
if [ $input = "y" -o $input = "Y" ]; then
  if [ ! -e ~/.anyenv ]; then
    working_msg "Install anyenv"
    git clone ${GIT_URL}riywo/anyenv ~/.anyenv
    exec $SHELL -l
    finish
  fi
fi

echo -n "*envをインストールしますか?[y/n]  ->  "
read input
if [ $input = "y" -o $input = "Y" ]; then
  for name in rbenv phpenv pyenv crenv ndenv; do
    working_msg "Install ${name}"
    anyenv install -f $name
    finish
  done
fi

echo -n "nanorcをセットアップしますか?[y/n]  ->  "
read input
if [ $input = "y" -o $input = "Y" ]; then
  if [ ! -e ~/.nano ]; then
    working_msg "Install nanorc"
    git clone ${GIT_URL}scopatz/nanorc ~/.nano
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
    git clone ${GIT_URL}Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
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
  working_msg "Link ~/dotfiles/.composer/composer.json to ~/.composer/composer.json"
  ln -sf ~/dotfiles/.composer/composer.json ~/.composer/composer.json
  working_msg "Link ~/dotfiles/.composer/composer.lock to ~/.composer/composer.lock"
  ln -sf ~/dotfiles/.composer/composer.lock ~/.composer/composer.lock
  working_msg "Link ~/dotfiles/.composer/config.json to ~/.composer/config.json"
  ln -sf ~/dotfiles/.composer/config.json ~/.composer/config.json
  working_msg "Install composer global package"
  composer g install
  finish
fi

echo -n "psyshをセットアップしますか?[y/n]  ->  "
read input
if [ $input = "y" -o $input = "Y" ]; then
  working_msg "Link ~/dotfiles/.local/share/psysh/php_manual.sqlite to ~/.local/share/psysh/php_manual.sqlite"
  ln -sf ~/dotfiles/.local/share/psysh/php_manual.sqlite ~/.local/share/psysh/php_manual.sqlite
  finish
fi