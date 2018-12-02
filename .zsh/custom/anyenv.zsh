# anyenvの設定

# anyenvの初期化
eval "$(anyenv init - zsh)"

# Gem homeの設定
dir=`ruby -e 'print Gem.user_dir'`
export GEM_HOME="${dir}"
export PATH="${dir}/bin:$PATH"
unset dir
