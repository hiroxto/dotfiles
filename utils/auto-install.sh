#!/usr/bin/env bash
# dotfiles をインストールするスクリプト.
#
# README.md 記載のインストール方法を完全自動でインストールする時に使う.
# 基本は curl 経由で使うため直接実行する必要はない.

set -eu

DOTFILES_REPO="https://github.com/hiroxto/dotfiles"
DOTFILES_PATH="${HOME}/dotfiles"
INITIALIZE_SCRIPT="initialize.zsh"

echo "hiroxto/dotfiles auto install script"

if [ ! `which git` ];then
    echo "[Error] 'git' command not found"
    exit 1
fi

if [ ! `which zsh` ];then
    echo "[Error] 'zsh' command not found"
    exit 1
fi

if [ -e ${DOTFILES_PATH} ]; then
    echo "[Error] '${DOTFILES_PATH}' is already exist."
    exit 1
fi

echo "Clone from ${DOTFILES_REPO} to ${DOTFILES_PATH}"
git clone --depth 1 "${DOTFILES_REPO}" "${DOTFILES_PATH}"

echo "Change current directory to ${DOTFILES_PATH}"
cd "${DOTFILES_PATH}"

echo "Execute initialize script ${INITIALIZE_SCRIPT}"
zsh "${INITIALIZE_SCRIPT}"
echo "Successfully executed initialize script"
