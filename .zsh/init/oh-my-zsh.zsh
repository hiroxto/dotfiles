# oh-my-zshの設定

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# oh-my-zsh theme
ZSH_THEME="robbyrussell"

# oh-my-zsh plugins
plugins=(archlinux bower bundler coffee composer gem git golang heroku laravel5 node npm nvm pip rails rake rbenv systemd ubuntu vagrant)

# Add brew plugin on OS X
if [ "$OSTYPE" = darwin* ];then
  plugins+=(brew)
fi

source $ZSH/oh-my-zsh.sh