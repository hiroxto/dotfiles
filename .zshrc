# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# oh-my-zsh theme
ZSH_THEME="robbyrussell"

# oh-my-zsh plugins
plugins=(archlinux bower bundler coffee composer gem git golang heroku laravel5 node npm nvm pip rails rake rbenv systemd ubuntu vagrant)

export PATH="$HOME/bin:/usr/local/bin:$HOME/.composer/vendor/bin:$HOME/.anyenv/bin:/usr/local/heroku/bin:$PATH"

source $ZSH/oh-my-zsh.sh

export LANG=ja_JP.UTF-8
export EDITOR="vim"
export BROWSER="firefox"
bindkey -e

# grc使える環境でのみgrcで色をつける
if [ type grc > /dev/null 2>&1 ];then
  alias mount="grc mount"
  alias ifconfig="grc ifconfig"
  alias dig="grc dig"
  alias -g netstat="grc netstat"
  alias ping="grc ping"
  alias ps="grc ps"
  alias traceroute="grc traceroute"
  alias gcc="grc gcc"
fi

## エイリアス
alias nano="nano -w"
alias vi="vim"
alias rmdir="rm -rf"
alias mkdir="mkdir -p"
alias cp="cp -i"
alias mv="mv -i"

## ディレクトリ名だけでcd
setopt auto_cd

## rm *で確認しない
setopt rm_star_silent

## Ruby関連
dir=`ruby -e 'print Gem.user_dir'`
export GEM_HOME="$dir"
export PATH="${dir}/bin:$PATH"
unset dir

## Crystalのキャッシュディレクトリの設定
CRYSTAL_CACHE_DIR=$HOME/.crystal

## *env系の実行
eval "$(anyenv init -)"

## Travi CIのgemで入る補完ファイルがあったら読み込む
if [ -f ~/.travis/travis.sh ];then
  source ~/.travis/travis.sh
fi

## Localのみの設定があったら読み込む
if [ -f ~/.zshrc.local ];then
  source ~/.zshrc.local
fi

## $PATHから重複したpathを削除する
typeset -U path PATH