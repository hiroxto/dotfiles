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

    echo "Link ${from} to ${to}"
    ln -sf ${from} ${to}
done

echo "Link the bin directory."
bin_dir="${HOME}/bin"
dotfiles_bin_dir="${HOME}/dotfiles/bin"
if [ -d ${bin_dir} ]; then
    echo "Skip"
else
    echo "Link ${dotfiles_bin_dir} to ${bin_dir}"
    ln -sf ${dotfiles_bin_dir} ${bin_dir}
fi
