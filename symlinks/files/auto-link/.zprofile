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
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:/usr/local/bin:$PATH"

# brew
if [ -x brew ]; then
  eval "$(brew shellenv)"
  export PATH="$(brew --prefix)/bin"
fi

#
# Golang
#
export GOPATH=~/go
export PATH="${PATH}:${GOPATH}/bin"

#
# dotfiles で共有しないローカルのみの設定
# PATH への ~/bin-local の追加は別セクションで行っている
#
# Local bin
export PATH="${HOME}/bin-local:$HOME/bin:${HOME}/bin-dotfiles:$PATH"

# Local のみの zsh の設定があったら読み込む
if [ -f ~/.zprofile.local ];then
  source ~/.zprofile.local
fi

# $PATHから重複したpathを削除する
typeset -gU cdpath fpath mailpath path
