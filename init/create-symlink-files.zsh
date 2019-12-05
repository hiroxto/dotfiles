#!/usr/bin/env zsh

set -eu

echo "Create the symbolic link files."

for file in `ls -A1 ${HOME}/dotfiles/symbolic-link-files/` do
    link_from="${HOME}/dotfiles/symbolic-link-files/${file}"
    link_to="${HOME}/${file}"
    echo "Link ${link_from} to ${link_to}"

    if [ -e ${link_to} ]; then
        echo "File '${link_to}'' is already exist."
        echo "Skip create the symbolic link."
    else
        echo "Create the symbolic link to ${link_to}"
        ln -s ${link_from} ${link_to}
    fi
done
