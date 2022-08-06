# vi キーバインド
bindkey -e

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
