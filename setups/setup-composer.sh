#!/bin/bash

set -eu

echo "Setup composer configs"

composer_dir="${HOME}/.composer"

echo "Create the ${composer_dir} directory"
mkdir ${composer_dir}

echo "Link the composer files."
for file in composer.json composer.lock config.json;do
    from="${HOME}/dotfiles/.composer/${file}"
    to="${HOME}/.composer/${file}"
    echo "Link ${from} to ${to}"
    ln -sf ${from} ${to}
done

echo "Install the composer global package"
composer g install
