# dotfiles

Unix/Linux OSとmacOS用の設定ファイル。

## Install

このリポジトリを``git clone``してセットアップ用スクリプトを実行。セットアップ用スクリプトは``zsh``を使用して実行。

```bash
git clone --depth 1 https://github.com/hiroxto/dotfiles ~/dotfiles
cd ~/dotfiles
zsh initialize.zsh
```

## Update

このリポジトリに入っている``pull-dotfiles``コマンドを使う。dotfiles本体とgit経由でインストールされるツール一式が更新される。

```bash
pull-dotfiles
```

