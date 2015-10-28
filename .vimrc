" ハイライトをオン
syntax on
" タイトル表示
set title
" 行表示
set number

" カラースキーマ
set t_Co=256
colorscheme onedark
"let g:molokai_original=1
"set background=dark

" 複数ファイルの編集を可能にする
set hidden
" バックアップを作成しない
set nobackup

" bundle
set runtimepath+=~/.vim/bundle/neobundle.vim/
" ここからNeobundle
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

" Laravel Blade
NeoBundle 'xsbeats/vim-blade'

" Ruby
NeoBundle 'vim-ruby/vim-ruby'

" Ruby on Rails
NeoBundle 'tpope/vim-rails'

" CoffeeScript
NeoBundle 'kchmck/vim-coffee-script'

" JavaScript
NeoBundle 'pangloss/vim-javascript'

" Python
NeoBundle 'hdima/python-syntax'

" Golang
NeoBundle 'fatih/vim-go'

" html
NeoBundle 'mattn/emmet-vim'

" ここまでNeobundle
call neobundle#end()

filetype plugin indent on

" 未インストールのプラグインがある時にインストールするかを尋ねる
NeoBundleCheck

" CoffeeScript
au BufRead,BufNewFile,BufReadPre *.coffee set filetype=coffee
" インデント設定
autocmd FileType coffee setlocal sw=2 sts=2 ts=2 et
" オートコンパイル。保存と同時にコンパイルする
autocmd BufWritePost *.coffee silent make!
" エラーがあったら別ウィンドウで表示
autocmd QuickFixCmdPost * nested cwindow | redraw!
" Ctrl-cで右ウィンドウにコンパイル結果を一時表示する
nnoremap <silent> <C-C> :CoffeeCompile vert <CR><C-w>h