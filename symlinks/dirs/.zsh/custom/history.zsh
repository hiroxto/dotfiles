# 履歴や補完に関する設定を行うファイル

# 入力途中の履歴補完を有効化する
# カーソルは行末へ移動
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

# Ctrl + P と Ctrl + N で先頭一致
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end

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
