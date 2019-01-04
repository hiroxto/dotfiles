#!/bin/bash

set -eu

nanorc_dir="${HOME}/.nano"

echo "Install nanorc"
if [ ! -e ${nanorc_dir} ]; then
    git clone --depth 1 https://github.com/scopatz/nanorc ${nanorc_dir}
else
    echo "Skip"
fi
