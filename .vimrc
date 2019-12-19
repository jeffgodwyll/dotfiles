set nocompatible              " be iMproved, required
set encoding=utf-8            " Necessary to show Unicode glyphs

" set line numbers
set number
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" Show row and column
set ruler

" Auto indenting
set autoindent

" set shortmess=I

" Tab Settings, Wraps
"""""""""""""""""""""

" 4 spaces globally
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab               " Convert hardtabs to spaces always ;)
set wrap
set colorcolumn=80

" html, 2 spaces
autocmd filetype html,htmljinja setlocal ts=2 sts=2 sw=2 colorcolumn=
" js, 2 spaces
autocmd FileType javascript setlocal ts=2 sts=2 sw=2

" smarter backspacing
set backspace=indent,eol,start

set history=1000
set undolevels=1000


" Setup folder structure
""""""""""""""""""""""""

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

set ignorecase " ignore case
set smartcase  " smart search


" Theme settings
""""""""""""""""
" Falback for when colours are not available
color elflord

" preferred scheme for when there are colors
if &t_Co >= 256 || has("gui_running")
    color mustang
endif

" ColorColumn color
hi ColorColumn term=reverse ctermbg=236 guibg=#404040


" highlight current line in active window
augroup CursorLineOnlyInActiveWindow
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    hi CursorLine cterm=NONE " remove underline in term mode
    autocmd WinLeave * setlocal nocursorline
augroup END


" No fold on start
set nofoldenable

" if strftime("%H") < 12
"  set background=light
" else
"  set background=dark
" endif


" Key Mappings
""""""""""""""

" Don't use Ex mode, use Q for formatting
map Q gq

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

" paste toggle
nnoremap <F6> :set paste!<cr>

" Control N twice to reveal line numbers
nmap <C-N><C-N> :set invnumber<CR>

" toggle and untoggle spell checking
noremap <leader>ss :setlocal spell! spelllang=en_gb<cr>

" toggle nerdtree file/folder tree
nmap <C-n><C-t> :NERDTreeToggle<CR>

" toggle tagbar
nmap <F8> :TagbarToggle<CR>

" buffer sttings
"
" move to the next buffer
nmap <leader>l :bnext<CR>

" move to the previous buffer
nmap <leader>h :bprevious<CR>


" Mapping to run python code in vim
autocmd FileType python nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>

" Enable spell checking and force git commit message to be 72 chars per line
" http://robots.thoughtbot.com/5-useful-tips-for-a-better-commit-message
autocmd Filetype gitcommit setlocal spell spelllang=en_gb textwidth=72

" Enable spell checking for markdown files
autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_gb textwidth=80
autocmd BufRead,BufNewFile *.markdown setlocal spell spelllang=en_gb textwidth=80

" Force markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Enable spell checking for text files and limit width to 80
autocmd BufRead,BufNewFile *.txt setlocal spell spelllang=en_gb textwidth=80

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

if has('nvim')
    runtime! plugin/python_setup.vim
endif



" Vundle
""""""""

filetype off                  " required by Vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


" Plugins
"""""""""

" Let Vundle manage Vundle ;)
Plugin 'gmarik/Vundle.vim'

" Python IDE
Plugin 'davidhalter/jedi-vim'
" Plugin 'Lokaltog/vim-powerline'
Plugin 'kien/ctrlp.vim'
" Plugin 'glench/vim-jinja2-syntax'
Plugin 'mitsuhiko/vim-jinja'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'klen/python-mode'
Plugin 'nvie/vim-flake8'
Plugin 'vim-scripts/indentpython.vim'

" Snippets
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

Plugin 'vim-airline'

Plugin 'fugitive.vim'

" Syntax checking
" Plugin 'scrooloose/syntastic'
Plugin 'w0rp/ale'  " async checks

" html code completion
Plugin 'mattn/emmet-vim'

" Autocomplete...
Plugin 'Valloric/YouCompleteMe'

" Syntax checking for i3 config
Plugin 'PotatoesMaster/i3-vim-syntax'

" Vim syntax
Plugin 'fatih/vim-go'

" Elixir syntax
Plugin 'elixir-lang/vim-elixir'

" Kotlin syntax
Plugin 'udalov/kotlin-vim'

" Javascript-specific
Plugin 'ternjs/tern_for_vim'
Plugin 'pangloss/vim-javascript'

" React stuff
Plugin 'mxw/vim-jsx'

" Typescript for angular 2
Plugin 'leafgarland/typescript-vim'
Plugin 'burnettk/vim-angular'
Plugin 'Shougo/vimproc.vim'
Plugin 'quramy/tsuquyomi'

" Enhancements
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'zhaocai/GoldenView.Vim'
Plugin 'elzr/vim-json'
" Always highlight tag pairs
Plugin 'valloric/MatchTagAlways'
" Add surrounding pairs: brackets, parentheses, quotes, tags etc
Plugin 'tpope/vim-surround'
Plugin 'terryma/vim-multiple-cursors'

" Autocompletion for brackets, quotes...
Plugin 'Raimondi/delimitMate'

Plugin 'shime/vim-livedown'

" Distraction-free writing
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'

" Plugin 'amperser/proselint', {'rtp': 'plugins/vim/syntastic_proselint/'}

Plugin 'avakhov/vim-yaml'

Plugin 'editorconfig/editorconfig-vim'

" Smarter awesome vim...
" Plugin 'sourcegraph/sourcegraph-vim'
Plugin 'rizzatti/dash.vim'

Plugin 'mattn/gist-vim'
Plugin 'mattn/webapi-vim'

Plugin 'akz92/vim-ionic2'

" Dart stuff
Plugin 'dart-lang/dart-vim-plugin'
Plugin 'reisub0/hot-reload.vim'

call vundle#end()  " required

filetype plugin indent on  " turn on plugins, indentation...

" Set graphical font for gvim
if has("gui_running")
    set guifont=Source\ Code\ Pro\ for\ Powerline\ Medium\ 10
endif


" Plugin Settings
"""""""""""""""""

