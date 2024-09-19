" if has('mac') && ($TERM == 'xterm-256color' || $TERM == 'screen-256color')
"   map <Esc>OP <F1>
"   map <Esc>OQ <F2>
"   map <Esc>OR <F3>
"   map <Esc>OS <F4>
"   map <Esc>[16~ <F5>
"   map <Esc>[17~ <F6>
"   map <Esc>[18~ <F7>
"   map <Esc>[19~ <F8>
"   map <Esc>[20~ <F9>
"   map <Esc>[21~ <F10>
"   map <Esc>[23~ <F11>
"   map <Esc>[24~ <F12>
" endif

" map space to leader
let mapleader=" "

set nocompatible              " be iMproved, required filetype plugin indent on

autocmd FileType javascript setlocal shiftwidth=4 tabstop=4 softtabstop=0 expandtab

imap jk <ESC>
imap kj <ESC>
imap JK  <ESC>
imap KJ <ESC>

" in case of moving a wrapped line when writing .tex or .md files
" nmap j gj
" nmap k gk

" Python via F9
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

" Add timestamp
nmap <F3> i<C-R>=strftime("%d.%m.%y %H:%M:%S:")<CR><Esc>
imap <F3> <C-R>=strftime("%d.%m.%y %H:%M:%S:")<CR>

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" Comma for paste at end of line
nmap , $p

" keep x position when traversing y
set nostartofline

" keep last position
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Maintain undo history between sessions
set undofile
set undodir=~/.vim/undodir

" Set highlight
set hlsearch

" enable indentation
set breakindent

" set linechar
set ruler

" correct number increment
set nrformats-=octal

syntax on
set tags=tags

" :PlugInstall
call plug#begin()
Plug 'wuelnerdotexe/vim-astro'

call plug#end()

"highlights eol whitespaces
:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/


function! NumberToggle()
  if(&rnu == 1)
    set nornu
  elseif(&nu == 1)
    set nornu
    set nonu
  else
    set rnu
    set nu
  endif
endfunc

map <Leader>m :call NumberToggle()<CR>
