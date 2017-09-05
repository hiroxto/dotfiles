#!/bin/bash

if [ -f ${HOME}/.ssh/GitHub/id_rsa ];then
  GIT_URL=git@github.com:
else
  GIT_URL=git://github.com/
fi

echo "GIT_URL=${GIT_URL}"

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
    .npmrc
    .railsrc
    .tmux.conf
    .vimrc
    .zshrc
  )
  for file in ${files[@]}; do
    working_msg "Link ${HOME}/dotfiles/${file} to  ${HOME}/${file}"
    ln -sf ${HOME}/dotfiles/${file} ${HOME}/${file}
  done
finish

begin "zshrcをセットアップ"
  if [ ! -d ${HOME}/.zsh ]; then
    working_msg "Link ${HOME}/dotfiles/.zsh to ~/.zsh"
    ln -sf ${HOME}/dotfiles/.zsh ${HOME}/.zsh
  else
    working_msg "Skip"
  fi
finish

begin "~/binのシンボリックリンクを作成"
  if [ ! -d ~/bin ]; then
    working_msg "Link ~/dotfiles/bin to ~/bin"
    ln -sf ${HOME}/dotfiles/bin ${HOME}/bin
  else
    working_msg "Skip"
  fi
finish

begin "oh-my-zshをインストール"
  if [ ! -d ~/.oh-my-zsh ]; then
    working_msg "Install oh-my-zsh"
    git clone --depth 1 ${GIT_URL}robbyrussell/oh-my-zsh.git ${HOME}/.oh-my-zsh
  else
    working_msg "Skip"
  fi
finish

begin "anyenvをインストール"
  if [ ! -d ~/.anyenv ]; then
    working_msg "Install anyenv"
    git clone --depth 1 ${GIT_URL}riywo/anyenv ${HOME}/.anyenv
    # exec $SHELL -l
  else
    working_msg "Skip"
  fi
finish

begin "*envをインストール"
  for name in rbenv phpenv pyenv crenv ndenv; do
    begin "${name}をインストール"
      if [ ! -d ${HOME}/.anyenv/envs/${name} ];then
        working_msg "Install ${name}"
        anyenv install -f ${name}
      else
        working_msg "Skip"
      fi
    finish
  done
finish

begin "anyenv-updateをインストール"
  working_msg "Create ${HOME}/.anyenv/plugins directory"
  mkdir -p ${HOME}/.anyenv/plugins
  if [ ! -e ${HOME}/.anyenv/plugins/anyenv-update ];then
    working_msg "Install anyenv-update"
    git clone --depth 1 ${GIT_URL}znz/anyenv-update ${HOME}/.anyenv/plugins/anyenv-update
  else
    working_msg "Skip"
  fi
finish

begin ".nanorcをセットアップ"
  if [ ! -e ${HOME}/.nano ]; then
    working_msg "Install nanorc"
    git clone --depth 1 ${GIT_URL}scopatz/nanorc ${HOME}/.nano
  else
    working_msg "Skip"
  fi
finish

begin "vimをセットアップ"
  working_msg "Create ${HOME}/.vim directory"
  mkdir -p ${HOME}/.vim

  begin "dein.vimをインストール"
    if [ ! -d ${HOME}/.vim/dein/repos/github.com/Shougo/dein.vim ];then
      mkdir -p ${HOME}/.vim/dein/repos/github.com/Shougo/dein.vim
      git clone --depth 1 ${GIT_URL}Shougo/dein.vim ${HOME}/.vim/dein/repos/github.com/Shougo/dein.vim
    else
      working_msg "Skip"
    fi
  finish

  begin ".vimrcをリンク"
    if [ ! -d ${HOME}/.vim/userautoload ]; then
      working_msg "Link ${HOME}/dotfiles/.vim/userautoload to ${HOME}/.vim/userautoload"
      ln -sf ${HOME}/dotfiles/.vim/userautoload ${HOME}/.vim/userautoload
    else
      working_msg "Skip"
    fi
  finish

  begin "Vim cloorをセットアップ"
    working_msg "Create ${HOME}/.vim/colors directory"
    mkdir -p ${HOME}/.vim/colors

    begin "Molokaiをインストール"
      if [ -f ${HOME}/.vim/colors/molokai.vim ]; then
        working_msg "Remove molokai file"
        rm ${HOME}/.vim/colors/molokai.vim
      fi
      working_msg "Install molokai"
      curl -sS https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim >> ${HOME}/.vim/colors/molokai.vim
    finish

    begin "onedarkをインストール"
      if [ -f ${HOME}/.vim/colors/onedark.vim ]; then
        working_msg "Remove onedark file"
        rm ${HOME}/.vim/colors/onedark.vim
      fi
      working_msg "Install onedark"
      curl -sS https://raw.githubusercontent.com/geoffharcourt/one-dark.vim/master/colors/onedark.vim >> ${HOME}/.vim/colors/onedark.vim

    finish
  finish
finish

begin "composerをセットアップ"
  if [ ! -d ${HOME}/.composer ]; then
    working_msg "Create ${HOME}/.composer directory"
    mkdir ${HOME}/.composer
  fi

  begin "composerの設定をリンク"
    for file in composer.json composer.lock config.json;do
      working_msg "Link ${HOME}/dotfiles/.composer/${file} to ${HOME}/.composer/${file}"
      ln -sf ${HOME}/dotfiles/.composer/${file} ${HOME}/.composer/${file}
    done
  finish

  begin "composerのグローバルパッケージをインストール"
    working_msg "Install composer global package"
    composer g install
  finish
finish

begin "psyshをセットアップ"
  working_msg "Create ${HOME}/.local/share/psysh directory"
  mkdir -p ${HOME}/.local/share/psysh/
  working_msg "Link ${HOME}/dotfiles/.local/share/psysh/php_manual.sqlite to ${HOME}/.local/share/psysh/php_manual.sqlite"
  ln -sf ${HOME}/dotfiles/.local/share/psysh/php_manual.sqlite ${HOME}/.local/share/psysh/php_manual.sqlite
finish
