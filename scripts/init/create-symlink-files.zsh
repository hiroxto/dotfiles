#!/usr/bin/env zsh

set -eu

source "${0:A:h}/../lib/link.zsh"

echo "Create symbolic link files."

# dotfiles の symlinks/files/auto-link 以下に入っているファイルを自動でリンク
for file in `ls -A1 ${HOME}/dotfiles/symlinks/files/auto-link/`; do
    link_from="${HOME}/dotfiles/symlinks/files/auto-link/${file}"
    link_to="${HOME}/${file}"

    create_symlink ${link_from} ${link_to}
done

# dotfiles の symlinks/files/manual-link 以下に入っているファイルを指定したパスへリンク
manual_link_files=(
    claude/statusline-command.sh:.claude/statusline-command.sh
    ghostty/config:.config/ghostty/config
    mise/config.toml:.config/mise/config.toml
)

for file in ${manual_link_files[@]}; do
    link_from="${HOME}/dotfiles/symlinks/files/manual-link/${file%%:*}"
    link_to="${HOME}/${file#*:}"
    link_to_dir=`dirname ${link_to}`

    echo "Create directory : ${link_to_dir}"
    mkdir -p ${link_to_dir}

    create_symlink ${link_from} ${link_to}
done
