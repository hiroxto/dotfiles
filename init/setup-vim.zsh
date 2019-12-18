#!/usr/bin/env zsh

set -eu

echo "Setup vim"

vim_dir="${HOME}/.vim"
vim_colors_dir="${vim_dir}/colors"
dein_vim_dir="${vim_dir}/dein/repos/github.com/Shougo/dein.vim"

echo "Create ${vim_dir} directory"
mkdir -p ${vim_dir}

echo "Install dein.vim"
if [ -d ${dein_vim_dir} ];then
    echo "Directory ${dein_vim_dir} is already exist."
    echo "Skip install dein.vim"
else
    mkdir -p ${dein_vim_dir}
    git clone --depth 1 https://github.com/Shougo/dein.vim ${dein_vim_dir}
fi

echo "Create ${vim_colors_dir} directory"
mkdir -p ${vim_colors_dir}

echo "Install molokai color"
molokai_color_file="${vim_colors_dir}/molokai.vim"
if [ -f ${molokai_color_file} ]; then
    echo "Remove old molokai"
    rm ${molokai_color_file}
fi
echo "Install molokai"
curl -sS https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim >> ${molokai_color_file}

echo "Install onedark color"
onedark_color_file="${vim_colors_dir}/onedark.vim"
if [ -f ${onedark_color_file} ]; then
    echo "Remove old onedark"
    rm ${onedark_color_file}
fi
echo "Install onedark"
curl -sS https://raw.githubusercontent.com/geoffharcourt/one-dark.vim/master/colors/onedark.vim >> ${onedark_color_file}
