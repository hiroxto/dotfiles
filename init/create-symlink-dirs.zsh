#!/usr/bin/env zsh

set -eu

echo "Create symbolic link dirs."

dirs=(
    bin
    .vim/userautoload
    .zsh
)

for dir in ${dirs[@]}; do
    link_from="${HOME}/dotfiles/${dir}"
    link_to="${HOME}/${dir}"

    link_to_dir=`dirname ${link_to}`

    echo "Create directory : ${link_to_dir}"
    mkdir -p ${link_to_dir}

    echo "Link ${link_from} to ${link_to}"

    if [ -e ${link_to} ]; then
        echo "File '${link_to}' is already exist."
        echo "Skip create symbolic link."
    else
        echo "Create symbolic link to ${link_to}"
        ln -s ${link_from} ${link_to}
    fi
done
