" disable compability with vi which can cause unexpected issues.
set nocompatible " required

" enable type file dectection. Vim will be able to try to detect the type of
" file in use.
filetype on " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
call vundle#begin()

" let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim' " required

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'preservim/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'sainnhe/everforest'

" ...
" All of your Plugins must be added before the following line

call vundle#end()            " required

filetype plugin indent on    " required

" change the direction of new splits
set splitbelow
set splitright
set encoding=utf-8
set nu " line number
set clipboard=unnamed

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
let python_highlight_all=1
let g:syntastic_rst_checkers=['sphinx']

" turn syntax highlighting on
syntax on

" split navigations
" go to split window Ctrl + <h,j,k,l>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" basic configurations
set shiftwidth=4
set tabstop=4
set expandtab
" do not save backup files
set nobackup
" do not let cursor scroll below or above N number of lines scrolling
set scrolloff=10
set wrap " nowrap
" while searching though a file incrementally highlight matching characters as
" you type.
set incsearch
" ignore capital letters during search
set ignorecase
" override the ignorecase option if searching for capital letters
" this will allow you to search specifically for capital letters
set smartcase
" show the mode you are on the last line
set showmode
" show matching words during a search
set showmatch
" set the commands to save in history default is 20
set history=1000
" enable auto completion menu after pressing TAB
set wildmenu
" make wildmenu behave like similar to Bash completion
set wildmode=list:longest
" there are certain files that we would never want to edit with Vim
" wildmenu will ignore files with these extensions
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
" highlight cursor line underneath the cursor horizontally
"set cursorline
" highlight cursor line underneath the cursor vertically
"set cursorcolumn

" configure expanding of tabs for various file types
au BufRead,BufNewFile *.py set expandtab
au BufRead,BufNewFile *.c set expandtab
au BufRead,BufNewFile *.h set expandtab
au BufRead,BufNewFile Makefile* set noexpandtab

" --------------------------------------------------------------------------------
" configure editor with tabs and nice stuff...
" --------------------------------------------------------------------------------
set expandtab           " enter spaces when tab is pressed
set textwidth=120       " break lines when line length increases
set tabstop=4           " use 4 spaces to represent tab
set softtabstop=4
set shiftwidth=4        " number of spaces to use for auto indent
set autoindent          " copy indent from current line when starting a new line

" make backspaces more powerfull
set backspace=indent,eol,start

set ruler               " show line and column number
set showcmd             " show (partial) command in status line

set background=dark
let g:everforest_background = 'soft'
let g:everforest_better_performance = 1
colorscheme everforest
let g:lightline = {'colorscheme' : 'everforest'}

" change cursor depending on mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

:highlight BadWhitespace ctermfg=16 ctermbg=253 guifg=#000000 guibg=#F8F8F0
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" start NERDTree and put the cursor back in the other window
autocmd VimEnter * NERDTree | wincmd p
