# インストール

## 必要な環境

- Git
- Zsh
- cURL (自動インストールの場合)

## 自動インストール

`scripts/utils/auto-install.bash` を使ってインストールする．

`dot.hiroto-k.net` へアクセスすると自動で GitHub 上の `scripts/utils/auto-install.bash` へ転送され，その Bash コードを実行するとインストールされる．

```bash
$ bash -c "$(curl -L dot.hiroto-k.net)"
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

#### anyenv のセットアップ (必要なら)

anyenv が必要な場合，`scripts/utils/install-anyenv.zsh` を使って anyenv のマニフェストのインストールと，各 env のインストールを行う．

```bash
$ zsh ~/dotfiles/scripts/utils/install-anyenv.zsh
```

### Docker と Docker Compose の補完を追加

Docker と Docker Compose の補完が必要な場合，`scripts/utils/download-docker-completions.zsh` を使って補完をローカルの補完( `~/.zsh/local/completions/`) へ追加する．
補完を更新する際も，`scripts/utils/download-docker-completions.zsh` を使う．

```bash
$ zsh scripts/utils/download-docker-completions.zsh
```
