#!/usr/bin/env zsh

set -eu

nanorc_dir="${HOME}/.nano"

echo "Install nanorc"
if [ -e ${nanorc_dir} ]; then
    echo "Directory ${nanorc_dir} is already exist."
    echo "Skip install the nanorc."
else
    git clone --depth 1 https://github.com/scopatz/nanorc ${nanorc_dir}
fi
