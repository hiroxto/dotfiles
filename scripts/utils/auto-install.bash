#!/usr/bin/env bash
# dotfiles をインストールするスクリプト.
#
# README.md 記載のインストール方法を完全自動でインストールする時に使う.
# 基本は curl 経由で使うため直接実行する必要はない.

set -eu

DOTFILES_REPO="https://github.com/hiroxto/dotfiles"
DOTFILES_PATH="${HOME}/dotfiles"
INITIALIZE_SCRIPT="initialize.zsh"

echo "Running hiroxto/dotfiles auto install script."

if ! type git > /dev/null 2>&1; then
    echo "[Error] 'git' command not found."
    exit 1
fi

if ! type zsh > /dev/null 2>&1; then
    echo "[Error] 'zsh' command not found."
    exit 1
fi

if [ -e "${DOTFILES_PATH}" ]; then
    echo "[Error] '${DOTFILES_PATH}' already exists."
    exit 1
fi

echo "Cloning ${DOTFILES_REPO} into ${DOTFILES_PATH}."
git clone "${DOTFILES_REPO}" "${DOTFILES_PATH}"

cd "${DOTFILES_PATH}"

echo "Running: ${DOTFILES_PATH}/${INITIALIZE_SCRIPT}"
zsh "${INITIALIZE_SCRIPT}"
echo "Installed dotfiles."
