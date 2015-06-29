" ハイライトをオン
syntax on
" タイトル表示
set title
" 行表示
set number

" カラースキーマ
set t_Co=256
colorscheme molokai
let g:molokai_original=1
set background=dark
" 256色表示を使う
set t_Co=256
" 複数ファイルの編集を可能にする
set hidden
" バックアップを作成しない
set nobackup

" PHP
let php_sql_query = 1
let php_baselib = 1
let php_htmlInStrings = 1
let php_noShortTags = 1
let php_parent_error_close = 1

" bundle
set runtimepath+=~/.vim/bundle/neobundle.vim/
" Required
call neobundle#begin(expand('~/.vim/bundle/'))

" 管理するプラグインを書く
" neobundle自体をneobundleで管理
NeoBundleFetch 'Shougo/neobundle.vim'
" neocomplcache
NeoBundle 'Shougo/neocomplcache.vim'
" Editorconfig-Vim
NeoBundle 'editorconfig/editorconfig-vim'
" multiple-cursors
NeoBundle 'terryma/vim-multiple-cursors'
" syntastic
NeoBundle 'scrooloose/syntastic'
" Ruby
NeoBundle 'vim-ruby/vim-ruby'
" html補完
NeoBundle 'mattn/emmet-vim'

call neobundle#end()
" Required
filetype plugin indent on
" 未インストールのプラグインがある時にインストールするかを尋ねる
NeoBundleCheck