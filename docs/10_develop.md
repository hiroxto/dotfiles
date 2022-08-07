# 開発

dotfilesの開発はVisual Studio CodeのRemote Developmentで行うのが一番お手軽。

## 必要な動作環境

- Visual Studio Code
- Remote Development
- Remote - Containers
- Docker

## 初回セットアップ

`.devcontainer/recommended-devcontainer.json`を`.devcontainer/devcontainer.json`に，`.devcontainer/recommended-Dockerfile`を`.devcontainer/Dockerfile`にコピーする。

```bash
cp .devcontainer/recommended-Dockerfile .devcontainer/Dockerfile
cp .devcontainer/recommended-devcontainer.json .devcontainer/devcontainer.json
```

デフォルトの環境で最低限のテストは行えるはず。
必要に応じてDockerfileを書き換える。

## 起動

コマンドパレットからReopen in Containerを選択する。
するとDockerイメージがビルドされ，ビルドが完了すればコンテナ内で開発を行える。

## 終了

コマンドパレットからClose Remote Connectionを選択する。
