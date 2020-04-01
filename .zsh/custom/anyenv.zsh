# anyenvの設定を行うファイル
#
# RubyGems のパスの設定など, anyenv が絡む物はこのファイルで行う.

# anyenvの初期化
eval "$(anyenv init - zsh)"

# RubyGems の設定
# 環境変数 GEM_HOME の設定と, Gem の実行ファイルのパスの設定をする
if type "ruby" > /dev/null 2>&1; then
    dir=`ruby -e 'print Gem.user_dir'`
    export GEM_HOME="${dir}"
    export PATH="${dir}/bin:$PATH"
    unset dir
fi
