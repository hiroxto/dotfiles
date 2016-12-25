" dein.vimの設定

if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

" git cloneのdepthオプションの設定
" 1に設定
let dein#types#git#clone_depth = 1

" 開始
call dein#begin(expand('~/.vim/dein'))

" ここにプラグインを書く
" dein.vim
call dein#add('Shougo/dein.vim')

" neocomplete.vim
call dein#add('Shougo/neocomplete.vim')

" Editorconfig-Vim
call dein#add('editorconfig/editorconfig-vim')

" multiple-cursors
call dein#add('terryma/vim-multiple-cursors')

" syntastic
call dein#add('scrooloose/syntastic')

" Laravel Blade
call dein#add('xsbeats/vim-blade')

" Ruby
call dein#add('vim-ruby/vim-ruby')

" Ruby on Rails
call dein#add('tpope/vim-rails')

" CoffeeScript
call dein#add('kchmck/vim-coffee-script')

" elixir
call dein#add('elixir-lang/vim-elixir')

" Crystal
call dein#add('rhysd/vim-crystal')

" JavaScript
call dein#add('pangloss/vim-javascript')

" Python
call dein#add('hdima/python-syntax')

" Golang
call dein#add('fatih/vim-go')

" html
call dein#add('mattn/emmet-vim')

" 終了
call dein#end()

filetype plugin indent on

" インストールされていない場合はインストールする
if dein#check_install()
  call dein#install()
endif
