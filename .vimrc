""" INIT """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Term type
""set term=builtin_ansi

""" BUNDLE MANAGEMENT """""""""""""""""""""""""

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

Bundle 'scrooloose/nerdtree'
Bundle 'wincent/Command-T'
Bundle 'vim-scripts/rainbow_parentheses.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'theevocater/thrift.vim'
Bundle 'duganchen/vim-soy'
Bundle 'derekwyatt/vim-scala'
Bundle 'flazz/vim-colorschemes'
Bundle 'junegunn/seoul256.vim'

Bundle 'vim-scripts/AutoComplPop'
let g:acp_behaviorKeywordLength=1
Bundle 'vim-scripts/Conque-Shell'

""" KEY BINDINGS """""""""""""""""""""""""""""""""""""""""""""""""""

""let mapleader = \;

nnoremap <space> <c-d>
nnoremap <s-space> <c-u>
vnoremap <space> <c-d>
vnoremap <s-space> <c-u>

nnoremap + <c-a>
nnoremap - <c-x>

""" Change window

inoremap <c-h> <c-w><c-h>
inoremap <c-j> <c-w><c-j>
inoremap <c-k> <c-w><c-k>
inoremap <c-l> <c-w><c-l>
vnoremap <c-h> <c-w><c-h>
vnoremap <c-j> <c-w><c-j>
vnoremap <c-k> <c-w><c-k>
vnoremap <c-l> <c-w><c-l>
nnoremap <c-h> <c-w><c-h>
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-l>

" buffers
nnoremap <c-n> :bn<enter>
nnoremap <c-p> :bp<enter>
nnoremap <c-b> :buffers<enter>:buffer<space>

""" Autoclose
inoremap ( ()<esc>i
inoremap [ []<esc>i
inoremap { {}<esc>i
inoremap " ""<esc>i
inoremap ' ''<esc>i

""" Fix mouse scroll render issues
nnoremap <ScrollWheelUp> <ScrollWheelUp>:redraw!<enter>
nnoremap <ScrollWheelDown> <ScrollWheelDown>:redraw!<enter>
inoremap <ScrollWheelUp> <esc><ScrollWheelUp>:redraw!<enter>
inoremap <ScrollWheelDown> <esc><ScrollWheelDown>:redraw!<enter>


""" NERDTREE KEY
""nnoremap t :NERDTree<enter>

""" Command-T
nnoremap r  <nop>

nnoremap rr :CommandT<enter>
nnoremap Rr :CommandTBuffer<enter>
nnoremap RR :CommandTBuffer<enter>

nnoremap rh :split<enter>:CommandT<enter>
nnoremap Rh :split<enter>:CommandTBuffer<enter>
nnoremap RH :split<enter>:CommandTBuffer<enter>

nnoremap rv :vsplit<enter>:CommandT<enter>
nnoremap Rv :vsplit<enter>:CommandTBuffer<enter>
nnoremap RV :vsplit<enter>:CommandTBuffer<enter>

nnoremap tt :ConqueTerm bash<enter>
nnoremap th :split<enter>:ConqueTerm bash<enter>
nnoremap tv :vsplit<enter>:ConqueTerm bash<enter>

""" Completion """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set completeopt=longest,menuone


""" COPY PASTE AND DELETING """""""""""""""""""""""""""""""""""""""""""""""""""

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvs<C-R>=current_reg<CR><Esc>


" allow backspacing over everything in insert mode
set backspace=indent,eol,start



""" FOLDING """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldenable
set foldmethod=manual





""" Misc display """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number
set laststatus=2 " always show status bar
set statusline=\ (%n)\ %(%m%r\ %)%f\ %Y%=<0x%B>\ %l,%c\ /\ %L\ (%p%%)\ 
" set ruler			" show the cursor position all the time
set showcmd			" display incomplete commands
set scrolloff=2 " keep two lines before or after the cursor
set showbreak=>\  " Show line wraps with "> ".  Note trailing space.
set cursorline    "Highlight cursor line



""" TABBING """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Replace tabs with spaces
set expandtab

" Tabwidths
set ts=2
set shiftwidth=2

set autoindent
set smartindent " Indent on {, other random C-specific things

" add some scala/ML keywords to indent-forcing words.  Should really be language specific
set cinwords=if,else,while,do,for,switch,match,case,def



""" Searching """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set incsearch		" do incremental searching

" Highlight search matches
set hlsearch

" Ignore case
""set ignorecase
" Unless case is mixed
set smartcase



""" Syntax """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Switch syntax highlighting on, when the terminal has colors
syntax on

" Use my color scheme
" colorscheme mkehrt
"colorscheme solarized
"set background=""dark"
colorscheme codeschool

" For all text files set 'textwidth' to 78 characters.
autocmd FileType text setlocal textwidth=78

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif


" SML highlighting for signature files
augroup filetype
  au!
  au! BufRead,BufNewFile *.sig set filetype=sml


" Open help files vertically
augroup helpfiles
  au!
  au BufRead,BufEnter */doc/* wincmd L
augroup END


""" Misc """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" bell off
set noerrorbells
set vb
set t_vb=


" Don't use Ex mode, use Q for formatting
map Q gq

set history=5000	" keep 50 lines of command line history

" Allow mouse to set cursor
set mouse=a
" Hide mouse when typing
set mousehide

" Always report number of lines changed by : commands.
set report=0

" Don't ever restore terminal to previous state when quitting
set norestorescreen

" Wtite backups
set backup
