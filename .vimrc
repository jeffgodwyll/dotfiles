set nocompatible              " be iMproved, required
filetype off                  " required by Vundle

" set line numbers
set number
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" Show row and column
set ruler

" Auto indenting
set autoindent

" Tab Settings, Wraps
"""""""""""""""""""""

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab               " Convert hardtabs to spaces always ;)
set wrap
set colorcolumn=80

" smarter backspacing
set backspace=indent,eol,start

set history=1000
set undolevels=1000


" Setup folder structure
"

if !isdirectory(expand('~/.vim/undo/', 1))
    silent call mkdir(expand('~/.vim/undo', 1), 'p')
endif

if !isdirectory(expand('~/.vim/backup/', 1))
    silent call mkdir(expand('~/.vim/backup', 1), 'p')
endif

if !isdirectory(expand('~/.vim/swap/', 1))
    silent call mkdir(expand('~/.vim/swap', 1), 'p')
endif

" http://stackoverflow.com/a/15317146/2295256
" And thanks to jdavis/dotfiles
set backup
set writebackup
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" enable console mouse
set mouse=a

syntax on

" search highlight
set hlsearch

" Theme settings
color twilight

" No fold on start
set nofoldenable

" if strftime("%H") < 12
"  set background=light
" else
"  set background=dark
" endif

" Key Mappings
""""""""""""""

" leader keys
let mapleader = ","
let maplocalleader = "\\"


" Disable arrow keys in insert and normal mode 
""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

nnoremap ; :

" Control N twice to reveal line numbers
nmap <C-N><C-N> :set invnumber<CR>

" toggle nerdtree file/folder tree
nmap <C-n><C-t> :NERDTreeToggle<CR>

" powerline
" installed with pip
" pip install --user git+git://github.com/Lokaltog/powerline
set laststatus=2
set rtp+=~/.local/bin/powerline/bindings/vim


" Remove trailing whitespace
" http://vim.wikia.com/wiki/Remove_unwanted_spaces
function! StripTrailingWhitespace()
    if !&binary && &filetype != 'diff'
        normal mz
        normal Hmy
        %s/\s\+$//e
        normal 'yz<cr>
        normal `z
        retab
    endif
endfunction


" Vundle
""""""""

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


" Plugins from github
""""""""""""""""""""" 

" Let Vundle manage Vundle ;)
Plugin 'gmarik/Vundle.vim'

" Python IDE
Plugin 'davidhalter/jedi-vim'
Plugin 'Lokaltog/vim-powerline'
Plugin 'kien/ctrlp.vim'
Plugin 'mitsuhiko/vim-jinja'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'klen/python-mode'
Plugin 'nvie/vim-flake8'

" html code completion
Plugin 'mattn/emmet-vim'

" Enhancements
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree' 
Plugin 'zhaocai/GoldenView.Vim'
Plugin 'elzr/vim-json'

call vundle#end()            " required

" open nerdtree
" autocmd vimenter * NERDTree

" auto open nerdtree even if no files are specified
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

let g:ctrlp_show_hidden = 1 
let NERDTreeShowHidden = 1

" enable emmet just for html/css
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
