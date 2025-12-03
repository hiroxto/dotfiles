# dotfiles

UNIX / Linux / macOS 用の設定ファイル。

## 必要な環境

- Git
- Zsh
- cURL (自動インストールの場合)

## インストール

### 手動インストール

このリポジトリを `~/dotfiles` に clone してセットアップ用スクリプトを実行する。

```bash
$ git clone https://github.com/hiroxto/dotfiles ~/dotfiles
$ cd ~/dotfiles
$ zsh initialize.zsh
```

### 自動インストール

`scripts/utils/auto-install.bash` を使うと手動インストール相当の処理を自動で行える。

```bash
$ bash -c "$(curl -s https://raw.githubusercontent.com/hiroxto/dotfiles/refs/heads/main/scripts/utils/auto-install.bash)"
```

## シェルを切り替え

ログインシェルが `zsh` になっていない場合， `chsh` を使ってログインシェルを `zsh` へ切り替える。
切り替え後は一旦ログアウトする。

```bash
$ which zsh
$ chsh
```

## .gitconfig の追加設定 (コミットを作成する環境の場合は必須)

### PGP 署名の設定

dotfiles で設定される `.gitconfig` では PGP 署名の設定をしていない。
コミットを作成する場合は PGP 署名をしたいのでコミットを作成する環境では必ず設定する。

`.gitconfig.local` に設定を書く事で dotfiles で同期をせずにローカルのみの設定をする事が可能な仕組みにしている。

`.gitconfig.local` に `user.signingkey`，`gpg.program`，`commit.gpgsign`，`tag.gpgsign`を設定することで PGP 署名が出来るようになる。
```
[user]
    signingkey = <signingkey>
[gpg]
    program = /opt/homebrew/bin/gpg
[commit]
    gpgsign = true
[tag]
    gpgsign = true
```

### Organization 毎の user 設定 (Organization のリポジトリでコミットする場合は必須)

仕事でコミットを作成する場合は仕事で使っているメールアドレスを使いたいので別途設定する。

`.gitconfig.local` で特定のディレクトリ以下では別の設定を読み込むようにする。
ghq でリポジトリを管理する場合は以下のようになる。

```
[includeIf "gitdir:~/ghq/github.com/your-organization"]
    path = ~/.gitconfig.organization
```

`.gitconfig.organization` を作成し， Organization での設定項目を書く。

```
[user]
    name = Foo Bar
    email = foo@example.com
```

## 更新

`bin-dotfiles/pull-dotfiles` コマンドを使うとdotfiles本体とdotfilesでインストールされているツール一式が更新される。
dotfiles の `bin-dotfiles/` はパスが通っているので `pull-dotfiles` で実行可能。

```bash
$ pull-dotfiles
```

## ローカル環境に影響を与えずに動作検証する

下手に手を加えてローカル環境に影響を与えたくない時は VSCode の Remote Development で検証する。

```bash
# 設定ファイルをコピー
$ ./.devcontainer/copy-devcontainer-files.sh
```
