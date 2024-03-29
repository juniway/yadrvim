" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" TODO: this may not be in the correct place. It is intended to allow overriding <Leader>.
" source ~/.vimrc.before if it exists.
if filereadable(expand("~/.vimrc.before"))
  source ~/.vimrc.before
endif

" ================ General Config ====================

set number
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show what command you are typing at the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set clipboard+=unnamed          "Global clipboard
set paste

set numberwidth=1       " Width will automatically increase to fit the width of maximun number of line, default 4
set whichwrap+=<,>,[,],h,l  " Make -> or <- can go beyond current line


" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

"turn on syntax highlighting
syntax on

" Default mapleader is \
let mapleader=","
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>z :wq<CR>
nnoremap <leader>WQ :wa<CR>:q<CR>
nnoremap <leader>Q :qa<CR>
nnoremap <Leader>b :ls<CR>:b<Space>

nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

"(v)im (c)ommand - execute current line as a vim command
" nmap <silent> ,vc yy:<C-f>p<C-c><CR>

"(v)im (r)eload
" nmap <silent> ,vr :so %<CR>


" =============== Vundle Initialization ===============
" This loads all the plugins specified in ~/.vim/vundles.vim
" Use Vundle plugin to manage all other plugins
if filereadable(expand("~/.vim/vundles.vim"))
  source ~/.vim/vundles.vim
endif
au BufNewFile,BufRead *.vundle set filetype=vim

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
" if has('persistent_undo') && isdirectory(expand('~').'/.vim/backups')
"   silent !mkdir ~/.vim/backups > /dev/null 2>&1
"   set undodir=~/.vim/backups
"   set undofile
" endif

let myUndoDir = expand('$HOME/.vim' . '/.undodir')
set undodir=myUndoDir
set undofile
set undolevels=1000
set undoreload=10000
" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

set cindent             " ----------------- C/C++ Code Style Setting --------------
                        " V select a block of code, then =, code will auto indent
                        " :set paste before do a paste where the buffer is
                        " another file, after paste, :set nopaste to get back
                        " autoindent

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~,*.so,*.swp,*.zip "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

set wildmenu  wildmode=full           " Enable a menu at the bottom of the window for command completion when type command in vim

set wildchar=<Tab> wildcharm=<C-Z>

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Search ===========================

set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital

" ================ Custom Settings ========================
so ~/.yadr/vim/settings.vim
