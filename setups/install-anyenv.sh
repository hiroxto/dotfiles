#!/bin/bash

set -eu

echo "Install the anyenv"
anyenv_dir="${HOME}/.anyenv"
if [ ! -d ${anyenv_dir} ]; then
    git clone --depth 1 https://github.com/riywo/anyenv ${anyenv_dir}
    exec $SHELL -l
else
    echo "Skip"
fi

echo "Install envs"
for envname in rbenv phpenv pyenv crenv ndenv; do
    echo "Install ${envname}"
    env_dir="${HOME}/.anyenv/envs/${envname}"
    if [ ! -d ${env_dir} ];then
        anyenv install -f ${envname}
    else
        echo "Skip"
    fi
done

echo "Install anyenv-update"
anyenv_plugins_dir="${HOME}/.anyenv/plugins"
anyenv_update_dir="${HOME}/.anyenv/plugins/anyenv-update"

echo "Create ${anyenv_plugins_dir} directory"
mkdir -p ${anyenv_plugins_dir}

echo "Install anyenv-update"
if [ ! -e ${anyenv_update_dir} ];then
    git clone --depth 1 https://github.com/znz/anyenv-update ${anyenv_update_dir}
else
    echo "Skip"
fi
