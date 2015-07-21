# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="imajes"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(archlinux bundler git golang gem node npm pip systemd ubuntu vagrant)

# User configuration

export PATH="$PATH:$HOME/bin:/usr/local/bin:$HOME/.gem/ruby/2.2.0/bin:$HOME/.composer/vendor/bin:$HOME/.rbenv/bin:$HOME/.phpenv/bin:$HOME/.pyenv/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

###  base  ###
## 文字コード&言語
export LANG=ja_JP.UTF-8
export EDITOR="vim"
export BROWSER="firefox"
bindkey -e

###  history  ###
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
## 時間を読みやすく
export HISTTIMEFORMAT="[%Y/%M/%D %H:%M:%S] "
export HIST_STAMPS="[%Y/%M/%D %H:%M:%S] "
## !を使った展開
setopt bang_hist
## 実行時間も保存
setopt extended_history
## 直前と同じ時は追加しない
setopt hist_ignore_dups
## ヒストリを共有
setopt share_history
## 余分なスペースを削除してヒストリに保存
setopt hist_reduce_blanks
## 入力途中の履歴補完を有効化
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

###  complement  ###
#$ 補完機能を有効
autoload -U compinit; compinit
## 補完候補を一覧表示
setopt auto_list
## キー連打で補完候補を順に表示
setopt auto_menu
## 詰めて表示
setopt list_packed
## ファイルの種類も表示
setopt list_types
## 変数名を補完
setopt AUTO_PARAM_KEYS
## beepを無効化
setopt no_beep
## shift-tabで補完候補を逆に
bindkey "^[[Z" reverse-menu-complete
## 大文字小文字を区別しない
zstyle ":completion:*" matcher-list "m:{a-z}={A-Z}"
#sudoで補完
zstyle ":completion:*:sudo:*" command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
## 多くても無視
LISTMAX=1000

###  Color  ###
export CLICOLOR=true
export LSCOLORS=gxfxxxxxcxxxxxxxxxgxgx
export LS_COLORS="di=01;36:ln=01;35:ex=01;32"
setopt nonomatch
autoload colors
zstyle ":completion:*" list-colors $LS_COLORS
alias ls="ls -FG --color=auto"
alias grep="grep --color"
alias mount="grc mount"
alias ifconfig="grc ifconfig"
alias dig="grc dig"
alias -g netstat="grc netstat"
alias ping="grc ping"
alias ps="grc ps"
alias traceroute="grc traceroute"
alias gcc="grc gcc"

###  other  ###
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
## Ruby
export GEM_HOME="$HOME/.gem/ruby/2.2.0/"

## *env
eval "$(rbenv init -)"
eval "$(phpenv init -)"
eval "$(pyenv init -)"