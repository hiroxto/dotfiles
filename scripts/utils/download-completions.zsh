#!/usr/bin/env zsh
# 補完をダウンロードするスクリプト

set -eu

mkdir -p ~/.zsh/local/completions

# dockerの補完をダウンロード
if type "docker" > /dev/null 2>&1; then
    echo "Download docker completion"
    curl -L https://raw.githubusercontent.com/docker/cli/master/contrib/completion/zsh/_docker > ~/.zsh/local/completions/_docker
fi

# docker-composeの補完をダウンロード
if type "docker-compose" > /dev/null 2>&1; then
    echo "Download docker-compose completion"
    curl -L https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/zsh/_docker-compose > ~/.zsh/local/completions/_docker-compose
fi

# Kubernetes
if type "kubectl" > /dev/null 2>&1; then
    echo "Setup kubectl completion"
    kubectl completion zsh >| ~/.zsh/local/completions/_kubectl
fi

# minikube
if type "minikube" > /dev/null 2>&1; then
    echo "Setup minikube completion"
    minikube completion zsh >| ~/.zsh/local/completions/_minikube
fi
