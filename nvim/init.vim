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

call plug#end()
