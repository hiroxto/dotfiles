#!/usr/bin/env zsh

set -eu

echo "Install prezto."

zprezto_dir="${HOME}/.zprezto"

if [ -d ${zprezto_dir} ]; then
    echo "zprezto is already installed."
    echo "Skip install."
else
    git clone --depth 1 --recursive https://github.com/sorin-ionescu/prezto ${zprezto_dir}
fi

echo "Link zprezto config files"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    link_to="${ZDOTDIR:-$HOME}/.${rcfile:t}"

    echo "Link ${rcfile} to ${link_to}"

    if [ -e ${link_to} ]; then
        echo "File '${link_to}' is already exist."
        echo "Skip create symbolic link."
    else
        echo "Create symbolic link to ${link_to}"
        ln -s "$rcfile" "${link_to}"
    fi
done
