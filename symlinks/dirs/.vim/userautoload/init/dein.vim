" dein.vimの設定

if &compatible
  set nocompatible
endif

set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

" git cloneのdepthオプションの設定
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

" syntastic
call dein#add('vim-syntastic/syntastic')

" Laravel Blade
call dein#add('jwalton512/vim-blade')

" Ruby
call dein#add('vim-ruby/vim-ruby')

" JavaScript
call dein#add('pangloss/vim-javascript')

" 終了
call dein#end()

filetype plugin indent on

" インストールされていない場合はインストールする
if dein#check_install()
  call dein#install()
endif
