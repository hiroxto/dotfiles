#!/usr/bin/env zsh
# anyenv の初期化と, 各 env をインストールするスクリプト
#
# dotfiles をインストールした PC で anyenv を使う場合のみ実行する.
# initialize.zsh を実行した後に, このスクリプトを実行する必要がある.

set -eu

ANYENV_DIR="${HOME}/.anyenv"
ANYENV_DEFINITION_ROOT="${XDG_CONFIG_HOME:-${HOME}/.config}/anyenv/anyenv-install"

if [ ! -e ${ANYENV_DEFINITION_ROOT} ];then
    echo "Missing ${ANYENV_DEFINITION_ROOT} !"
    echo "Run 'anyenv install --init' command"
    anyenv install --init
fi

echo "Install envs"
for envname in rbenv phpenv pyenv nodenv; do
    echo "Install ${envname}"
    envname_dir="${ANYENV_DIR}/envs/${envname}"

    if [ -e ${envname_dir} ];then
        echo "Directory ${envname_dir} is already exist."
        echo "Skip install ${envname}."
    else
        anyenv install ${envname}
    fi
done
