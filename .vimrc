""" INIT """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible
filetype plugin on

" Term type
""set term=builtin_ansi

""" BUNDLE MANAGEMENT """""""""""""""""""""""""

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" Languages
Bundle 'derekwyatt/vim-scala'
Bundle 'theevocater/thrift.vim'
Bundle 'duganchen/vim-soy'

" Colors
Bundle 'altercation/vim-colors-solarized'
Bundle 'flazz/vim-colorschemes'
Bundle 'junegunn/seoul256.vim'

" Utility
Bundle 'kien/ctrlp.vim' 
"let g:ctrlp_user_command = 'find src lib -type f' 
Bundle 'scrooloose/nerdcommenter'
Bundle 'vim-scripts/AutoComplPop'
let g:acp_behaviorKeywordLength=1
Bundle 'tpope/vim-fugitive'
Bundle 'vim-scripts/taglist.vim'

"Bundle 'chriskempson/base16-vim'
"Bundle 'terryma/vim-multiple-cursors'
"Bundle 'scrooloose/nerdtree'
Bundle 'wincent/Command-T'
"Bundle 'vim-scripts/Conque-Shell'

""" KEY BINDINGS """""""""""""""""""""""""""""""""""""""""""""""""""

set notimeout

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

noremap <d-h> <c-w><lt>
noremap <d-l> <c-w><gt>
noremap <d-j> <c-w>-
noremap <d-k> <c-w>+

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

nnoremap <c-s> :set scrollbind!<CR>
vnoremap <c-s> :set scrollbind!<CR>
inoremap <c-s> <esc>:set scrollbind!<CR>a

nnoremap <c-i> :set ignorecase!<CR>

""" mvim full screen
noremap <d-F> :set fullscreen!

""" File open
nnoremap r  <nop>

nnoremap rr :CtrlP .<CR>
nnoremap ru :CtrlPMRU<CR>
nnoremap rb :CtrlBuffer<CR>

"nnoremap rr :CommandT<enter>
"nnoremap Rr :CommandTBuffer<enter>
"nnoremap Rr :CommandTBuffer<enter>
"nnoremap RR :CommandTBuffer<enter>

"nnoremap rh :split<enter>:CommandT<enter>
"nnoremap Rh :split<enter>:CommandTBuffer<enter>
"nnoremap RH :split<enter>:CommandTBuffer<enter>

"nnoremap rv :vsplit<enter>:CommandT<enter>
"nnoremap Rv :vsplit<enter>:CommandTBuffer<enter>
"nnoremap RV :vsplit<enter>:CommandTBuffer<enter>

nnoremap tt :CtrlPTag<enter>
nnoremap tl :Tlist<CR>
nnoremap tu :TlistUpdate<enter>

""" NERDCommenter
nnoremap <C-C> <C-c>
nnoremap <C-c>d :NERDComcomment<cr>
nnoremap <C-c>c :NERDComsexycomment<cr>
nnoremap <C-c>n :nerdcomnestedcomment<cr>
nnoremap <C-c>  :nerdcomtogglecomment<cr>
nnoremap <C-c>$ :nerdcomeolcomment<cr>
nnoremap <C-c>a :nerdcomappendcomment<cr>
nnoremap <C-c>i :nerdcominsertcomment<cr>
nnoremap <C-c>u :nerdcomuncommentlin<cr>

""" Destroy all arrows
nnoremap <Right> <NOP>
nnoremap <Left> <NOP>
nnoremap <Up> <NOP>
nnoremap <Down> <NOP>
inoremap <Right> <NOP>
inoremap <Left> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <S-Right> <Right>
inoremap <S-Left> <Left>
inoremap <S-Up> <Up>
inoremap <S-Down> <Down>

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

function! ScrollbindTest()
  if &scrollbind
    return "[s]"
  else
    return ""
  endif
endfunction

function! CasesenseTest()
  if &ignorecase
    return "[i]"
  else
    return ""
  endif
endfunction


set statusline=\ (%n)%{ScrollbindTest()}%{CasesenseTest()}\ %(%m%r\ %)%f\ %Y%=<0x%B>\ %l,%c\ /\ %L\ (%p%%)\ 
" set ruler			" show the cursor position all the time
set showcmd			" display incomplete commands
set scrolloff=2 " keep two lines before or after the cursor
set showbreak=>\  " Show line wraps with "> ".  Note trailing space.
""set cursorline    "Highlight cursor line

set guioptions=iegmRL

" Highlight current line and column
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
autocmd WinEnter * setlocal cursorcolumn
autocmd WinLeave * setlocal nocursorcolumn

" Edge of screen
set colorcolumn+="120"



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
augroup END

" Open help files vertically
augroup helpfiles
  au!
""  au BufRead */doc/* wincmd
augroup END


""" Misc """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" bell off
set noerrorbells
set vb
set t_vb=

let tlist_scala_settings = 'scala;t:trait;c:class;f:function;o:object'

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

set splitbelow splitright

""" CtrlP """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ctrlp_regexp=1
let g:ctrp_user_command="find ."

function! CtrlPMatchWithGrep(items, str, limit, mmode, ispath, crfile, regex)
  let options = " -ie "
  if len(a:str)
    return systemlist('grep ' . l:options . a:str, deepcopy(a:items))
  else
    return deepcopy(a:items)
  endif
endfunction

let g:ctrlp_match_func = { 'match': 'CtrlPMatchWithGrep' }
