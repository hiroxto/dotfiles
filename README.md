# Hiroto-K/dotfiles

[![](https://img.shields.io/travis/Hiroto-K/dotfiles/master.svg?style=flat-square)][travis]
[![](https://img.shields.io/github/license/Hiroto-K/dotfiles.svg?style=flat-square)][license]
[![](https://img.shields.io/badge/platform-OS%20X%20|%20Linux-808080.svg?style=flat-square)][platform]

MacとLinuxで使う設定ファイル等をまとめてセットアップする。

# install
このリポジトリをクローンして``setup.sh``を実行。
```sh
git clone git://github.com/Hiroto-K/dotfiles
cd dotfiles
./setup.sh
```

# *env系の更新をする方法
このリポジトリにある``update.sh``を実行。
```bash
curl -Sslf https://raw.githubusercontent.com/Hiroto-K/dotfiles/master/update.sh | bash
```