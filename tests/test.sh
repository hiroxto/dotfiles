#!/bin/bash

set -eu

begin() {
  echo -e "\033[0;36m$1\033[0;39m"
}

working_msg() {
  echo -e "\033[0;37m$1\033[0;39m"
}

finish() {
  echo -e "\033[0;36mFinish!\033[0;39m"
}

check_file_exists() {
  begin "Check '${1}' file."
    if [ -f ${1} ];then
      working_msg "File '${1}' is exists."
    else
      working_msg "File '${1}' is not exists."
      exit 1
    fi
  finish
}

check_dir_exists() {
  begin "Check '${1}' directory."
    if [ -d ${1} ];then
      working_msg "Directory '${1}' is exists."
    else
      working_msg "Directory '${1}' is not exists."
      exit 1
    fi
  finish
}

check_symlink_exists() {
  begin "Check '${1}' symlink directory."
    if [ -L ${1} ];then
      working_msg "Symlink directory '${1}' is exists."
    else
      working_msg "Symlink directory '${1}' is not exists."
      exit 1
    fi
  finish
}

begin "Check 'setup.sh' syntax."
  bash -n setup.sh
finish

begin "Check 'bin/pull-dotfiles' syntax."
  bash -n bin/pull-dotfiles
finish

begin "Run 'setup.sh'."
  output=$(bash setup.sh)
finish

check_file_exists "${HOME}/.zshrc"
check_file_exists "${HOME}/.vimrc"
check_symlink_exists "${HOME}/.zsh"
check_symlink_exists "${HOME}/bin"
check_dir_exists "${HOME}/.oh-my-zsh"
check_dir_exists "${HOME}/.anyenv"
check_dir_exists "${HOME}/.anyenv/plugins/anyenv-update"
check_dir_exists "${HOME}/.nano"
check_dir_exists "${HOME}/.vim"
check_dir_exists "${HOME}/.vim/dein/repos/github.com/Shougo/dein.vim"
check_symlink_exists "${HOME}/.vim/userautoload"
check_dir_exists "${HOME}/.vim/colors"
check_file_exists "${HOME}/.vim/colors/molokai.vim"
check_file_exists "${HOME}/.vim/colors/onedark.vim"
check_dir_exists "${HOME}/.composer"
check_file_exists "${HOME}/.composer/composer.json"
check_dir_exists "${HOME}/.local/share/psysh/"
check_file_exists "${HOME}/.local/share/psysh/php_manual.sqlite"
