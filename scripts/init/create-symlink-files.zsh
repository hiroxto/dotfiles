#!/usr/bin/env zsh

set -eu

echo "Create symbolic link files."

# dotfiles の symlinks/files/auto-link 以下に入っているファイルを自動でリンク
for file in `ls -A1 ${HOME}/dotfiles/symlinks/files/auto-link/`; do
    link_from="${HOME}/dotfiles/symlinks/files/auto-link/${file}"
    link_to="${HOME}/${file}"
    echo "Link ${link_from} to ${link_to}"

    if [ -e ${link_to} ] || [ -L ${link_to} ]; then
        echo "File '${link_to}' is already exist."
        echo "Skip create symbolic link."
    else
        echo "Create symbolic link to ${link_to}"
        ln -s ${link_from} ${link_to}
    fi
done

# dotfiles の symlinks/files/manual-link 以下に入っているファイルを指定したパスへリンク
manual_link_files=(
    ghostty/config:.config/ghostty/config
)

for file in ${manual_link_files[@]}; do
    link_from="${HOME}/dotfiles/symlinks/files/manual-link/${file%%:*}"
    link_to="${HOME}/${file#*:}"
    link_to_dir=`dirname ${link_to}`

    echo "Create directory : ${link_to_dir}"
    mkdir -p ${link_to_dir}

    echo "Link ${link_from} to ${link_to}"

    if [ -e ${link_to} ] || [ -L ${link_to} ]; then
        echo "File '${link_to}' is already exist."
        echo "Skip create symbolic link."
    else
        echo "Create symbolic link to ${link_to}"
        ln -s ${link_from} ${link_to}
    fi
done
