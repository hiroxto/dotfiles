# dotfiles

[![Build status](https://img.shields.io/travis/Hiroto-K/dotfiles/master.svg?style=flat-square)](https://travis-ci.org/Hiroto-K/dotfiles)
[![License](https://img.shields.io/github/license/Hiroto-K/dotfiles.svg?style=flat-square)](https://github.com/Hiroto-K/dotfiles/blob/master/LICENSE)
![](https://img.shields.io/badge/platform-OS%20X%20|%20Linux-808080.svg?style=flat-square)

Unix/Linux OS用の設定ファイル。

# インストール
このリポジトリを``git clone``して``bash setup.sh``を実行。
```bash
git clone git@github.com:Hiroto-K/dotfiles.git
cd dotfiles
bash setup.sh
```

# 更新
.env系(rbenv,phpenv..)をまとめて更新する方法
```bash
# Bashのみを使用
bash ~/dotfiles/update.sh
# cURLとBashを使用
curl -Sslf https://raw.githubusercontent.com/Hiroto-K/dotfiles/master/update.sh | bash
# WgetとBashを使用
wget -O - https://raw.githubusercontent.com/Hiroto-K/dotfiles/master/update.sh | bash
```

## License
[MIT License](https://github.com/Hiroto-K/dotfiles/blob/master/LICENSE "MIT License")