# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
    source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

#
# エイリアス関連
#
alias rmdir="rm -rf"
alias tf="terraform"
alias repo="gh repo view -w"

#
# setopt 関連
#
# rm * で確認しない
setopt rm_star_silent

# 拡張グロブを有効化
setopt extended_glob

#
# bindkey関連
#
# vi キーバインド
bindkey -e

# Ctrl + P と Ctrl + N で先頭一致
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end

# ghqでのリポジトリ検索
# Ctrl + ] でghq管理下にあるリポジトリを一覧表示
if type "peco" > /dev/null 2>&1; then
    function peco-src () {
        local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
            if [ -n "$selected_dir" ]; then
                BUFFER="cd ${selected_dir}"
                zle accept-line
            fi
        zle clear-screen
    }
    zle -N peco-src
    bindkey '^]' peco-src
fi

#
# 補完関連
#
# 入力途中の履歴補完を有効化する
# カーソルは行末へ移動
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

#
# よく使うコマンドの補完設定
#
# brew
if type "brew" > /dev/null 2>&1; then
    export FPATH="$(brew --prefix)/share/zsh/site-functions:$FPATH"
fi

# gh
if type "gh" > /dev/null 2>&1; then
    eval "$(gh completion -s zsh)"
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

# mise
if type "mise" > /dev/null 2>&1; then
    eval "$(mise completion zsh)"
fi

# local fpath
export FPATH="$HOME/.zsh/local/completions:$FPATH"

#
# dotfiles で共有しないローカルのみの設定
# FPATH への ~/.zsh/local/completions の追加は別セクションで行っている
#
# Local のみの zsh の設定があったら読み込む
if [ -f ~/.zshrc.local ];then
  source ~/.zshrc.local
fi

#
# 最後に実行する設定
#
# $PATHから重複したpathを削除する
typeset -gU cdpath fpath mailpath path

# 補完を読み込む
autoload -Uz compinit && compinit
