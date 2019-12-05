#!/usr/bin/env zsh

set -eu

echo "Create symbolic link dirs."

dirs=(
    bin
    .vim
    .zsh
)

for dir in ${dirs[@]}; do
    link_from="${HOME}/dotfiles/${dir}"
    link_to="${HOME}/${dir}"
    echo "Link ${link_from} to ${link_to}"

    if [ -e ${link_to} ]; then
        echo "File '${link_to}' is already exist."
        echo "Skip create symbolic link."
    else
        echo "Create symbolic link to ${link_to}"
        ln -s ${link_from} ${link_to}
    fi
done
