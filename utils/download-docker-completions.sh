#!/usr/bin/env bash
# Docker の補完をダウンロードするスクリプト
#
# PC で Docker を扱う場合はこのスクリプトを実行して補完を設定する.

set -eu

mkdir -p ~/.zsh/local/completions

echo "Download docker completions"
curl -L https://raw.githubusercontent.com/docker/cli/master/contrib/completion/zsh/_docker > ~/.zsh/local/completions/_docker

echo "Download docker-compose completions"
curl -L https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/zsh/_docker-compose > ~/.zsh/local/completions/_docker-compose
