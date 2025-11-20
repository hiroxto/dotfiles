# ローカルのみの設定を行うファイル
#
# ~/.zshrc.local などのローカルだけで設定される物はここで設定する

# Local のみの zsh の設定があったら読み込む
if [ -f ~/.zshrc.local ];then
  source ~/.zshrc.local
fi

# Local のみの bin を設定
export PATH="${HOME}/bin-local:$PATH"

# Local のみの補完を設定
fpath=(~/.zsh/local/completions $fpath)
