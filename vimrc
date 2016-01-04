"
"TODO for using this on new environment
"
"1. Install pathogen
"mkdir -p ~/.vim/autoload ~/.vim/bundle && \
"curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
"(Reference: https://github.com/tpope/vim-pathogen)
"
"2. Install plugins
"cd ~/.vim/bundle
"git clone https://github.com/mattn/emmet-vim.git
"git clone https://github.com/tpope/vim-abolish.git
"git clone https://github.com/tpope/vim-fugitive
"git clone https://github.com/tpope/vim-surround.git
"git clone https://github.com/Shougo/vimshell.vim.git
"
set nocompatible
filetype off
syntax on

"plugin
execute pathogen#infect()
filetype plugin indent on

"encoding
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,iso-2022-jp,sjis,cp932,euc-jp,cp20932

"cursor
set whichwrap=b,s,h,l,<,>,[,]

"search
set incsearch
set hlsearch

"format
set expandtab
set tabstop=2
set softtabstop=0
set shiftwidth=2
set textwidth=9999

"buffer
set hidden

"other
set ambiwidth=double
set noswapfile
set backupdir=$HOME/vimfiles/vimbackup
set directory=$HOME/vimfiles/vimbackup
set clipboard=unnamed,autoselect
set wildmode=longest:full,full
set noundofile
set history=2000

"display
set list
set listchars=tab:▸\ ,trail:_,eol:¬,extends:>,precedes:<,nbsp:%

"file-browsing
let g:netrw_localcopycmd=''
let g:netrw_preview=1
set browsedir=buffer
let g:netrw_liststyle=3
let g:netrw_winsize=80
let g:netrw_altv=1
let g:netrw_alto=1

"key-bind
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>
nnoremap <silent> [q :qprevious<CR>
nnoremap <silent> ]q :qnext<CR>
nnoremap <silent> [Q :qfirst<CR>
nnoremap <silent> ]Q :qlast<CR>
nnoremap <silent> [l :lprevious<CR>
nnoremap <silent> ]l :lnext<CR>
nnoremap <silent> [L :lfirst<CR>
nnoremap <silent> ]L :llast<CR>
nnoremap <silent> [t :tabprevious<CR>
nnoremap <silent> ]t :tabNext<CR>
nnoremap <silent> [T :tabfirst<CR>
nnoremap <silent> ]T :tablast<CR>
nnoremap <C-N> :bn<CR>
nnoremap <C-P> :bp<CR>
nnoremap <C-C> :bp\|bd #<CR>
nnoremap <Space>b :ls<CR>:buffer 
nnoremap <Space>f :edit .<CR>
nnoremap <Space>v :vsplit<CR><C-w><C-w>:ls<CR>:buffer
nnoremap <Space>V :Vexplore!<CR><CR>
nnoremap <C-H> <C-w>h
nnoremap <C-L> <C-w>l
nnoremap <C-J> <C-w>j
nnoremap <C-K> <C-w>k
"nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
nnoremap /  /\v
:cnoremap %s/ %s/\v

function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkRed
endfunction

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme       * call ZenkakuSpace()
        autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
    augroup END
    call ZenkakuSpace()
endif
