#!/usr/bin/env zsh
# 補完をダウンロードするスクリプト

set -eu

COMPLETIONS_DIR=~/.zsh/local/completions
mkdir -p $COMPLETIONS_DIR

# dockerの補完をダウンロード
if type "docker" > /dev/null 2>&1; then
    echo "Download docker completion"
    curl -sSL https://raw.githubusercontent.com/docker/cli/master/contrib/completion/zsh/_docker > ${COMPLETIONS_DIR}/_docker
fi

# Kubernetes
if type "kubectl" > /dev/null 2>&1; then
    echo "Setup kubectl completion"
    kubectl completion zsh >| ${COMPLETIONS_DIR}/_kubectl
fi

# minikube
if type "minikube" > /dev/null 2>&1; then
    echo "Setup minikube completion"
    minikube completion zsh >| ${COMPLETIONS_DIR}/_minikube
fi
