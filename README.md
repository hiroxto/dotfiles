# dotfiles

UNIX / Linux / macOS 用の設定ファイル。

## Requirements

- git
- zsh
- curl (自動インストールの場合)

## Install

### 自動インストール

`utils/auto-install.sh` を使ってインストールする。
`dot.hiroto-k.net` へアクセスすると自動で `utils/auto-install.sh` へ転送される。

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
$ zsh ~/dotfiles/utils/install-anyenv.sh
```

### Docker と Docker Compose の補完を追加

`utils/download-docker-completions.sh` を使い, Docker と Docker Compose の補完をローカルの補完(`~/.zsh/local/completions/`)へ追加する。
補完を更新する際も, `utils/download-docker-completions.sh` を使う。

```bash
$ zsh utils/download-docker-completions.sh
```

## Update

このリポジトリに入っている ``pull-dotfiles`` コマンドを使う。
dotfiles 本体と git 経由でインストールされるツール一式が更新される。

```bash
$ pull-dotfiles
```

