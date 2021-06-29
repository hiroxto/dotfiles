# dotfiles

![GitHub Actions dotfiles CI Status](https://github.com/hiroxto/dotfiles/workflows/dotfiles%20CI/badge.svg)

UNIX / Linux / macOS 用の設定ファイル。

## Requirements

- git
- zsh
- curl (自動インストールの場合)

## Install

### 自動インストール

`scripts/utils/auto-install.bash` を使ってインストールする。
`dot.hiroto-k.net` へアクセスすると自動で `scripts/utils/auto-install.bash` へ転送される。

```bash
$ bash -c "$(curl -L dot.hiroto-k.net)"
```

### 手動インストール

手動でインストールする場合, このリポジトリを ``git clone`` してセットアップ用スクリプトを実行。
セットアップ用スクリプトは ``zsh`` を使用して実行。
実行内容は上記の自動インストールと同じ。

```bash
$ git clone --depth 1 https://github.com/hiroxto/dotfiles ~/dotfiles
$ cd ~/dotfiles
$ zsh initialize.zsh
```

### インストール後

#### ログインシェルを zsh へ切り替え

`chsh` を使い, ログインシェルを `zsh` へ切り替える。
切り替え後は一旦ログアウトする。

```bash
$ which zsh
$ chsh
```

#### anyenv のセットアップ

anyenv のマニフェストのインストールと, 各 env のインストールを行う。

```bash
$ zsh ~/dotfiles/scripts/utils/install-anyenv.zsh
```

### Docker と Docker Compose の補完を追加

`scripts/utils/download-docker-completions.zsh` を使い, Docker と Docker Compose の補完をローカルの補完(`~/.zsh/local/completions/`)へ追加する。
補完を更新する際も, `scripts/utils/download-docker-completions.zsh` を使う。

```bash
$ zsh scripts/utils/download-docker-completions.zsh
```

## Update

このリポジトリに入っている ``pull-dotfiles`` コマンドを使う。
dotfiles 本体と git 経由でインストールされるツール一式が更新される。

```bash
$ pull-dotfiles
```

