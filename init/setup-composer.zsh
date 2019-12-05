#!/usr/bin/env zsh

set -eu

echo "Setup composer configs"

composer_dir="${HOME}/.composer"

echo "Create the ${composer_dir} directory"
mkdir -p ${composer_dir}

echo "Install the composer global package"
if type "php" > /dev/null 2>&1; then
    composer g install
else
    echo "php command does not exist!"
    echo "Skip the composer global install."
fi
