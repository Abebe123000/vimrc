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
" マウス無効
set mouse-=a
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
set scrolloff=100
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
Plug 'tpope/vim-surround'
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
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 't9md/vim-quickhl'
Plug 'nvim-lua/plenary.nvim' " telescope.nvim の依存先
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'petertriho/nvim-scrollbar'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'frazrepo/vim-rainbow'
Plug 'folke/which-key.nvim'
Plug 'tyru/capture.vim'
call plug#end()

"カラースキーム設定
set termguicolors
colorscheme nightfly

" QuickFix を自動で開く
autocmd QuickfixCmdPost make,grep,grepadd,vimgrep copen

"キーマップ設定
inoremap <C-b> <Left>
inoremap <C-f> <Right>
nnoremap x "_x
let mapleader = "\<SPACE>"
nnoremap qq :q!<CR>
nnoremap <silent> <Tab> <Plug>AirlineSelectNextTab
nnoremap <silent> <S-Tab> <Plug>AirlineSelectPrevTab
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
source ~/projects/vimrc/alt_keybindings

" t9md/vim-quickhl
nmap <Leader>h <Plug>(quickhl-manual-this)
xmap <Leader>h <Plug>(quickhl-manual-this)
nmap <Leader>H <Plug>(quickhl-manual-reset)
xmap <Leader>H <Plug>(quickhl-manual-reset)

set timeoutlen=500
" 折りたたむ
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

" gitgutter
set signcolumn=yes
set updatetime=100

"vim-rainbow
let g:rainbow_active = 1

" vim-airline
" 上部にバッファをタブ形式で表示
let g:airline#extensions#tabline#enabled = 1
" バッファに表示しないものリスト
let g:airline#extensions#tabline#ignore_bufadd_pat = 'defx|gundo|nerd_tree|startify|tagbar|undotree|vimfiler'
" スクロールバー
" let g:airline#extensions#scrollbar#enabled = 1
" 何が変わっているのか謎

"fern-preview
"let g:fern_auto_preview = v:true

" lf.vim
"let g:lf_replace_netrw = 1

"capture.vim
let g:capture_open_command = 'belowright vnew'

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
require("which-key").setup{
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = '<c-d>', -- binding to scroll down inside the popup
    scroll_up = '<c-u>', -- binding to scroll up inside the popup
  },
  window = {
    border = "none", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
  -- disable the WhichKey popup for certain buf types and file types.
  -- Disabled by deafult for Telescope
  disable = {
    buftypes = {},
    filetypes = { "TelescopePrompt" },
  },
}
EOF
