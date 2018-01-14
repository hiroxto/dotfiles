# 補完
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

# Ctrl + PとCtrl + Nで先頭一致
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
