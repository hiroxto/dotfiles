#!/usr/bin/env zsh

set -eu

echo "Create symbolic link files."

# dotfiles の symlink-files 以下に入っているファイルを自動でリンク
for file in `ls -A1 ${HOME}/dotfiles/symlink-files/`; do
    link_from="${HOME}/dotfiles/symlink-files/${file}"
    link_to="${HOME}/${file}"
    echo "Link ${link_from} to ${link_to}"

    if [ -e ${link_to} ]; then
        echo "File '${link_to}' is already exist."
        echo "Skip create symbolic link."
    else
        echo "Create symbolic link to ${link_to}"
        ln -s ${link_from} ${link_to}
    fi
done

# 手動でリンクするファイルを設定
manually_files=(
    .composer/composer.json
    .composer/composer.lock
    .composer/config.json
)
for manually_file in ${manually_files[@]}; do
    link_from="${HOME}/dotfiles/${manually_file}"
    link_to="${HOME}/${manually_file}"

    link_to_dirname=`dirname ${link_to}`
    echo "Create directory : ${link_to_dirname}"
    mkdir -p ${link_to_dirname}

    echo "Link ${link_from} to ${link_to}"

    if [ -e ${link_to} ]; then
        echo "File '${link_to}' is already exist."
        echo "Skip create symbolic link."
    else
        echo "Create symbolic link to ${link_to}"
        ln -s ${link_from} ${link_to}
    fi
done
