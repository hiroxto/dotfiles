#!/usr/bin/env zsh
# Kubernetes と Minikube の補完を設定するスクリプト

set -eu

mkdir -p ~/.zsh/local/completions

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
