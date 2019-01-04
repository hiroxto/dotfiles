#!/usr/bin/env zsh

set -eu

echo "Setup psysh"

psysh_dir="${HOME}/.local/share/psysh"

echo "Create ${psysh_dir} directory"
mkdir -p ${psysh_dir}

link_from="${HOME}/dotfiles/.local/share/psysh/php_manual.sqlite"
link_to="${HOME}/.local/share/psysh/php_manual.sqlite"

echo "Link ${link_from} to ${link_to}"
ln -sf ${link_from} ${link_to}
