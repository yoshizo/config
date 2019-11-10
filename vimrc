set nocompatible
filetype off
syntax on

"plugin
"Download and install vim-plug (cross platform).
if empty(glob(
    \ '$HOME/' . (has('win32') ? 'vimfiles' : '.vim') . '/autoload/plug.vim'))
  execute '!curl -fsSLo ' .
    \ (has('win32') ? '\%USERPROFILE\%/vimfiles' : '$HOME/.vim') .
    \ '/autoload/plug.vim --create-dirs ' .
    \ 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin()
Plug 'mattn/emmet-vim'
Plug 'Shougo/neomru.vim'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimshell.vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'fatih/vim-go'
Plug 'hashivim/vim-terraform'
Plug 'vim-syntastic/syntastic'
Plug 'christoomey/vim-tmux-navigator'
call plug#end()

filetype plugin indent on

"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"Search history
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" (Optional)Remove Info(Preview) window
set completeopt-=preview

" (Optional)Hide Info(Preview) window after completions
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" (Optional) Enable terraform plan to be include in filter
let g:syntastic_terraform_tffilter_plan = 1

" (Optional) Default: 0, enable(1)/disable(0) plugin's keymapping
let g:terraform_completion_keys = 1

" (Optional) Default: 1, enable(1)/disable(0) terraform module registry completion
let g:terraform_registry_module_completion = 0

"encoding
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,iso-2022-jp,sjis,cp932,euc-jp,cp20932
set fileformats=unix,dos,mac

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

"vimgrep
set grepprg=git\ grep\ -n

"other
set ambiwidth=double
set noswapfile
set backupdir=$HOME/.vim/backup
set directory=$HOME/.vim/backup
set clipboard=unnamedplus
set wildmode=longest:full,full
set noundofile
set history=2000

"display
set list
"set listchars=tab:▸\ ,trail:_,eol:¬,extends:>,precedes:<,nbsp:%
set listchars=tab:▸\ ,trail:_,extends:>,precedes:<,nbsp:%

"file-browsing
let g:netrw_localcopycmd=''
let g:netrw_preview=1
set browsedir=buffer
let g:netrw_liststyle=3
let g:netrw_winsize=80
let g:netrw_altv=1
let g:netrw_alto=1

"terraform
let g:terraform_align=1
let g:terraform_fold_sections=0
let g:terraform_fmt_on_save=1

"key-bind
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>
nnoremap <silent> [c :cprevious<CR>
nnoremap <silent> ]c :cnext<CR>
nnoremap <silent> [C :cfirst<CR>
nnoremap <silent> ]C :clast<CR>
nnoremap <silent> [q :qprevious<CR>
nnoremap <silent> ]q :qnext<CR>
nnoremap <silent> [Q :qfirst<CR>
nnoremap <silent> ]Q :qlast<CR>
nnoremap <silent> [l :lprevious<CR>
nnoremap <silent> ]l :lnext<CR>
nnoremap <silent> [L :lfirst<CR>
nnoremap <silent> ]L :llast<CR>

nnoremap <silent> <C-S-tab> :tabprevious<CR>
nnoremap <silent> <C-tab>   :tabnext<CR>
nnoremap <silent> <A-Left>  :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . (tabpagenr())<CR>

nnoremap <C-N> :bn<CR>
nnoremap <C-P> :bp<CR>
nnoremap <C-C> :bp\|bd #<CR>
"nnoremap <Space>b :ls<CR>:buffer
"nnoremap <Space>f :edit .<CR>
"nnoremap <Space>v :vsplit<CR><C-w><C-w>:ls<CR>:buffer
nnoremap <Space>V :Vexplore!<CR><CR>
nnoremap <C-H> <C-w>h
nnoremap <C-L> <C-w>l
nnoremap <C-J> <C-w>j
nnoremap <C-K> <C-w>k
"nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
"nnoremap /  /\v

"Open current window on new tab
nmap t% :tabedit %<CR>
nmap tc :tabclose<CR>

"Keep cursor postion on new tab
"Ref: https://vim.fandom.com/wiki/Maximize_window_and_return_to_previous_split_structure
function! OpenCurrentAsNewTab()
    let l:currentPos = getcurpos()
    tabedit %
    call setpos(".", l:currentPos)
endfunction
nmap t% :call OpenCurrentAsNewTab()<CR>

"Unite
let g:unite_source_history_yank_enable =1

nmap <Space> [unite]
nnoremap <silent> [unite]a :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> [unite]f :<C-u>Unite -vertical -winwidth=60 buffer file_mru<CR>
nnoremap <silent> [unite]d :<C-u>Unite -vertical -winwidth=60 directory_mru<CR>
nnoremap <silent> [unite]b :<C-u>Unite -vertical -winwidth=60 buffer<CR>
nnoremap <silent> [unite]r :<C-u>Unite -vertical -winwidth=60 register<CR>
nnoremap <silent> [unite]t :<C-u>Unite -vertical -winwidth=60 tab<CR>
nnoremap <silent> [unite]h :<C-u>Unite<Space>history/unite<CR>
nnoremap <silent> [unite]<CR> :<C-u>Unite<Space>file_rec:!<CR>

"Vimux
nmap t [vimux]
nnoremap <silent> [vimux]ls :call VimuxRunCommand("ls ")<CR>
nnoremap <silent> [vimux]mva :call VimuxRunCommand("mvn validate -f " . bufname("%"))<CR>
nnoremap <silent> [vimux]mini :call VimuxRunCommand("mvn initialize -f " . bufname("%"))<CR>
nnoremap <silent> [vimux]mt :call VimuxRunCommand("mvn test -f " . bufname("%"))<CR>
nnoremap <silent> [vimux]mve :call VimuxRunCommand("mvn verify -DskipTests -f " . bufname("%"))<CR>
nnoremap <silent> [vimux]mins :call VimuxRunCommand("mvn install -DskipTests -f " . bufname("%"))<CR>
nnoremap <silent> [vimux]p :VimuxPromptCommand<CR>
nnoremap <silent> [vimux]l :VimuxRunLastCommand<CR>
nnoremap <silent> [vimux]i :VimuxInspectRunner<CR>
nnoremap <silent> [vimux]q :VimuxCloseRunner<CR>
nnoremap <silent> [vimux]x :VimuxInterruptRunner<CR>
nnoremap <silent> [vimux]z :call VimuxZoomRunner()<CR>
nnoremap <silent> [vimux]o :call VimuxOpenRunner()<CR>
"Should not change pwd after command execution
nnoremap <silent> [vimux]pp :VimuxPromptCommand("cd ".shellescape(expand('%:p:h'), 1)." && ")<CR>


autocmd QuickFixCmdPost *grep* cwindow

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

set diffopt+=vertical

colorscheme jellybeans
