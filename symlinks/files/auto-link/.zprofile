#
# Browser
#
if [[ -z "$BROWSER" && "$OSTYPE" == darwin* ]]; then
  export BROWSER="open"
fi

#
# Editor
#
if [[ -z "$EDITOR" ]]; then
  export EDITOR="vim"
fi

if [[ -z "$VISUAL" ]]; then
  export VISUAL="vim"
fi

if [[ -z "$PAGER" ]]; then
  export PAGER="less"
fi

#
# Language
#
if [[ -z "$LANG" ]]; then
  export LANG="ja_JP.UTF-8"
fi

#
# Path
#
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:/usr/local/bin:$PATH"

# brew
if type "brew" > /dev/null 2>&1; then
  eval "$(brew shellenv)"
fi

#
# Golang
#
export GOPATH=~/go
export PATH="${PATH}:${GOPATH}/bin"

#
# mise
#
if type "mise" > /dev/null 2>&1; then
    eval "$(mise activate zsh)"
fi

#
# dotfiles で共有しないローカルのみの設定
#
# Local bin
export PATH="${HOME}/bin-local:$HOME/bin:${HOME}/bin-dotfiles:$PATH"

# Local のみの zsh の設定があったら読み込む
if [ -f ~/.zprofile.local ];then
  source ~/.zprofile.local
fi

#
# 最後に実行する設定
#
# 重複したpathを削除する
typeset -gU cdpath fpath mailpath path
