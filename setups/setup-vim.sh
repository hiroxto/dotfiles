#!/usr/bin/env zsh

set -eu

echo "Setup vim"

vim_dir="${HOME}/.vim"

echo "Create ${vim_dir} directory"
mkdir -p ${vim_dir}

echo "Install the dein.vim"
dein_vim_dir="${HOME}/.vim/dein/repos/github.com/Shougo/dein.vim"
if [ -d ${dein_vim_dir} ];then
    echo "Skip"
else
    mkdir -p ${dein_vim_dir}
    git clone --depth 1 https://github.com/Shougo/dein.vim ${dein_vim_dir}
fi

echo "Link userautoload"
userautoload_link_from="${HOME}/dotfiles/.vim/userautoload"
userautoload_link_to="${HOME}/.vim/userautoload"
echo "Link ${userautoload_link_from} to ${userautoload_link_to}"
ln -sf ${userautoload_link_from} ${userautoload_link_to}

echo "Setup vim colors"

vim_colors_dir="${HOME}/.vim/colors"
echo "Create ${vim_colors_dir} directory"
mkdir -p ${vim_colors_dir}

echo "Install the molokai color"
molokai_color_file="${molokai_color_file}"
if [ -f ${molokai_color_file} ]; then
    echo "Remove the old molokai file"
    rm ${molokai_color_file}
fi
echo "Install molokai"
curl -sS https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim >> ${molokai_color_file}

echo "Install the onedark color"
onedark_color_file="${HOME}/.vim/colors/onedark.vim"
if [ -f ${onedark_color_file} ]; then
    echo "Remove onedark file"
    rm ${onedark_color_file}
fi
echo "Install onedark"
curl -sS https://raw.githubusercontent.com/geoffharcourt/one-dark.vim/master/colors/onedark.vim >> ${onedark_color_file}
