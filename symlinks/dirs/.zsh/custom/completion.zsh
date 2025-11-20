# コマンドの補完の設定を行うファイル
#
# コマンドの引数でシェルの補完を作成出来る場合はこのファイルで行う

# gh
if type "gh" > /dev/null 2>&1; then
    eval "$(gh completion -s zsh)"
fi

# brew
if type "brew" > /dev/null 2>&1; then
    FPATH="$(brew --prefix)/share/zsh/site-functions:$FPATH"
fi

# docker
if type "docker" > /dev/null 2>&1; then
    eval "$(docker completion zsh)"
fi

# Kubernetes
if type "docker" > /dev/null 2>&1; then
    eval "$(kubectl completion zsh)"
fi

# minikube
if type "minikube" > /dev/null 2>&1; then
    eval "$(minikube completion zsh)"
fi

# task
if type "task" > /dev/null 2>&1; then
    eval "$(task --completion zsh)"
fi
