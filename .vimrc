"install vundle if no vundle
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
if !filereadable(vundle_readme)
        echo "Installing Vundle.."
        echo ""
        silent !mkdir -p ~/.vim/bundle
        silent !git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
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
Plugin 'terryma/vim-multiple-cursors'
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'itchyny/lightline.vim'
Plugin 'tomtom/tlib_vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-surround'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdcommenter'
Plugin 'w0rp/ale'
Plugin 'Valloric/YouCompleteMe'
Plugin 'morhetz/gruvbox'
Plugin 'tpope/vim-fugitive'
Plugin 'nikvdp/ejs-syntax'
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'shime/vim-livedown'
Plugin 'Quramy/tsuquyomi'
Plugin 'leafgarland/typescript-vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'posva/vim-vue'
Plugin 'junegunn/fzf.vim'
Plugin 'mileszs/ack.vim'

call vundle#end()
" Mapping keys
let mapleader=","

" .vimrc folding
augroup filetype_vim
  autocmd FileType vim setlocal foldmethod=marker
set nofoldenable    " disable foldingaugroup END

" Fold with space
nnoremap <space> za
"enable syntax highlighting
syntax enable

" set some gvim variables
set guifont=InconsolataGo\ Nerd\ Font\ Complete:h17
set linespace=6

" Split down and right
set splitbelow
set splitright
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L

" lets remap the esc key to something abit easier to press
inoremap jk <ESC>

" remap multiple window keys
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

map <C-H> <C-W>h<C-W>_
map <C-L> <C-W>l<C-W>_
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
nmap <C-v> :vertical resize +5<cr>
nmap <leader>p :NERDTreeToggle<cr>

" highlight search
set hlsearch
"incremental search
set incsearch

" show line numbers
set number
set relativenumber

" set line highlighting
set cursorline
" set tabs to have 2 spaces
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

" when using the >> or << commands, shift lines by 2 spaces
set shiftwidth=4
set tabstop=4

" show the matching part of the pair for [] {} and ()
set showmatch

" enable all Python syntax highlighting features
let python_highlight_all = 1

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


"airline
set laststatus=2
set t_Co=256
set encoding=utf-8
" opens nerd tree if no arguments appended to vim
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeSHowHidden=1
"

"wrap
set wrap

" let me use the damn mouse to resize windows
set mouse=a

" workaround for backspace not working
set bs=2

" delimitmate settings
let delimitMate_expand_cr = 1

"colour scheme
colorscheme gruvbox
set background=dark

"Snippets
let g:UltiSnipsExpandTrigger="<C-Space>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" TypeScript YouCompleteMe
if !exists("g:ycm_semantic_triggers")
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']

" TypeScript linting
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi'] " You shouldn't use 'tsc' checker.

" airline tabline
"let g:airline#extensions#tabline#enabled = 1

autocmd GUIEnter * set vb t_vb=

let g:jsx_ext_required = 0 " Allow JSX in js files
let g:syntastic_javascript_checkers = ['jsxhint', 'eslint']
let g:syntastic_javascript_jsxhint_exec = 'jsx-jshint-wrapper'

" fzf vim settings
nmap ; :Buffers<CR>
nmap <C-p> :Files<CR>
nmap <C-t> :Tags<CR>

" for macos
if has('macunix')
    set rtp+=/usr/local/opt/fzf
endif
let g:fzf_tags_command = 'ctags -R'

function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()

" Silver searcher
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
