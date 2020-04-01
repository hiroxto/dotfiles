# 環境変数に関する設定を行うファイル
#
# このファイルでは全環境で共通の環境変数を設定し, ローカルのみの設定は .zshrc.local で行う.

# 言語
export LANG=ja_JP.UTF-8

# エディター
export EDITOR="vim"
export VISUAL="vim"

# ブラウザ
export BROWSER="firefox"

# Crystalのキャッシュディレクトリ
export CRYSTAL_CACHE_DIR=$HOME/.crystal

# Golang
export GOPATH=~/go
export PATH=$PATH:~/go/bin
