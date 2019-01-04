#!/usr/bin/env zsh

set -eu

echo "Install the anyenv"
anyenv_dir="${HOME}/.anyenv"
anyenv_bin="${anyenv_dir}/bin/anyenv"
if [ -d ${anyenv_dir} ]; then
    echo "Directory ${anyenv_dir} is already exist."
    echo "Skip install the anyenv."
else
    git clone --depth 1 https://github.com/riywo/anyenv ${anyenv_dir}
fi

echo "Install envs"
for envname in rbenv phpenv pyenv crenv ndenv; do
    echo "Install ${envname}"
    env_dir="${HOME}/.anyenv/envs/${envname}"
    if [ -d ${env_dir} ];then
        echo "Directory ${anyenv_dir} is already exist."
        echo "Skip install the ${envname}."
    else
        ${anyenv_bin} install -f ${envname}
    fi
done

echo "Install anyenv-update"
anyenv_plugins_dir="${HOME}/.anyenv/plugins"
anyenv_update_dir="${HOME}/.anyenv/plugins/anyenv-update"

echo "Create ${anyenv_plugins_dir} directory"
mkdir -p ${anyenv_plugins_dir}

echo "Install anyenv-update"
if [ -e ${anyenv_update_dir} ];then
    echo "Directory ${anyenv_update_dir} is already exist."
    echo "Skip install the anyenv-update."
else
    git clone --depth 1 https://github.com/znz/anyenv-update ${anyenv_update_dir}
fi
