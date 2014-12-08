set nocompatible       " Use Vim defaults (much better!)
set mouse=a " enable mouse support
" encoding is utf-8 by default:
set encoding=utf-8
set termencoding=utf-8

"==== Indenting 
" http://www.vex.net/~x/python_and_vim.html
set autoindent " Automatically set the indent of a new line (local to buffer)
set smartindent " Smartindent  (local to buffer)
set tabstop=4 " A four-space tab indent width is the prefered coding style for Python
set shiftwidth=4 " This allows you to use the < and > keys from VIM's visual (marking) mode to block indent/unindent regions
set expandtab " Insert spaces instead of <TAB> character when the <TAB> key is pressed.
set softtabstop=4 " makes VIM see multiple space characters as tabstops
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``
 
"=== Scrollbars
set sidescrolloff=2
set numberwidth=4
 
"=== Cursor highlights
"set cursorline
"set cursorcolumn
 
"=== Searching
set hlsearch " highlight search
set incsearch " incremental search, search as you type
set ignorecase " Ignore case when searching
set smartcase " Ignore case when searching lowercase
 
"=== Colors
set background=dark
syntax on " syntax highlighting
colorscheme desert "darkspectrum

"=== Status Line
set showcmd
set ruler " Show ruler
"set ch=2 " Make command line two lines high
set statusline=%<%f%h%m%r%=format=%{&fileformat}\ file=%{&fileencoding}\ enc=%{&encoding}\ %b\ 0x%B\ %l,%c%V\ %P

"=== Folding goes in .vimrc.python
"set foldmethod=indent

"=== Key bindings

" map Ctrl-y to delete lines
inoremap <c-y> <esc>ddi

" Exit on F10
imap <F10> <Esc>:qa<CR>
nmap <F10> :qa<CR>

" Save current buffer (file) on F2
"imap <F2> <Esc>:w<CR>a  
imap <F2> <Esc>:w<CR> 
nmap <F2> :w<CR>

set wildmenu
set wildmode=longest,list   " Tab-completion like bash
set wildignore=*.o,*.obj,*.pyc
set suffixes+=.pyc      " Ignore .pyc when tab-completing filenames

let g:netrw_list_hide= '\.pyc'

" let NERDTreeIgnore=['\.pyc'] " ok, nerdtree is too nerdy for me right now

set guioptions-=T " that is fo gvim, its toolbar is useless

autocmd BufWritePre *.py :%s/\s\+$//e " remove whitespace on save

"Use TAB to complete when typing words, else inserts TABs as usual.
"Uses dictionary and source files to find matching words to complete.

"See help completion for source,
"Note: usual completion is on <C-n> but more trouble to press all the time.
"Never type the same word twice and maybe learn a new spellings!
"Use the Linux dictionary when spelling is in doubt.
"Window users can copy the file to their machine.
function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
     return "\<C-N>"
  else
     return "\<Tab>"
  endif
endfunction
:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>

source ~/.vimrc.python " load python defaults
source ~/.vimrc.keys " load Ukrainian keymap
