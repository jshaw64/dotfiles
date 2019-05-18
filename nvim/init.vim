call plug#begin('~/.config/nvim/plugged')

"
" Base Config
"

set guicursor=n-v-c:block-Cursor-blinkon0
set cursorline
set sidescrolloff=999

set hlsearch
set ignorecase
set showmatch
set matchtime=10

set tabstop=2
set expandtab
set shiftwidth=2
set shiftround

set relativenumber
set number
set numberwidth=1

set laststatus=2
set title
set nowrap

set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list

set formatoptions-=t

set clipboard=unnamed
set nocompatible
set modelines=0

syntax on

set encoding=utf-8
scriptencoding utf-8

set backupdir=~/.config/nvim/backups
set directory=~/.config/nvim/swap

if has('persistent_undo')
  set undofile
  set undodir=$HOME/.config/nvim/undo
endif

au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
au BufWrite /private/etc/pw.* set nowritebackup nobackup


"
" Bindings
"

let mapleader = "\<space>"
let maplocalleader = "\\"

inoremap jk <esc>
inoremap JK <esc>

nnoremap <CR> o<Esc>
nnoremap <BS> dd
nnoremap <leader><BS> ddk
noremap - dd
noremap + yyp

noremap <leader>dw "_dw
noremap <leader>d$ "_d$
noremap <leader>p "_dwP
noremap <leader>P "_DwP
noremap <leader>PP gg"_dGP
noremap <leader>r' "_di'P
noremap <leader>r" "_di"P
noremap <leader>r` "_di`P
noremap <leader>R "_Dp
nnoremap <Leader>x /\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgn
nnoremap <Leader>X ?\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgN

noremap <leader>u <C-v>iwu
noremap <leader>U <C-v>iwU
nnoremap <M-w> viwu
nnoremap <S-M-w> viwU

nnoremap H ^
nnoremap L $
noremap <M-;> %

noremap <leader>. =aB

noremap <leader>l :set list!<CR>
noremap <leader>c :noh<cr>
noremap <leader>w :w<CR>
nnoremap <leader>rc :vsplit $MYVIMRC<cr>
nnoremap <leader>Rc :source $MYVIMRC<cr>
nnoremap <leader>cp :let @*=expand("%:p:h")<CR>

"
" Plugins
"

" fzf

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

let g:fzf_history_dir = '~/.local/share/fzf-history'

Plug 'pbogut/fzf-mru.vim'

map <C-p><C-p> :FZFMru<cr>
map <C-p><C-r> :FZF<cr>
map <C-p><C-g> :GFiles<cr>
map <C-p><C-s> :GFiles?<cr>
map <C-p><C-h> :History<cr>


" neomake

Plug 'https://github.com/neomake/neomake'
Plug 'benjie/neomake-local-eslint.vim'

let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_scss_enabled_markers = ['sass-lint']

autocmd BufWritePost *.js,*.json,*.css,*.scss Neomake

call plug#end()
