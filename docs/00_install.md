# インストール

## 必要な環境

- Git
- Zsh
- cURL (自動インストールの場合)

## 自動インストール

`scripts/utils/auto-install.bash` を使ってインストールする．

`dot.hiroxto.net` へアクセスすると自動で GitHub 上の `scripts/utils/auto-install.bash` へ転送され，その Bash コードを実行するとインストールされる．

```bash
$ bash -c "$(curl -L dot.hiroxto.net)"
```

## 手動インストール

手動でインストールする場合，このリポジトリを `git clone` してセットアップ用スクリプトを実行．
セットアップ用スクリプトは `zsh` を使用して実行．

実行する内容は上記の自動インストールと全て同じ．

```bash
$ git clone --depth 1 https://github.com/hiroxto/dotfiles ~/dotfiles
$ cd ~/dotfiles
$ zsh initialize.zsh
```

## シェルを切り替え

ログインシェルが `zsh` になっていない場合，`chsh` を使ってログインシェルを `zsh` へ切り替える．
切り替え後は一旦ログアウトする．

```bash
$ which zsh
$ chsh
```

## .gitconfig の追加設定

### PGP 署名の設定 (コミットを作成する環境の場合は必須)

dotfiles で設定される `.gitconfig` では PGP 署名の設定をしていない。
コミットを作成する場合は PGP 署名をしたいので，コミットを作成する環境では必ず設定する。

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

仕事でコミットを作成する場合は仕事で使っているメールアドレスを使いたいので，別途設定する。

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
