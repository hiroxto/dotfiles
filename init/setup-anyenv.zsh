#!/usr/bin/env zsh

set -eu

echo "Install anyenv"

anyenv_dir="${HOME}/.anyenv"
anyenv_bin="${anyenv_dir}/bin/anyenv"
anyenv_plugins_dir="${anyenv_dir}/plugins"
anyenv_update_dir="${anyenv_dir}/plugins/anyenv-update"
export ANYENV_ROOT="${anyenv_dir}"
export SHELL="zsh"

if [ -d ${anyenv_dir} ]; then
    echo "Directory ${anyenv_dir} is already exist."
    echo "Skip install the anyenv."
else
    git clone --depth 1 https://github.com/anyenv/anyenv ${anyenv_dir}
fi

echo "Install anyenv-update"
echo "Create directory ${anyenv_plugins_dir}"
mkdir -p ${anyenv_plugins_dir}

if [ -e ${anyenv_update_dir} ];then
    echo "Directory ${anyenv_update_dir} is already exist."
    echo "Skip install the anyenv-update."
else
    git clone --depth 1 https://github.com/znz/anyenv-update ${anyenv_update_dir}
fi

echo "Successfully installed anyenv and anyenv-update"
echo "Please execute 'bash utils/install-anyenv.sh'"
