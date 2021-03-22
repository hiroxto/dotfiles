# コマンドの補完の設定を行うファイル
#
# コマンドの引数でシェルの補完を作成出来る場合は, このファイルで行う.

# gh コマンドの補完設定
if type "gh" > /dev/null 2>&1; then
    eval "$(gh completion -s zsh)"
fi

# brew コマンドの補完設定
if type "brew" > /dev/null 2>&1; then
    FPATH="$(brew --prefix)/share/zsh/site-functions:$FPATH"
fi
