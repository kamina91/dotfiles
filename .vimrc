"-------common--------
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
set expandtab
set shiftwidth=4

"VIM互換にしない
set nocompatible

"複数ファイルの編集を可能にする
set hidden

"内容が変更されたら自動的に再読み込み
set autoread

"Swapを作るまでの時間m秒
set updatetime=0

"Unicodeで行末が変になる問題を解決
set ambiwidth=double

"行間をでシームレスに移動する
set whichwrap+=h,l,<,>,[,],b,s

"Backspace Settings
set backspace=start,eol,indent

"コマンドラインでTABで補完できるようにする
set wildchar=<C-Z>

"C-vの矩形選択で行末より後ろもカーソルを置ける
set virtualedit=block

"SCSS用のシンタックス設定
au BufRead,BufNewFile *.scss set filetype=sass

"検索結果をハイライトする
set hlsearch

" <Esc> 連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

"行番号を表示
set number

" ステータス行の表示
set laststatus=2
" ステータス行の内容を変更
set statusline=%<%f\%m%r%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l/%L,%v
"set statusline=%{expand('%:p:t')}\ %<[%{expand('%:p:h')}]%=\%m%r%y%w[%{&fenc!=''?&fenc:&enc}][%{&ff}][%3l,%3c,%3p]
" ファイルへの相対パスを表示する
let g:Powerline_stl_path_style = 'relative'

"C-W,oでファイルを指定して横分割、オープン
nmap <C-W>o :sp
"C-W,Oでファイルを指定して縦分割、オープン
nmap <C-W>O :vp

set nocompatible               " be iMproved
filetype off

"NeoBundle
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif
call neobundle#rc(expand('~/.vim/bundle/'))

filetype plugin indent on     " required!

" Installation check.
if neobundle#exists_not_installed_bundles()
  echomsg 'Not installed bundles : ' .
    \ string(neobundle#get_not_installed_bundle_names())
  echomsg 'Please execute ":NeoBundleInstall" command.'
          "finish
endif


" originalrepos on github
NeoBundle 'Shougo/neobundle.vim'        " NeoBundle         : パッケージマネージャ
NeoBundle 'Shougo/vimproc'              " vimproc-ja        : 非同期処理系
NeoBundle 'Shougo/vimshell'             " Shell             : シェル
NeoBundle 'Shougo/neocomplcache'        " NeoComplCache     : キーワード補完
NeoBundle 'Shougo/neosnippet'           " NeoSnippet        : Snippet補完
NeoBundle 'Shougo/neomru.vim'           " NeoMRU            : 最近開いたファイル
NeoBundle 'scrooloose/syntastic'        " Syntastic         : シンタックスチェック
NeoBundle 'beyondwords/vim-twig'        " Twig              : Twigのシンタックス
NeoBundle 'scrooloose/nerdtree'         " NERDTree          : Filer


" ====================
" Unite Settings{
" ====================
NeoBundle 'Shougo/unite.vim'            " Unite             : 統合インターフェース
NeoBundle 'tsukkee/unite-help'          " unite-help        : ヘルプ
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
" ノーマルモードで ,uu と入力すると履歴を表示するマッピング
nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>
" ====================
"   }
" ====================

" インデントに色を付けて見やすくする
"NeoBundle 'nathanaelkane/vim-indent-guides'
" vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
"let g:indent_guides_enable_on_vim_startup = 1


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

colorscheme moria
" ====================
"   }
" ====================

filetype indent on
syntax on
set background=dark
