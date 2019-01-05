#!/usr/bin/env zsh

set -eu

echo "Run dotfiles setup script"

for file in `ls -1 ./setups/*.zsh`; do
    echo "Load ${file}"
    source ${file}
    echo "Loaded ${file}"
done

echo "Loaded setup scripts."
