#!/usr/bin/env zsh

set -eu

echo "Setup zsh"

zsh_dir="${HOME}/.zsh"
link_from="${HOME}/dotfiles/.zsh"

echo "Link ${link_from} to ${zsh_dir}"
ln -sf ${link_from} ${zsh_dir}

echo "Install the prezto"
zprezto_dir="${HOME}/.zprezto"
if [ ! -d ${zprezto_dir} ]; then
    git clone --depth 1 --recursive https://github.com/sorin-ionescu/prezto ${zprezto_dir}

    echo "Link zprezto config files"
    setopt EXTENDED_GLOB
    for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
        ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
    done
else
    echo "Skip install zprezto"
fi

zshrc_file="${HOME}/.zshrc"
new_zshrc_file="${HOME}/dotfiles/.zshrc"

echo "Delete ${zshrc_file}"
rm "${zshrc_file}"

echo "Link ${new_zshrc_file} to  ${zshrc_file}"
ln -sf "${new_zshrc_file}" "${zshrc_file}"

zpreztorc_file="${HOME}/.zpreztorc"
new_zpreztorc_file="${HOME}/dotfiles/.zpreztorc"

echo "Delete ${zpreztorc_file}"
rm "${zpreztorc_file}"

echo "Link ${new_zpreztorc_file} to  ${zpreztorc_file}"
ln -sf "${new_zpreztorc_file}" "${zpreztorc_file}"

source ${zshrc_file}
