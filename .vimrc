""" INIT """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Term type
set term=builtin_ansi



""" KEY BINDINGS """""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <space> <c-d>
nnoremap <s-space> <c-u>

nnoremap + <c-a>
nnoremap - <c-x>



""" COPY PASTE AND DELETING """""""""""""""""""""""""""""""""""""""""""""""""""

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvs<C-R>=current_reg<CR><Esc>


" allow backspacing over everything in insert mode
set backspace=indent,eol,start


" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp





""" FOLDING """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldenable
set foldmethod=manual





""" LINE NUMBERS """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number
nnoremap z :set rnu!<CR>:set nu!<CR>





""" MISC DISPLAY '"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2 " always sho status bar
set statusline=\ (%n)\ %(%m%r\ %)%f\ %Y%=<0x%B>\ %l,%c\ /\ %L\ (%p%%)\ 
" set ruler			" show the cursor position all the time
set showcmd			" display incomplete commands
set scrolloff=2 " keep two lines before or after the cursor
set showbreak=>\  " Show line wraps with "> ".  Note trailing space.
set cursorline    "Highlight cursor line



""" TABBING """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" I think this replaces tabs with spaces
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
set ignorecase
" Unless case is mixed
set smartcase



""" Syntax """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Switch syntax highlighting on, when the terminal has colors
syntax on

" Use my color scheme
" colorscheme mkehrt

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  "filetype plugin indent on
  "set ai

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

endif " has("autocmd")

" SML highlighting for signature files
augroup filetype
  au!
  au! BufRead,BufNewFile *.sig set filetype=sml


" tutch syntax file
au BufNewFile,BufRead *.lid			setf dylanlid





""" Misc """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" bell off
set noerrorbells
set vb
set t_vb=


" Don't use Ex mode, use Q for formatting
map Q gq

"set backup		" keep a backup file
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
set backu	:set showbreak=>\ p
