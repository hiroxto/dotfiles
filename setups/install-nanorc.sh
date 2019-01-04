#!/usr/bin/env zsh

set -eu

nanorc_dir="${HOME}/.nano"

echo "Install nanorc"
if [ -e ${nanorc_dir} ]; then
    echo "Skip"
else
    git clone --depth 1 https://github.com/scopatz/nanorc ${nanorc_dir}
fi
