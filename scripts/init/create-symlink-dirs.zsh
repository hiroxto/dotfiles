#!/usr/bin/env zsh

set -eu

source "${0:A:h}/../lib/link.zsh"

echo "Create symbolic link dirs."

dirs=(
    bin-dotfiles
    .zsh
)

for dir in ${dirs[@]}; do
    link_from="${HOME}/dotfiles/symlinks/dirs/${dir}"
    link_to="${HOME}/${dir}"

    link_to_dir=`dirname ${link_to}`

    echo "Create directory : ${link_to_dir}"
    mkdir -p ${link_to_dir}

    create_symlink ${link_from} ${link_to}
done
