
# gh コマンドの補完設定
if type "gh" > /dev/null 2>&1; then
    eval "$(gh completion -s zsh)"
fi
