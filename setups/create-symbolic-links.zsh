#!/usr/bin/env zsh

set -eu

echo "Create the symbolic links."

files=(
    .editorconfig
    .gemrc
    .gitconfig
    .gitignore_global
    .hgignore_global
    .hgrc
    .nanorc
    .npmrc
    .railsrc
    .tmux.conf
    .vimrc
)
for file in ${files[@]}; do
    from="${HOME}/dotfiles/${file}"
    to="${HOME}/${file}"
    echo "Link ${from} to ${to}"

    if [ -d ${to} ]; then
        echo "File ${to} is already exist."
        echo "Skip create the symbolic link."
    else
        echo "Create the symbolic link to ${to}"
        ln -s ${from} ${to}
    fi
done

echo "Link the bin directory."
bin_dir="${HOME}/bin"
dotfiles_bin_dir="${HOME}/dotfiles/bin"
echo "Link ${dotfiles_bin_dir} to ${bin_dir}"
if [ -d ${bin_dir} ]; then
    echo "Directory ${bin_dir} is already exist."
    echo "Skip create the symbolic link."
else
    echo "Create the symbolic link to ${bin_dir}"
    ln -s ${dotfiles_bin_dir} ${bin_dir}
fi
