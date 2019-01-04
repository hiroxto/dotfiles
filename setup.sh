#!/bin/bash

set -eu

echo "Run dotfiles setup script"

for file in `ls -1 ./setups/*.sh`; do
    echo "Load ${file}"
    source ${file}
    echo "Loaded ${file}"
done
