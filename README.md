# Hiroto-K/dotfiles
MacとLinuxで使う設定ファイル等をまとめてセットアップする。
- .zshrc
- .nanorc
- .vimrc
- .editorconfig
- .gitconfig
- .gitignore\_global
- .hgrc
- .hgignore_global
- oh-my-zsh
- NeoBundle.vim
- molokai.vim
- rbenv
- phpenv
- pyenv

# install
このリポジトリをクローンして``setup.sh``を実行。
```sh
git clone git://github.com/Hiroto-K/dotfiles
cd dotfiles
./setup.sh
```

# *env系の更新をする方法
このリポジトリにある``update.sh``を実行。
```sh
curl -Sslf https://raw.githubusercontent.com/Hiroto-K/dotfiles/master/update.sh | sh
```