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

" Start NeoBundle
set runtimepath+=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle/'))
" NeoBundle
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
" elixir
NeoBundle 'elixir-lang/vim-elixir'
" Crystal
NeoBundle 'rhysd/vim-crystal'
" JavaScript
NeoBundle 'pangloss/vim-javascript'
" Python
NeoBundle 'hdima/python-syntax'
" Golang
NeoBundle 'fatih/vim-go'
" html
NeoBundle 'mattn/emmet-vim'
" End NeoBundle
call neobundle#end()
filetype plugin indent on
" 未インストールのプラグインがある時にインストールするかを尋ねる
NeoBundleCheck

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
    \ }
" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()
" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

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