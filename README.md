# dotfiles

[![Build Status](https://travis-ci.org/hiroto-k/dotfiles.svg?branch=master)](https://travis-ci.org/hiroto-k/dotfiles)
[![License](https://img.shields.io/github/license/hiroto-k/dotfiles.svg)](https://github.com/hiroto-k/dotfiles/blob/master/LICENSE)

Unix/Linux OSとmacOS用の設定ファイル。

## Install

このリポジトリを``git clone``してセットアップ用スクリプトを実行。セットアップ用スクリプトは``zsh``を使用して実行。

```bash
git clone --depth 1 git@github.com:hiroto-k/dotfiles.git ~/dotfiles
cd ~/dotfiles
zsh setup.sh
```

## Update

このリポジトリに入っている``pull-dotfiles``コマンドを使う。dotfiles本体とgit経由でインストールされるツール一式が更新される。

```bash
pull-dotfiles
```

## License

[MIT License](https://github.com/hiroto-k/dotfiles/blob/master/LICENSE "MIT License")
