#!/usr/bin/env bash

set -eu

mkdir -p ~/.zsh/local/completion

echo "Download docker completions"
curl -L https://raw.githubusercontent.com/docker/cli/master/contrib/completion/zsh/_docker > ~/.zsh/local/completion/_docker

echo "Download docker-compose completions"
curl -L https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/zsh/_docker-compose > ~/.zsh/local/completion/_docker-compose
