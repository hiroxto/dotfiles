#!/bin/bash

if [ -e ~/.ssh/GitHub/id_rsa ];then
  GIT_URL=git://github.com/
else
  GIT_URL=git@github.com:
fi

begin() {
  echo -e "\033[0;36m$1\033[0;39m"
}

finish() {
  echo -e "\033[0;36mFinish!\033[0;39m"
}

working_msg() {
  echo -e "\033[0;37m$1\033[0;39m"
}

begin "シンボリックリンクを作成"
  files=(
    .editorconfig
    .gemrc
    .gitconfig
    .gitignore_global
    .hgignore_global
    .hgrc
    .nanorc
    .railsrc
    .tmux.conf
    .vimrc
    .zshrc
  )
  for file in ${files[@]}; do
    working_msg "Link ~/dotfiles/${file} to  ~/${file}"
    ln -sf ~/dotfiles/${file} ~/${file}
  done
finish

begin "zshrcをセットアップ"
  if [ ! -e ~/.zsh ]; then
    working_msg "Link ~/dotfiles/.zsh to ~/.zsh"
    ln -sf ~/dotfiles/.zsh ~/.zsh
  fi
finish

begin "~/binのシンボリックリンクを作成"
  if [ ! -e ~/bin ]; then
    working_msg "Link ~/dotfiles/bin to ~/bin"
    ln -sf ~/dotfiles/bin ~/bin
  fi
finish

begin "oh-my-zshをインストール"
  if [ ! -e ~/.oh-my-zsh ]; then
    working_msg "Install oh-my-zsh"
    git clone ${GIT_URL}robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
  fi
finish

begin "anyenvをインストール"
  if [ ! -e ~/.anyenv ]; then
    working_msg "Install anyenv"
    git clone ${GIT_URL}riywo/anyenv ~/.anyenv
    exec $SHELL -l
  fi
finish

begin "*envをインストール"
  for name in rbenv phpenv pyenv crenv ndenv; do
    begin "${name}をインストール"
      if [ -f ~/.anyenv/envs/${name} ];then
        working_msg "Install ${name}"
        anyenv install -f ${name}
      fi
    finish
  done
finish

begin ".nanorcをセットアップ"
  if [ ! -e ~/.nano ]; then
    working_msg "Install nanorc"
    git clone ${GIT_URL}scopatz/nanorc ~/.nano
  fi
finish

begin "vimをセットアップ"
  working_msg "Create ~/.vim directory"
  mkdir -p ~/.vim

  begin "dein.vimをインストール"
    if [ ! -e ~/.vim/dein/repos/github.com/Shougo/dein.vim ];then
      mkdir -p ~/.vim/dein/repos/github.com/Shougo/dein.vim
      git clone ${GIT_URL}Shougo/dein ~/.vim/dein/repos/github.com/Shougo/dein.vim
    fi
  finish

  begin ".vimrcをリンク"
    if [ ! -e ~/.vim/userautoload ]; then
      working_msg "Link ~/dotfiles/.vim/userautoload to ~/.vim/userautoload"
      ln -sf ~/dotfiles/.vim/userautoload ~/.vim/userautoload
    fi
  finish

  begin "Vim cloorをセットアップ"
    working_msg "Create ~/.vim/colors directory"
    mkdir -p ~/.vim/colors

    begin "Molokaiをインストール"
      if [ ! -e ~/.vim/colors/molokai.vim ]; then
        working_msg "Install molokai"
        curl -sS https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim >> ~/.vim/colors/molokai.vim
      fi
    finish

    begin "onedarkをインストール"
      if [ ! -e ~/.vim/colors/onedark.vim ]; then
        working_msg "Install onedark"
        curl -sS https://raw.githubusercontent.com/geoffharcourt/one-dark.vim/master/colors/onedark.vim >> ~/.vim/colors/onedark.vim
      fi
    finish
  finish
finish

begin "composerをセットアップ"
  if [ ! -e ~/.composer ]; then
    working_msg "Create ~/.composer directory"
    mkdir ~/.composer
  fi

  begin "composerの設定をリンク"
    for file in composer.json composer.lock config.json;do
      working_msg "Link ~/dotfiles/.composer/${file} to ~/.composer/${file}"
      ln -sf ~/dotfiles/.composer/${file} ~/.composer/{$file}
    done
  finish

  begin "composerのグローバルパッケージをインストール"
    working_msg "Install composer global package"
    composer g install
  finish
finish

begin "psyshをセットアップ"
  working_msg "Create ~/.local/share/psysh directory"
  mkdir -p ~/.local/share/psysh/php_manual
  working_msg "Link ~/dotfiles/.local/share/psysh/php_manual.sqlite to ~/.local/share/psysh/php_manual.sqlite"
  ln -sf ~/dotfiles/.local/share/psysh/php_manual.sqlite ~/.local/share/psysh/php_manual.sqlite
finish