set nocompatible              " be iMproved, required
filetype off                  " required

" set line numbers
set number
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

:color twilight

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
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required

" Plugins from github
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
 
" Plugins from vimscripts org

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" open nerdtree
" autocmd vimenter * NERDTree

" auto open nerdtree even if no files are specified
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

let g:ctrlp_show_hidden = 1 
let NERDTreeShowHidden = 1
