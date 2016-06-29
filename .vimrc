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

" スワップファイルを作らない
set noswapfile

" Start dein.vim
if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.vim/dein'))

" ここにプラグインを書く
" dein.vim
call dein#add('Shougo/dein.vim')

" neocomplcache
call dein#add('Shougo/neocomplcache.vim')

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

" End dein.vim
call dein#end()

filetype plugin indent on

" Check install
if dein#check_install()
  call dein#install()
endif

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0

" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1

" Use smartcase.
let g:neocomplcache_enable_smart_case = 1

" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" ディレクトリを設定
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

" CoffeeScriptを認識させる
au BufRead,BufNewFile,BufReadPre *.coffee set filetype=coffee