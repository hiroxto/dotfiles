#!/usr/bin/env zsh

set -eu

echo "Install prezto."

zprezto_dir="${HOME}/.zprezto"

if [ -d ${zprezto_dir} ]; then
    echo "zprezto is already installed."
    echo "Skip install."
else
    git clone --depth 1 --recursive https://github.com/sorin-ionescu/prezto ${zprezto_dir}

    echo "Link zprezto config files"
    setopt EXTENDED_GLOB
    for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
        ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
    done
fi
