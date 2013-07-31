set nocompatible
filetype off

"----------------------------------------------------------------
" bundle
"----------------------------------------------------------------
if has('vim_starting')
  set runtimepath+=~/vimfiles/bundle/vundle/
endif
call vundle#rc('~/vimfiles/bundle')
Bundle 'surround.vim'
Bundle 'ZenCoding.vim'
Bundle 'Handlebars'
Bundle 'css_color.vim'
Bundle 'gmarik/vundle'
Bundle 'othree/html5.vim'

"----------------------------------------------------------------
" neobundle
"----------------------------------------------------------------
if has('vim_starting')
  set runtimepath+=~/vimfiles/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/vimfiles/bundle'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundleFetch 'Shougo/vimproc'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'jiangmiao/simple-javascript-indenter'
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'teramako/jscomplete-vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'nono/vim-handlebars'

NeoBundleCheck

filetype plugin indent on

syntax on

set textwidth=200

"encoding
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,iso-2022-jp,sjis,cp932,euc-jp,cp20932

"cursol
set whichwrap=b,s,h,l,<,>,[,]

set expandtab
set tabstop=2
set softtabstop=0
set shiftwidth=2

set backupdir=$HOME/vimbackup
set directory=$HOME/vimbackup


set clipboard=unnamed
set wildmode=longest:full,full
"set wildmode=longest,full

set hidden
"set incsearch

"----------------------------------------------------------------
" file-browsing 
"----------------------------------------------------------------
let g:netrw_localcopycmd=''
let g:netrw_preview=1
let g:netrw_liststyle=3
let g:netrw_winsize=80
let g:netrw_altv=1
let g:netrw_alto=1


"----------------------------------------------------------------
" key-bind
"----------------------------------------------------------------
nnoremap <C-N> :bn<CR>
nnoremap <C-P> :bp<CR>
nnoremap <C-C> :bp\|bd #<CR>
nnoremap <Space>b :ls<CR>:buffer 
nnoremap <Space>f :edit .<CR>
nnoremap <Space>v :vsplit<CR><C-w><C-w>:ls<CR>:buffer
nnoremap <Space>V :Vexplore!<CR><CR>
nnoremap <C-H> <C-w>h
nnoremap <C-L> <C-w>l

"----------------------------------------------------------------
" handlebars
"----------------------------------------------------------------
au BufRead,BufNewFile *.handlebars,*.hbs set ft=handlebars

"----------------------------------------------------------------
" zencoding
"----------------------------------------------------------------
let g:user_zen_settings = {
\  'lang' : 'ja',
\  'charset' : 'utf-8',
\  'html' : {
\    'filters' : 'html',
\    'snippets' : {
\      'jq' : "<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js\"></script>\n<script>\n\\$(function() {\n\t|\n})()\n</script>",
\      'cd' : "<![CDATA[|]]>",
\    },
\  },
\  'php' : {
\    'extends' : 'html',
\    'filters' : 'html,c',
\  },
\  'javascript' : {
\    'snippets' : {
\      'jq' : "\\$(function() {\n\t\\${cursor}\\${child}\n});",
\      'jq:json' : "\\$.getJSON(\"${cursor}\", function(data) {\n\t\\${child}\n});",
\      'jq:each' : "\\$.each(data, function(index, item) {\n\t\\${child}\n});",
\      'fn' : "(function() {\n\t\\${cursor}\n})();",
\      'tm' : "setTimeout(function() {\n\t\\${cursor}\n}, 100);",
\    },
\    'use_pipe_for_cursor' : 0,
\  },
\  'css' : {
\    'filters' : 'fc',
\    'snippets' : {
\      'box-shadow' : "-webkit-box-shadow: 0 0 0 # 000;\n-moz-box-shadow: 0 0 0 0 # 000;\nbox-shadow: 0 0 0 # 000;",
\    },
\  },
\  'less' : {
\    'filters' : 'fc',
\    'extends' : 'css',
\  },
\}

"----------------------------------------------------------
" unite
"----------------------------------------------------------
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>Unite -buffer-name=file file<CR>
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>

" open windows with horizontal split
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" open windows with vertical split
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" quit by ESC*2
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

"----------------------------------------------------------
" neocomplcache
"----------------------------------------------------------

let g:neocomplcache_enable_at_startup = 1

" Enable omni completion. Not required if they are already set elsewhere in .vimrc
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

"----------------------------------------------------------
" neosnippet
"----------------------------------------------------------
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
