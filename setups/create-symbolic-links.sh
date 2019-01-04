#!/bin/bash

set -eu

echo "Create the symbolic links."

files=(
    bin
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
)
for file in ${files[@]}; do
    from="${HOME}/dotfiles/${file}"
    to="${HOME}/${file}"
    echo "Link ${from} to ${to}"

    if [ -d ${to} ]; then
        echo "Skip"
    else
        echo "Link ${from} to ${to}"
        ln -sf ${from} ${to}
    fi
done
