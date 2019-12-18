#!/usr/bin/env zsh

set -eu

echo "Run dotfiles init scripts.\n"

for file in `ls -1 ./init/*.zsh`; do
    echo "Load : ${file}"
    source ${file}
    echo "Loaded : ${file}\n"
done

echo "Loaded init scripts."
