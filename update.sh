#!/bin/bash

dirs=(
  "$HOME/.rbenv"
  "$HOME/.rbenv/plugins/ruby-build"
  "$HOME/.phpenv"
  "$HOME/.phpenv/plugins/php-build"
  "$HOME/.pyenv"
  "$HOME/.crenv"
  "$HOME/.crenv/plugins/crystal-build"
  "$HOME/.nvm"
  "$HOME/.oh-my-zsh"
)

for dir in ${dirs[@]}; do
  if [ -e $dir ]; then
    echo $dir
    git -C $dir pull
  fi
done