#!/usr/bin/env zsh

set -eu

# link_to にファイルやシンボリックリンクが既にある場合は作成しない
create_symlink() {
    local link_from="$1"
    local link_to="$2"

    echo "Link ${link_from} to ${link_to}"

    # リンク切れのシンボリックリンクは -e が偽になるため、-L でも判定する
    if [ -e "${link_to}" ] || [ -L "${link_to}" ]; then
        echo "File '${link_to}' is already exist."
        echo "Skip create symbolic link."
    else
        echo "Create symbolic link to ${link_to}"
        ln -s "${link_from}" "${link_to}"
    fi
}

# ============================================================
# dotfiles の symlinks/dirs 以下のディレクトリをリンク
# ============================================================

echo "Create symbolic link dirs."

dirs=(
    bin-dotfiles
    .zsh
)

for dir in ${dirs[@]}; do
    link_from="${HOME}/dotfiles/symlinks/dirs/${dir}"
    link_to="${HOME}/${dir}"

    link_to_dir=`dirname ${link_to}`

    echo "Create directory : ${link_to_dir}"
    mkdir -p ${link_to_dir}

    create_symlink ${link_from} ${link_to}
done

# ============================================================
# dotfiles の symlinks/files 以下のファイルをリンク
# ============================================================

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

# ============================================================
# prezto をインストールし、設定ファイルをリンク
# ============================================================

echo "Install prezto."

zprezto_dir="${HOME}/.zprezto"

if [ -d ${zprezto_dir} ]; then
    echo "zprezto is already installed."
    echo "Skip install."
else
    git clone --depth 1 --recursive https://github.com/sorin-ionescu/prezto ${zprezto_dir}
fi

echo "Link zprezto config files"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    link_to="${ZDOTDIR:-$HOME}/.${rcfile:t}"

    create_symlink "$rcfile" "${link_to}"
done
