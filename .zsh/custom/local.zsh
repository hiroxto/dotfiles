# ローカルのみの設定

# Travi CIのgemで入る補完ファイルがあったら読み込む
if [ -f ~/.travis/travis.sh ];then
  source ~/.travis/travis.sh
fi

# Localのみの設定があったら読み込む
if [ -f ~/.zshrc.local ];then
  source ~/.zshrc.local
fi
