set nocompatible              " be iMproved, required
filetype off                  " required

" set line numbers
set number
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" Show row and column
set ruler

" Auto indenting
set autoindent

" Set tabstop to 4
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Convert hardtabs to spaces always ;)
set expandtab

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
"""

" Key mapping for revealing line numbers Control N twice
nmap <C-N><C-N> :set invnumber<CR>

" Key mapping for nerdtree
nmap <C-n><C-t> :NERDTreeToggle<CR>

" powerline
" installed with pip
" pip install --user git+git://github.com/Lokaltog/powerline
set laststatus=2
set rtp+=~/.local/bin/powerline/bindings/vim

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins from github
" -------------------

" Let Vundle manage Vundle ;)
Plugin 'gmarik/Vundle.vim'

" Python IDE
Plugin 'davidhalter/jedi-vim'
Plugin 'Lokaltog/vim-powerline'
Plugin 'kien/ctrlp.vim'
Plugin 'mitsuhiko/vim-jinja'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'klen/python-mode'

" Enhancements
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree' 
Plugin 'zhaocai/GoldenView.Vim'
Plugin 'elzr/vim-json'

" Plugins from vimscripts org

call vundle#end()            " required

" open nerdtree
" autocmd vimenter * NERDTree

" auto open nerdtree even if no files are specified
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

let g:ctrlp_show_hidden = 1 
let NERDTreeShowHidden = 1
