# Hiroto-K/dotfiles

![](https://img.shields.io/travis/Hiroto-K/dotfiles/master.svg?style=flat-square)
![](https://img.shields.io/github/license/Hiroto-K/dotfiles.svg?style=flat-square)
![](https://img.shields.io/badge/platform-OS%20X%20|%20Linux-808080.svg?style=flat-square)

MacとLinuxで使う設定ファイル等をまとめてセットアップする。

# install
このリポジトリをクローンして``setup.sh``を実行。
```sh
git clone git://github.com/Hiroto-K/dotfiles
cd dotfiles
./setup.sh
```

# Update
このリポジトリにある``update.sh``を実行。
```bash
# Use bash
bash ~/dotfiles/update.sh
# Use curl & bash
curl -Sslf https://raw.githubusercontent.com/Hiroto-K/dotfiles/master/update.sh | bash
# Use wget & bash
wget -O - https://raw.githubusercontent.com/Hiroto-K/dotfiles/master/update.sh | bash
```

## License
[MIT License](https://github.com/Hiroto-K/dotfiles/blob/master/LICENSE "MIT License")