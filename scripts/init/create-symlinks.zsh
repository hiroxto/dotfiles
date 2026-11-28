#!/usr/bin/env zsh

set -eu

# link_to にファイルやシンボリックリンクが既にある場合は作成しない
create_symlink() {
    local link_from="$1"
    local link_to="$2"

    # リンク切れのシンボリックリンクは -e が偽になるため、-L でも判定する
    if [ -e "${link_to}" ] || [ -L "${link_to}" ]; then
        echo "'${link_to}' already exists. Skipped creating a symbolic link."
    else
        ln -s "${link_from}" "${link_to}"
        echo "Created a symbolic link: ${link_to} -> ${link_from}"
    fi
}

# ============================================================
# dotfiles の symlinks/dirs 以下のディレクトリをリンク
# ============================================================

echo "Creating symbolic links to directories."

dirs=(
    bin-dotfiles
    .zsh
)

for dir in ${dirs[@]}; do
    link_from="${HOME}/dotfiles/symlinks/dirs/${dir}"
    link_to="${HOME}/${dir}"

    link_to_dir=`dirname ${link_to}`

    echo "Creating directory: ${link_to_dir}"
    mkdir -p ${link_to_dir}

    create_symlink ${link_from} ${link_to}
done

# ============================================================
# dotfiles の symlinks/files 以下のファイルをリンク
# ============================================================

echo "Creating symbolic links to files."

# dotfiles の symlinks/files/auto-link 以下に入っているファイルを自動でリンク
for link_from in ${HOME}/dotfiles/symlinks/files/auto-link/*(DN); do
    link_to="${HOME}/${link_from:t}"

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

    echo "Creating directory: ${link_to_dir}"
    mkdir -p ${link_to_dir}

    create_symlink ${link_from} ${link_to}
done

# ============================================================
# prezto をインストールし、設定ファイルをリンク
# ============================================================

echo "Installing Prezto."

zprezto_dir="${HOME}/.zprezto"

if [ -d ${zprezto_dir} ]; then
    echo "Prezto is already installed. Skipped installation."
else
    git clone --depth 1 --recursive https://github.com/sorin-ionescu/prezto ${zprezto_dir}
fi

echo "Creating symbolic links to Prezto config files."
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    link_to="${ZDOTDIR:-$HOME}/.${rcfile:t}"

    create_symlink "$rcfile" "${link_to}"
done
