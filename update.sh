#!/bin/sh

dir=(
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

for i in ${dir[@]}; do
  if [ -e $i ]; then
    echo $i
    git -C $i pull
  fi
done