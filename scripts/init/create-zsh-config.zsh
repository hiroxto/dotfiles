#!/usr/bin/env zsh

set -eu

source "${0:A:h}/../lib/link.zsh"

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

    create_symlink "$rcfile" "${link_to}"
done
