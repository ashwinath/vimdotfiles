let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
        echo "Installing Vundle.."
        echo ""
        silent !mkdir -p ~/.vim/bundle
        silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
        let iCanHazVundle=0
endif
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"Plugin 'davidhalter/jedi-vim'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Bundle 'https://github.com/freeo/vim-kalisi'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-surround'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdcommenter'
call vundle#end()
" .vimrc folding
augroup filetype_vim
  autocmd FileType vim setlocal foldmethod=marker
set nofoldenable    " disable foldingaugroup END
" Fold with space
nnoremap <space> za
"enable syntax highlighting
syntax enable

" Split down and right
set splitbelow
set splitright

" lets remap the esc key to something abit easier to press
inoremap jk <ESC>

" scrolling thru python output
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

map <C-H> <C-W>h<C-W>_
map <C-L> <C-W>l<C-W>_
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_

" show line numbers
set number
set relativenumber

" set line highlighting
set cursorline
" set tabs to have 4 spaces
set ts=4

" indent when moving to the next line while writing code
set autoindent
set smarttab
filetype on
filetype plugin on
filetype indent on

" expandndent on tabs into spaces
set expandtab
set smarttab

" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4
set tabstop=4

" show a visual line under the cursor's current line 
"set cursorline

" show the matching part of the pair for [] {} and ()
set showmatch

" enable all Python syntax highlighting features
let python_highlight_all = 1
"let g:pymode_python = 'python3'

" History/Undo settings {{{
"
" " We have computers with pretty big
" " hard drives, so let's keep these
set history=1000
set undofile
set undodir=~/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo
set backupdir=~/.vim/backup/
set directory=~/.vim/backup/
" " }}}

" Mapping keys
let mapleader=","

"airline
set laststatus=2
let g:airline_powerline_fonts = 1
set t_Co=256

"auto start nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" vim theme
colorscheme kalisi
let g:airline_theme='kalisi'
set background=dark
"wrap
set wrap
" let me use the damn mouse to resize windows
set mouse=a
set ttymouse=xterm
"auto complete brackets
"
