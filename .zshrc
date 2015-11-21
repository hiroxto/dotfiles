# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# oh-my-zsh theme
ZSH_THEME="robbyrussell"

# oh-my-zsh plugins
plugins=(archlinux composer git golang gem heroku laravel5 node npm pip rails rake systemd ubuntu vagrant)

export PATH="$PATH:$HOME/bin:/usr/local/bin:$HOME/.gem/ruby/2.2.0/bin:$HOME/.composer/vendor/bin:$HOME/.rbenv/bin:$HOME/.phpenv/bin:$HOME/.pyenv/bin:$HOME/.crenv/bin:/usr/local/heroku/bin"

source $ZSH/oh-my-zsh.sh

###  base  ###
## 文字コード&言語
export LANG=ja_JP.UTF-8
export EDITOR="vim"
export BROWSER="firefox"
bindkey -e

if type grc > /dev/null 2>&1 ; then
  alias mount="grc mount"
  alias ifconfig="grc ifconfig"
  alias dig="grc dig"
  alias -g netstat="grc netstat"
  alias ping="grc ping"
  alias ps="grc ps"
  alias traceroute="grc traceroute"
  alias gcc="grc gcc"
fi

###  utils  ###
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

## Ruby Gem
export GEM_HOME="$HOME/.gem/ruby/2.2.0/"

## *env
eval "$(rbenv init -)"
eval "$(phpenv init -)"
eval "$(pyenv init -)"
eval "$(crenv init -)"
source ~/.nvm/nvm.sh