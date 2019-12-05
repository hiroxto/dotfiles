#!/usr/bin/env zsh

set -eu

echo "Run dotfiles init scripts."

for file in `ls -1 ./init/*.zsh`; do
    echo "Load : ${file}"
    source ${file}
    echo "Loaded : ${file}"
    echo
done

echo "Loaded init scripts."
