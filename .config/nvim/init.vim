call plug#begin('~/.config/nvim/plugged')

"
" Base Config
"

set updatetime=300

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

set noshowmode
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

" buffers

map <leader><C-p> :bprevious<CR>
map <leader><C-n> :bnext<CR>

"
" Plugins
"

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-repeat'
Plug 'matze/vim-move'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'tomtom/tcomment_vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}

" fzf

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

let g:fzf_history_dir = '~/.local/share/fzf-history'

imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

map <C-p><C-r> :FZF<cr>
map <C-p><C-g> :GFiles<cr>
map <C-p><C-s> :GFiles?<cr>
map <C-p><C-m> :Commits<cr>
map <C-p><C-h> :History<cr>
map <C-p><C-f> :Ag<cr>
map <C-p><C-b> :Buffers<cr>

Plug 'pbogut/fzf-mru.vim'

map <C-p><C-p> :FZFMru<cr>

" coc

Plug 'neoclide/coc.nvim', {'branch': 'release'}

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gs <Plug>(coc-documentSymbols)

nmap <silent> gld <Plug>(coc-diagnostic)
nmap <silent> gln <Plug>(coc-diagnostic-next)
nmap <silent> glp <Plug>(coc-diagnostic-prev)

nmap <silent> <leader>cr <Plug>(coc-rename)

autocmd CursorHold * silent call CocActionAsync('highlight')


" neosnippet

Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

let g:neosnippet#data_directory = $HOME.'/.cache/nvim/neosnippet'

imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" easymotion

Plug 'easymotion/vim-easymotion'

let g:move_key_modifier = 'C'
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1

map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
nmap <leader>s <Plug>(easymotion-overwin-f)
nmap <leader>s <Plug>(easymotion-overwin-f2)

" easyalign

Plug 'junegunn/vim-easy-align'

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" schlepp

Plug 'zirrostig/vim-schlepp'

vmap <C-h> <Plug>SchleppLeft
vmap <C-l> <Plug>SchleppRight

vmap  Dk <Plug>SchleppDupUp
vmap  Dj <Plug>SchleppDupDown
vmap  Dh <Plug>SchleppDupLeft
vmap  Dl <Plug>SchleppDupRight

" lightline

Plug 'itchyny/lightline.vim'

 let g:lightline = {
\ 'active': {
\   'left': [ [ 'mode', 'paste' ],
\             [ 'gitbranch', 'readonly', 'filename', 'modified'] 
\           ]
\ },
\ 'component_function': {
\   'filename': 'LightlineFilename',
\   'gitbranch': 'fugitive#head'
\ }
\}

function! LightlineFilename()
  return  expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
endfunction

" indent guides

Plug 'nathanaelkane/vim-indent-guides'

let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 1
let g:indent_guides_color_change_percent = 1
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=darkgrey
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=darkgrey
if has('conceal')
  set conceallevel=0 concealcursor=niv
endif

" base16

Plug 'chriskempson/base16-vim'

colorscheme base16-default-dark

"
" File Types
"

" js

Plug 'HerringtonDarkholme/yats.vim'

au BufRead,BufNewFile *.ts,*.tsx set filetype=typescript.tsx

" md

au FileType markdown :set spell
au FileType markdown map <Bar> vip :EasyAlign*<Bar><Enter>
au BufRead,BufNewFile *.md setlocal textwidth=120

call plug#end()

call coc#add_extension('coc-json', 'coc-tsserver', 'coc-tslint-plugin', 'coc-prettier')
