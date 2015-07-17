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
" html
NeoBundle 'mattn/emmet-vim'
" Javascript
NeoBundle 'pangloss/vim-javascript'
" Python
NeoBundle 'hdima/python-syntax'
" Golang
NeoBundle 'fatih/vim-go'

call neobundle#end()
" Required
filetype plugin indent on
" 未インストールのプラグインがある時にインストールするかを尋ねる
NeoBundleCheck