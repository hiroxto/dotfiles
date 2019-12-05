#!/usr/bin/env zsh

set -eu

echo "Setup composer configs"

composer_dir="${HOME}/.composer"

echo "Create the ${composer_dir} directory"
mkdir -p ${composer_dir}

echo "Link the composer files."
for file in composer.json composer.lock config.json;do
    link_from="${HOME}/dotfiles/.composer/${file}"
    link_to="${HOME}/.composer/${file}"
    echo "Link ${link_from} to ${link_to}"

    if [ -e ${link_to} ]; then
        echo "File ${link_to} is already exist."
        echo "Skip create the symbolic link."
    else
        echo "Create the symbolic link to ${link_to}"
        ln -s ${link_from} ${link_to}
    fi
done

echo "Install the composer global package"
if type "php" > /dev/null 2>&1; then
    composer g install
else
    echo "php command does not exist!"
    echo "Skip the composer global install."
fi
