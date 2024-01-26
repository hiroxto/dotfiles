# 環境変数に関する設定を行うファイル
#
# このファイルでは全環境で共通の環境変数を設定し, ローカルのみの設定は .zshrc.local で行う.

# zsh
export PATH="${HOME}/bin-dotfiles:${PATH}"

# 言語
export LANG=ja_JP.UTF-8

# エディター
export EDITOR="vim"
export VISUAL="vim"

# Crystalのキャッシュディレクトリ
export CRYSTAL_CACHE_DIR=$HOME/.crystal

# Golang
export GOPATH=~/go
export PATH=$PATH:~/go/bin

# Rust (macOS)
if type "brew" > /dev/null 2>&1; then
    export PATH="$(brew --prefix bison)/bin:$PATH"
    export PATH="$(brew --prefix libxml2)/bin:$PATH"
    export PATH="$(brew --prefix bzip2)/bin:$PATH"
    export PATH="$(brew --prefix curl)/bin:$PATH"
    export PATH="$(brew --prefix libiconv)/bin:$PATH"
    export PATH="$(brew --prefix krb5)/bin:$PATH"
    export PATH="$(brew --prefix openssl@1.1)/bin:$PATH"
    export PATH="$(brew --prefix icu4c)/bin:$PATH"
    export PKG_CONFIG_PATH="$(brew --prefix krb5)/lib/pkgconfig:$PKG_CONFIG_PATH"
    export PKG_CONFIG_PATH="$(brew --prefix openssl@1.1)/lib/pkgconfig:$PKG_CONFIG_PATH"
    export PKG_CONFIG_PATH="$(brew --prefix icu4c)/lib/pkgconfig:$PKG_CONFIG_PATH"
fi
