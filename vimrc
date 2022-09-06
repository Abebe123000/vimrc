" resumeインクリメンタル検索 (検索ワードの最初の文字を入力した時点で検索が開始)
set incsearch
" 検索結果をハイライト表示
set hlsearch
" タブ文字を CTRL-I で表示し、行末に $ で表示する
set list
" 行末のスペースを可視化
set listchars=tab:^\ ,trail:~
" コマンドラインの履歴を10000件保存する
set history=10000
" タイトルを表示
set title
" 行番号の表示
set number
" タイトルを表示
set title
" 行番号の表示
set number
" ヤンクでクリップボードにコピー
"set clipboard=unnamed,autoselect
" Escの2回押しでハイライト消去
nnoremap <Esc><Esc> :nohlsearch<CR><ESC>
" シンタックスハイライト
syntax on
" すべての数を10進数として扱う
set nrformats=
" バッファスクロール
"set mouse=a
" ステータスラインを常に表示
set laststatus=2
" 現在の行を強調表示
set cursorline
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd
" インテンド関連
set expandtab "タブ入力を複数の空白入力に置き換える
set tabstop=4 "画面上でタブ文字が占める幅
set shiftwidth=4 "自動インデントでずれる幅
set softtabstop=4 "連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent "改行時に前の行のインデントを継続する
set smartindent "改行時に入力された行の末尾に合わせて次の行のインデントを増減する
"スクロールに余裕をもたせる
set scrolloff=10
" 折りたたみレベル
set foldlevel=1
set foldnestmax=2
" ターミナルを開いたら常にinsertモードになる
" autocmd TermOpen * :startinsert
" ターミナルモードで行番号を非表示
autocmd TermOpen * setlocal norelativenumber
autocmd TermOpen * setlocal nonumber

" ターミナルが正常終了したとき自動で閉じる
" autocmd TermClose * if !v:event.status | exe 'bdelete! '..expand('<abuf>') | endif

" newrw 設定
let g:netrw_preview   = 1
let g:netrw_liststyle = 3
let g:netrw_winsize   = 30

" プラグイン vim-plug
call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
"Plug 'vifm/vifm.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-git-status.vim'
Plug 'lambdalisue/fern-hijack.vim'
"Plug 'yuki-yano/fern-preview.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tomasiser/vim-code-dark'
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'skanehira/translate.vim'
"Plug 'voldikss/vim-floaterm'
"Plug 'ptzz/lf.vim'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'lambdalisue/nerdfont.vim'
Plug 'airblade/vim-gitgutter'
"Plug 'sslivkoff/vim-scroll-barnacle' " diff でバグる
"Plug 'Xuyuanp/scrollbar.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 't9md/vim-quickhl'
Plug 'nvim-lua/plenary.nvim' " telescope.nvim の依存先
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'petertriho/nvim-scrollbar'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
call plug#end()

"カラースキーム設定
set termguicolors
colorscheme nightfly

"キーマップ設定
nnoremap x "_x
let mapleader = "\<SPACE>"
nnoremap <C-Space> <C-w>
nnoremap qq :q!<CR>
nnoremap <silent> <Tab> <Plug>AirlineSelectPrevTab
nnoremap <silent> <S-Tab> <Plug>AirlineSelectNextTab
" 矢印キーで画面スクロール
nnoremap <Up> <C-u>
nnoremap <Down> <C-d>
" キーマップ設定（コマンドライン）
" Ctrl + a で一番前に移動
cnoremap <C-a> <C-b>
" キーマップ設定（ターミナル）
" Esc で通常モードになる
tnoremap <Esc> <C-\><C-n>
" ウィンドウ操作
tnoremap <C-Space> <C-\><C-n><C-w>

" term
nnoremap <silent> <Leader>t :terminal bash<CR>i
" gitui
nnoremap <silent> <Leader>g :terminal gitui<CR>i
" fern
nnoremap <silent> <Leader>e :Fern . -reveal=%<CR>

" telescope
nnoremap <silent> <Leader><Space> :Telescope<CR>
nnoremap <silent> <Leader>f :Telescope live_grep<CR>
nnoremap <silent> <Leader>r :Telescope resume<CR>
nnoremap <silent> <Leader>R :Telescope pickers<CR>
nnoremap <silent> <Leader>p :Telescope find_files<CR>
nnoremap <silent> <Leader>m :Telescope marks<CR>
" buffers
nnoremap <Leader>b :buffers<CR>
"
" t9md/vim-quickhl
nmap <Leader>h <Plug>(quickhl-manual-this)
xmap <Leader>h <Plug>(quickhl-manual-this)
nmap <Leader>H <Plug>(quickhl-manual-reset)
xmap <Leader>H <Plug>(quickhl-manual-reset)

"vim-floaterm
"let g:floaterm_wintype='split'
"let g:floaterm_width=0.95
"let g:floaterm_height=0.5
"let g:floaterm_position='bottom'
"let g:floaterm_opener='edit'
"let g:floaterm_autoclose=2

" 折りたたむ
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

" gitgutter
set signcolumn=yes
set updatetime=100
"lf.vim
" let g:lf_replace_netrw=1

" fzf.vim
"let g:fzf_layout = {'down':'50%'}


" font
":set guifont=Sarasa:h14


" vim-airline
" 上部にバッファをタブ形式で表示
let g:airline#extensions#tabline#enabled = 1
" バッファに表示しないものリスト
let g:airline#extensions#tabline#ignore_bufadd_pat = 'defx|gundo|nerd_tree|startify|tagbar|undotree|vimfiler'
" スクロールバー
" let g:airline#extensions#scrollbar#enabled = 1
" 何が変わっているのか謎


" Xuyuanp/scrollbar.nvim
augroup ScrollbarInit
    autocmd!
    autocmd WinScrolled,VimResized,QuitPre * silent! lua require('scrollbar').show()
    autocmd WinEnter,FocusGained           * silent! lua require('scrollbar').show()
    autocmd WinLeave,BufLeave,BufWinLeave,FocusLost            * silent! lua require('scrollbar').clear()
augroup end
" let g:scrollbar_shape = {
"    \ 'head': '▕',
"    \ 'body': '▕',
"    \ 'tail': '▕',
"    \}

lua << EOF
--telescope
require('telescope').setup{
defaults = {
    mappings = {
        i = {
            ["<C-j>"] = "move_selection_next",
            ["<C-k>"] = "move_selection_previous"
            }
        },
    cache_picker = {
        num_pickers = 100
        }
    },
extensions = {
    fzf = {
        fuzzy = false,                    -- false will only do exact matching
        override_generic_sorter = true,  -- override the generic sorter
        override_file_sorter = true,     -- override the file sorter
        case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
        -- the default case_mode is "smart_case"
        }
    }
}
require('telescope').load_extension('fzf')
--scrollbar
require("scrollbar").setup()
EOF
