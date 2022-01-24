" --- general appearance settings --- "
"syntax enable
set title "shows current filename

" --- general behavior settings --- "
set mouse=a "Mouse enabled for scrolling & resizing
set spell "Enable spellchecking
" command line tab completion
set wildmenu
set wildmode=longest:full,full
set showmatch "shows matching bracket/brace
set confirm "Display confirmation dialog when closing unsaved file
set autochdir "current working directory is most recent accessed file
filetype off

" --- tmux support --- "
set ttymouse=xterm2
set mouse=a

"--- removing annoying features vim --- "
set belloff=all
set shortmess+=I "disable default vim startup message
set backspace=indent,eol,start "allows backspace over anything
set hidden "allows hiding buffers with unsaved changes
" 'Q' in normal mode enters Ex mode. This is unwanted
nmap Q <Nop>
" makes escape much faster than default settings
set timeoutlen=1000
set ttimeoutlen=0
" vim does not recognize terminal as a buffer
autocmd TerminalOpen * if bufwinnr('') > 0 | setlocal nobuflisted | endif

" -- smarter searching behavior --- "
set ignorecase "Ignore case when searching
set smartcase "Auto switch search to case sens when cap letters typed
set incsearch "Incremental search showing partial matches
set nohlsearch "Disable search highlighting
"set hlsearch "Enable search highlighting

" --- ruler settings --- "
set number "shows number of current line
set relativenumber "lines numbers are relative to current line
set colorcolumn=80
"line wrapping settings
set nowrap
set sidescroll=1
set linebreak
set textwidth=80
" centers the screen on the cursor
" set scrolloff=999

" --- Indentation Option --- "
set autoindent "New lines inherit indentation
set expandtab "convert tabs to spaces
set shiftround "round indentation to shiftwidth when shifting
set shiftwidth=4 "when shifting, indent using four spaces
set tabstop=4 "indent using four spaces
set smarttab "Insert 'tabstop' number of spaces when tab is pressed
filetype plugin indent on "enable file specific indentation rules

" --- smarter line numbers --- "
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
:  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif

" Source the vimrc file after saving it
if has("autocmd")
    autocmd bufwritepost .vimrc source $MYVIMRC
endif

" --- Custom keybindings --- "
"below three commands allow access to os clipboard
let mapleader=","
noremap <Leader>oy "*y
noremap <Leader>op "*p
noremap <Leader>od "*d
noremap <Leader>ho :noh<CR>
noremap <Leader>bn :bn<CR>
noremap <Leader>bd :bd<CR>
noremap <Leader>bp :bp<CR>
noremap <Leader>cw :close<CR>
noremap <Leader>w :w<CR>
noremap <Leader>q :q<CR>
noremap <Leader>e :q!<CR>
noremap <S-j> 3<C-E>
noremap <S-k> 3<C-Y>
noremap <S-u> 3zh
noremap <S-i> 3zl>
noremap <Leader>cc :set concealcursor=<CR>
noremap <Leader>pi :PlugInstall<CR>
noremap <Leader>pc :PlugClean<CR>
noremap <Leader>pu :PlugUpdate<CR>
noremap <Leader>fw :FixWhitespace

" Plugins will be downloaded under the specified directory
call plug#begin('~/.vim/plugged')

" Declare the list of plugins
Plug 'vim-airline/vim-airline'

Plug 'vim-airline/vim-airline-themes'

Plug 'scrooloose/nerdtree'

Plug 'tpope/vim-fugitive'

Plug 'airblade/vim-gitgutter'

Plug 'jiangmiao/auto-pairs'

Plug 'tpope/vim-surround'

Plug 'scrooloose/nerdcommenter'

Plug 'scrooloose/syntastic'

Plug 'lervag/vimtex'

Plug 'kien/ctrlp.vim'

Plug 'honza/vim-snippets'

Plug 'sirver/ultisnips'

Plug 'fatih/vim-go'

Plug 'nathanaelkane/vim-indent-guides'

Plug 'arcticicestudio/nord-vim'

Plug 'ianding1/leetcode.vim'

Plug 'valloric/youcompleteme'

Plug 'mg979/vim-visual-multi'

Plug 'yuttie/comfortable-motion.vim'

Plug 'bronson/vim-trailing-whitespace'

Plug 'benmills/vimux'

Plug 'easymotion/vim-easymotion'

Plug 'yggdroot/indentline'

Plug 'arithran/vim-delete-hidden-buffers'

" Call ends here plugins are not visible to vim after here
call plug#end()

" --- vimtex settings --- "
let g:vimtex_view_method='skim'
let g:vimtex_quickfix_mode=0
set conceallevel=2

" --- appearance settings --- "
colorscheme nord

" --- nerdtree settings --- "
"close the tab is NERDTree is the only window remaining in it
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"custom nerdtree keybindings
nnoremap <Leader>nt :NERDTreeToggle<CR>
nnoremap <Leader>nf :NERDTreeFind<CR>

" --- vimairline settings --- "
let g:airline#extensions#tabline#enabled = 1 "Shows buffers as 'tabs'
" let g:airline_theme='monochrome'

" --- ctrlp settings ---"
nnoremap <Leader>cp :CtrlP<CR>
nnoremap <Leader>cb :CtrlPBuffer<CR>

"--- indent guides settings ---"
let g:indent_guides_enable_on_vim_startup = 0
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=blue
"let indent_guides_guide_size=1

"--- leetcode vim settings ---"
nnoremap <Leader>ll :LeetCodeList<cr>
nnoremap <Leader>lt :LeetCodeTest<cr>
nnoremap <Leader>ls :LeetCodeSubmit<cr>
nnoremap <Leader>li :LeetCodeSignIn<cr>
let g:leetcode_browser='chrome'

"--- youcompleteme settings ---"
set completeopt-=preview
let g:ycm_auto_hover=''
let g:ycm_disable_signature_help=1

"--- indentline settings ---"
let g:indentLine_concealcursor=''
let g:indentLine_leadingSpaceEnabled=1
let g:indentLine_char = '┊'
let g:indentLine_leadingSpaceChar = '.'

"--- easymotion settings ---"
hi EasyMotionTarget ctermbg=none ctermfg=DarkCyan
hi EasyMotionShade  ctermbg=none ctermfg=white

hi EasyMotionTarget2First ctermbg=none ctermfg=blue
hi EasyMotionTarget2Second ctermbg=none ctermfg=green

