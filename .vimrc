" ------------------------Common------------------------ "
"タイトルをバッファ名に変更しない
set notitle
set shortmess+=I

"ターミナル接続を高速にする
set ttyfast

"ターミナルで256色表示を使う
set t_Co=256

"Tabをスペース4つに展開＆Tabの設定
set tabstop=4
set autoindent
set smartindent
set expandtab
set shiftwidth=4

"自動的にペーストモードを終了する
autocmd InsertLeave * set nopaste

"複数ファイルの編集を可能にする
set hidden

"内容が変更されたら自動的に再読み込み
set autoread

"Swapを作るまでの時間m秒
set updatetime=0

"Unicodeで行末が変になる問題を解決
set ambiwidth=double

"行間をでシームレスに移動する
set whichwrap=b,s,h,l,<,>,[,] 

"Backspace Settings
set backspace=start,eol,indent

"コマンドライン上をTABで補完できるようにする
set wildmenu
set wildchar=<Tab>
set wildmode=longest:full,full

"C-vの矩形選択で行末より後ろもカーソルを置ける
set virtualedit=block

"検索結果をハイライトする
set hlsearch
"入力完了を待たずに検索結果を表示する
set incsearch
"大文字小文字区別なしに検索
set ignorecase
"大文字が含まれるときだけ区別して検索
set smartcase
"ビジュアルモードで選択中に*キーで検索
vnoremap * "zy:let @/ = @z<CR>n

" <Esc> 連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

"行番号を表示
set number

" ステータス行の表示
set laststatus=2
" ステータス行の内容を変更
set statusline=%<%f\%m%r%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l/%L,%v
" ファイルへの相対パスを表示する
let g:Powerline_stl_path_style = 'relative'

"C-w,oでファイルを指定して横分割、オープン
nmap <C-W>o :sp
"C-w,Oでファイルを指定して縦分割、オープン
nmap <C-W>O :vp

"C-pで"0レジスタの内容をコピーする
nmap <silent> <C-p> "0p

" Leaderを , に設定
let mapleader = ","

"SCSS用のシンタックス設定
au BufRead,BufNewFile *.scss set filetype=sass

" ------------------------NeoBundle------------------------ "
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif
call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

" Installation check
if neobundle#exists_not_installed_bundles()
  echomsg 'Not installed bundles : ' .
    \ string(neobundle#get_not_installed_bundle_names())
  echomsg 'Please execute ":NeoBundleInstall" command.'
          "finish
endif

" Plugins
NeoBundle 'Shougo/vimproc', {
    \ 'build' : {
        \ 'windows' : 'make -f make_mingw32.mak',
        \ 'cygwin' : 'make -f make_cygwin.mak',
        \ 'mac' : 'make -f make_mac.mak',
        \ 'unix' : 'make -f make_unix.mak',
  \ },
\ }                                     " vimproc-ja        : 非同期処理系
NeoBundle 'Shougo/vimshell'             " Shell             : シェル
NeoBundle 'Shougo/neocomplcache'        " NeoComplCache     : キーワード補完
NeoBundle 'Shougo/neomru.vim'           " NeoMRU            : 最近開いたファイル
NeoBundle 'scrooloose/nerdtree'         " NERDTree          : Filer
NeoBundle 'scrooloose/syntastic'        " Syntastic         : シンタックスチェック
NeoBundle 'beyondwords/vim-twig'        " Twig              : Twigのシンタックス
NeoBundle 'Shougo/unite.vim'            " Unite             : 統合インターフェース
NeoBundle 'tsukkee/unite-help'          " unite-help        : ヘルプ
NeoBundle 'thinca/vim-quickrun'         " quickrun          : リアルタイム実行
NeoBundle 'stephpy/vim-php-cs-fixer'    " php-cs-fixer      : PHP Coding Standards Fixer
NeoBundle 'itchyny/thumbnail.vim'       " thumbnail         : バッファーのサムネイル表示

" ====================
" Color Scheme Import{
" ====================
NeoBundle 'sjl/badwolf'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'ciaranm/inkpot'
NeoBundle 'djjcast/mirodark'
NeoBundle 'vim-scripts/twilight'
NeoBundle 'vim-scripts/moria'
NeoBundle 'croaker/mustang-vim'
NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle 'tomasr/molokai'
NeoBundle 'vim-scripts/Guardian'
NeoBundle 'itchyny/lightline.vim'       " statusline      : ステータスラインの色設定等

" ====================
"   }
" ====================
" \Plugins

call neobundle#end()
filetype plugin indent on
colorscheme twilight

" ====================
" Complement Settings{
" ====================
" Disable AutoComplPop
let g:acp_enableAtStartup = 0
" Use neocomplcache
let g:neocomplcache_enable_at_startup = 1
" Use smartcase
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
\ }

" Plugin key-mappings
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings
" <CR>: close popup and save indent
inoremap <expr><CR> neocomplcache#smart_close_popup()."<CR>"
" <TAB>: completion
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" ====================
"   }
" ====================

" ====================
" Unite Settings{
" ====================
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
" ノーマルモードで ,uu と入力すると履歴を表示するマッピング
nnoremap <silent> <Leader>uu :<C-u>Unite file_mru buffer<CR>
" ノーマルモードで ,uy と入力すると yank の履歴を表示するマッピング
nnoremap <silent> <Leader>uy :<C-u>Unite history/yank<CR>
" ====================
"   }
" ====================

" ====================
" Quickrun settings{
" ====================
augroup QuickRunPHPUnit
    autocmd!
    autocmd BufWinEnter,BufNewFile *test.php set filetype=php.unit
    autocmd BufWinEnter,BufNewFile *Test.php set filetype=php.unit
augroup END

let g:quickrun_config = {}
"let g:quickrun_config._ = {'runner' : 'vimproc'}
let g:quickrun_config['php.unit'] = {'command' : 'phpunit'}
" ====================
"   }
" ====================

" ====================
" Command settings{
" ====================
" Diff{
function! s:vimdiff_in_newtab(...)
    if a:0 == 1
        tabedit %:p
        exec 'rightbelow vertical diffsplit ' . a:1
    else
        exec 'tabedit ' . a:1
        for l:file in a:000[1 :]
            exec 'rightbelow vertical diffsplit ' . l:file
        endfor
    endif
endfunction
command! -bar -nargs=+ -complete=file Diff  call s:vimdiff_in_newtab(<f-args>)
" }

" Compare{
function! s:compare(...)
    if a:0 == 1
        tabedit %:p
        exec 'rightbelow vnew ' . a:1
    else
        exec 'tabedit ' . a:1
        setl scrollbind
        for l:file in a:000[1 :]
            exec 'rightbelow vnew ' . l:file
            setl scrollbind
        endfor
    endif
endfunction
command! -bar -nargs=+ -complete=file Compare  call s:compare(<f-args>)
" }
" ====================
"   }
" ====================

" ====================
" Lightline settings{
" ====================
let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ }
" ====================
"   }
" ====================

if filereadable('.local.vimrc')
    source .local.vimrc
endif
syntax on

" open quick-window after grep
autocmd QuickFixCmdPost *grep* cwindow
