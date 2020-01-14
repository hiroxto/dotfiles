# anyenvの設定

# anyenvの初期化
eval "$(anyenv init - zsh)"

# Gem homeの設定
if type "ruby" > /dev/null 2>&1; then
    dir=`ruby -e 'print Gem.user_dir'`
    export GEM_HOME="${dir}"
    export PATH="${dir}/bin:$PATH"
    unset dir
fi