" ultinsips
"""""""""""
let g:UltiSnipsExpandTrigger = "<leader><tab>"

" nerdtree
""""""""""
" open nerdtree
" autocmd vimenter * NERDTree

" auto open nerdtree even if no files are specified
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

let NERDTreeShowHidden = 1

" emmet
"""""""
" enable emmet just for html/css
let g:user_emmet_install_global = 0
autocmd FileType html,htmljinja,css EmmetInstall

set laststatus=2

" powerline
"""""""""""
" installed with pip
" pip install --user git+git://github.com/Lokaltog/powerline
" set rtp+=~/.local/bin/powerline/bindings/vim
" let g:Powerline_symbols = 'unicode'
" let g:Powerline_stl_path_style = 'short'

" airline
"""""""""
let g:airline_theme = 'laederon'
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 1
" let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#virtualenv#enabled = 1
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'


" matchtagalways
""""""""""""""""
let g:mta_filetypes = {
    \ 'html': 1,
    \ 'xhtml': 1,
    \ 'xml': 1,
    \ 'jinja': 1,
    \ 'htmljinja': 1,
    \}

" livedown
""""""""""
let g:livedown_autorun = 0
let g:livedown_open = 1
let g:livedown_port = 1337
nmap <leader>md :LivedownPreview<CR>

" CrtlP
"""""""
let g:ctrlp_show_hidden = 1
let g:ctrlp_working_path_mode = 'r'  " r=nearest .git,.hg,.svn,.bzr,_darcs dirs
let g:ctrlp_open_new_file = 'v'  " in a new vertical split
nmap <leader>p :CtrlP<cr>
nmap <leader>bb :CtrlPBuffer<cr>

" Syntastic
"""""""""""
" let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_markdown_checkers = ['proselint']

" show any linting errors immediately
" let g:syntastic_check_on_open = 1

" ionic html
" this ignores all errors and checking in html
" find a way to detect ionic html and map to syntastic quiet messages
" let syntastic_mode_map = { 'passive_filetypes': ['html'] }
" let syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-", "<ion-", "</ion-",
            \  'plain text isn''t allowed in <head> elements',
            \  '<base> escaping malformed URI reference',
            \  'discarding unexpected <body>',
            \  '<script> escaping malformed URI reference',
            \  '</head> isn''t allowed in <body> elements'
            \ ]

" Pymode
""""""""
" [[ Jump to previous class or function (normal, visual, operator modes)
" ]] Jump to next class or function  (normal, visual, operator modes)
" [M Jump to previous class or method (normal, visual, operator modes)
" ]M Jump to next class or method (normal, visual, operator modes)
" aC Select a class. Ex: vaC, daC, yaC, caC (normal, operator modes)
" iC Select inner class. Ex: viC, diC, yiC, ciC (normal, operator modes)
" aM Select a function or method. Ex: vaM, daM, yaM, caM (normal, operator modes)
" iM Select inner function or method. Ex: viM, diM, yiM, ciM (normal, operator modes)
let g:pymode_run = 1
let g:pymode_rope = 0
let g:pymode_virtualenv = 1
let g:pymode_run_bind = '<leader>r' " run python code from within vim
let g:pymode_breakpoint = 1 " breakpoint settings
let g:pymode_breakpoint_bind = '<leader>b'
let g:pymode_breakpoint_cmd = ''
let g:pymode_folding = 0

" Surround.vim
""""""""""""""
" html comments
" yss/ or VS/
" let g:surround_{char2nr("/")="<!-- \r -->" self documenting
autocmd FileType html,htmljinja let b:surround_47 = "<!-- \r -->"

let g:surround_{char2nr("{")}="{% \r %}"  " for htmljinja

" vim-multiple-cursors
""""""""""""""""""""""
let g:multi_cursor_use_default_mapping = 0
let g:multi_cursor_start_key = '<leader>mc'
let g:multi_cursor_next_key = '<C-n>'
let g:multi_cursor_prev_key = '<C-p>'
let g:multi_cursor_skip_key = '<C-x>'
let g:multi_cursor_quit_key = '<Esc>'

" jedi-vim
""""""""""
let g:jedi#goto_command = '<leader>jd'  " goto definition or assignment
let g:jedi#goto_assignments_command = '<leader>jg'  " goto assignments
let g:jedi#rename_command = '<leader>jr' " rename variables

" Tern
let g:tern_map_keys=1
let g:tern_map_prefix = '<leader>'
let g:tern_show_argument_hints='on_hold'

" YCM
let g:ycm_filetype_specific_completion_to_disable = {
    \ 'python': 1
    \}

" typescript-vim
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = '--target es5'
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" jsx
let g:jsx_ext_required = 0

" ale
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0

let g:ale_linters = {
\   'javascript': ['eslint'],
\}
" only run linters in ale_linters settings
let g:ale_linters_explicit = 1
let g:airline#extensions#ale#enabled = 1

" tsuquyomi
let g:tsuquyomi_disable_quickfix = 1
" let g:syntastic_typescript_checkers = ['tsuquyomi'] " shouldn't use 'tsc' checker


" Dart and flutter settings
let dart_style_guide = 2
let dart_format_on_save = 1
let dart_html_in_string=v:true


silent! py3 pass
