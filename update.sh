#!/bin/sh

dir=(
  "$HOME/.rbenv"
  "$HOME/.rbenv/plugins/ruby-build"
  "$HOME/.phpenv"
  "$HOME/.phpenv/plugins/php-build"
  "$HOME/.pyenv"
)

for i in ${dir[@]}; do
  echo $i
  git -C $i pull
done