# Hiroto-K/dotfiles

![](https://img.shields.io/travis/Hiroto-K/dotfiles/master.svg?style=flat-square)
![](https://img.shields.io/github/license/Hiroto-K/dotfiles.svg?style=flat-square)
![](https://img.shields.io/badge/platform-OS%20X%20|%20Linux-808080.svg?style=flat-square)

This is a repository of my configuration files for Linux/Mac OS X.

# Install
Run ``bash setup.sh``, after clone this repository.
```sh
git clone git@github.com:Hiroto-K/dotfiles.git
cd dotfiles
# Required : Bash
bash setup.sh
```

# Update
Run ``bash update.sh``
```bash
# Use Bash
bash ~/dotfiles/update.sh
# Use cURL & Bash
curl -Sslf https://raw.githubusercontent.com/Hiroto-K/dotfiles/master/update.sh | bash
# Use Wget & Bash
wget -O - https://raw.githubusercontent.com/Hiroto-K/dotfiles/master/update.sh | bash
```

## License
[MIT License](https://github.com/Hiroto-K/dotfiles/blob/master/LICENSE "MIT License")