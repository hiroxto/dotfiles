# dotfiles

Unix/Linux OSとmacOS用の設定ファイル。

## Install

`utils/auto-install.sh` を使ってインストールする.

```bash
bash -c "$(curl -L dot.hiroto-k.net)"
```

手動でインストールする場合, このリポジトリを``git clone``してセットアップ用スクリプトを実行。セットアップ用スクリプトは``zsh``を使用して実行。

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

