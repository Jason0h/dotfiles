"--- general settings ---"
set title "shows current filename
set mouse=a "enable mouse support
set spell "enable spellcheck
set showmatch "show matching brackets/braces
set wildmenu "enable commandline tab completion
set wildmode=longest:full,full "configure tab completion mode
set autochdir "current working directory is most recent accessed file
set confirm "Display confirmation when closing unsaved file
set ttymouse=xterm2 "enable tmux support

"--- handling annoyances ---"
set belloff=all "prevent visual/audio error bell
set shortmess+=I "disable default vim startup message
set backspace=indent,eol,start "sane backspace behavior
set hidden "allows hiding buffers with unsaved changes
nmap Q <Nop> "removes an unwanted behavior
set timeoutlen=1000 "timeout length of mapped key sequences
set ttimeoutlen=0 "makes escaping fast
"source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

"--- smarter searching behavior ---"
set ignorecase "Ignore case when searching
set smartcase "Auto switch search to case sensitie when cap letters typed
set incsearch "Incremental search showing partial matches
set nohlsearch "Disable search highlighting

"--- ruler settings ---"
set number "shows number of current lines
set relativenumber "line numbers are relative to current line
set colorcolumn=80 "set a ruler at length 80
set wrap "soft wrap text longer than window horizontal length
set linebreak "prevents wrapping from within a word
"turns off relative numbering in insert mode
: autocmd!
: autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu | endif
: autocmd BufLeave,FocusLost,InsertEnter,WinLeave * if &nu | set nornu | endif

"--- indentation settings ---"
set autoindent "new lines inherit indentation
set expandtab "convert tabs to spaces
set shiftround "round indentation to shiftwidth when shifting
set shiftwidth=4 "when shifting, indent using four spaces
set tabstop=4 "indent using four spaces
set smarttab "Insert 'tabstop' number of spaces when tab is pressed
filetype plugin indent on "enable file specific indentation rules

"--- keybinding settings ---"
let mapleader=","
noremap <Leader>ho :noh<CR>
noremap <Leader>oy "*y
noremap <Leader>op "*p
noremap <Leader>od "*d
noremap <Leader>bn :bn<CR>
noremap <Leader>bd :bd<CR>
noremap <Leader>bp :bp<CR>
noremap <Leader>bc :DeleteHiddenBuffers<CR>
noremap <Leader>cw :close<CR>
noremap <Leader>w :w<CR>
noremap <Leader>q :q<CR>
noremap <S-Down> <C-E>
noremap <S-Up> <C-Y>
noremap <Leader>pi :PlugInstall<CR>
noremap <Leader>pc :PlugClean<CR>
noremap <Leader>pu :PlugUpdate<CR>
noremap <Leader>fw :FixWhitespace
noremap <Leader>vc :VimuxPromptCommand<CR>
noremap <Leader>vl :VimuxRunLastCommand<CR>
nnoremap <Leader>nt :NERDTreeToggle<CR>
nnoremap <Leader>nf :NERDTreeFind<CR>
nnoremap <Leader>cp :CtrlP<CR>
nnoremap <Leader>cb :CtrlPBuffer<CR>
noremap <Leader>e :enew<CR>
noremap <Leader>ns :set nospell<CR>

" Plugins will be downloaded under the specified directory
call plug#begin('~/.vim/plugged')

"--- Declare the list of plugins ---"
Plug 'valloric/youcompleteme'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'lervag/vimtex'
Plug 'kien/ctrlp.vim'
Plug 'honza/vim-snippets'
Plug 'sirver/ultisnips'
Plug 'fatih/vim-go'
Plug 'arcticicestudio/nord-vim'
Plug 'mg979/vim-visual-multi'
Plug 'bronson/vim-trailing-whitespace'
Plug 'benmills/vimux'
Plug 'easymotion/vim-easymotion'
Plug 'arithran/vim-delete-hidden-buffers'
Plug 'rbgrouleff/bclose.vim'

" Call ends here plugins are not visible to vim after here
call plug#end()

colorscheme nord "set colorscheme to nord
syntax on "set syntax highlighting

"--- nerdtree settings ---"
"close the tab is NERDTree is the only window remaining in it
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"--- autopairs settings ---"
let g:AutoPairs= {'(':')', '[':']', '{':'}'} "autoinserting quotations are annoying in my opinion

" --- vimairline settings --- "
let g:airline#extensions#tabline#enabled = 1 "Shows buffers as 'tabs'

"--- vimtex settings ---"
let g:vimtex_view_method='skim'

"--- youcompleteme settings ---"
set completeopt-=preview "prevent the preview window
let g:ycm_auto_hover='' "prevent documentation from popping up automatically
nnoremap <leader>D <plug>(YCMHover) "provide a shortcut for showing documentation
let g:ycm_disable_signature_help=0 "if set to 1, then signature help is not shown
let g:ycm_filetype_blacklist = { 'tex': 1 }

"--- easymotion settings ---"
"provide an easymotion coloring that fits into nord
hi EasyMotionTarget ctermbg=none ctermfg=DarkCyan
hi EasyMotionShade  ctermbg=none ctermfg=white
hi EasyMotionTarget2First ctermbg=none ctermfg=blue
hi EasyMotionTarget2Second ctermbg=none ctermfg=green
