#!/usr/bin/env zsh

set -eu

mkdir -p ~/.zsh/local/completions

echo "Download docker completions"
curl -L https://raw.githubusercontent.com/docker/cli/master/contrib/completion/zsh/_docker > ~/.zsh/local/completions/_docker

echo "Download docker-compose completions"
curl -L https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/zsh/_docker-compose > ~/.zsh/local/completions/_docker-compose
