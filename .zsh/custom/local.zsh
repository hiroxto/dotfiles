# ローカルのみの設定を行うファイル
#
# ~/.zshrc.local などのローカルだけで設定される物はここで設定する

# Travi CI の gem で入る補完ファイルがあったら読み込む
if [ -f ~/.travis/travis.sh ];then
  source ~/.travis/travis.sh
fi

# Local のみの zsh の設定があったら読み込む
if [ -f ~/.zshrc.local ];then
  source ~/.zshrc.local
fi

# Local のみの bin を設定
export PATH="${HOME}/bin-local:$PATH"

# Local のみの補完を設定
fpath=(~/.zsh/local/completions $fpath)
