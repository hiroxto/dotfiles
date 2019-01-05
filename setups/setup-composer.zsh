#!/usr/bin/env zsh

set -eu

echo "Setup composer configs"

composer_dir="${HOME}/.composer"

echo "Create the ${composer_dir} directory"
mkdir -p ${composer_dir}

echo "Link the composer files."
for file in composer.json composer.lock config.json;do
    from="${HOME}/dotfiles/.composer/${file}"
    to="${HOME}/.composer/${file}"
    echo "Link ${from} to ${to}"

    if [ -d ${to} ]; then
        echo "File ${to} is already exist."
        echo "Skip create the symbolic link."
    else
        echo "Create the symbolic link to ${to}"
        ln -s ${from} ${to}
    fi
done

echo "Install the composer global package"
if type "php" > /dev/null 2>&1; then
    composer g install
else
    echo "php command not does not exist!"
    echo "Skip the composer global install."
fi
