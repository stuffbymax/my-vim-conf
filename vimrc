" Basic settings
set nocompatible              " Disable compatibility with old vi
set backspace=indent,eol,start " Make backspace more powerful
set encoding=utf-8            " Set encoding to UTF-8

" UI configurations
set number                    " Show line numbers
set relativenumber            " Show relative line numbers
set showcmd                   " Show command in bottom bar
set cursorline                " Highlight current line
set wildmenu                  " Enable command line completion
set lazyredraw                " Don't redraw while executing macros
set showmatch                 " Show matching brackets
set incsearch                 " Incremental search
set hlsearch                  " Highlight search results

" Tabs and indentation
set tabstop=4                 " Number of spaces tabs count for
set shiftwidth=4              " Number of spaces to use for autoindent
set expandtab                 " Use spaces instead of tabs
set autoindent                " Auto-indent new lines
set smartindent               " Smart auto-indent
set smarttab                  " Smart tabbing

" File handling
set autoread                  " Auto reload files changed outside of vim
set backup                    " Enable backup files
set undofile                  " Enable persistent undo
set swapfile                  " Enable swap file

" Appearance
syntax on                     " Enable syntax highlighting
set background=dark           " Use dark background
colorscheme desert            " Set colorscheme

" Clipboard
set clipboard=unnamedplus     " Use system clipboard

" Plugins and package manager setup (example with vim-plug)
call plug#begin('~/.vim/plugged')

" Add plugins here
Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdcommenter'

call plug#end()

" NERDTree settings
map <C-n> :NERDTreeToggle<CR>
autocmd vimenter * NERDTree

" FZF settings
let g:fzf_command_prefix = 'Fzf'
nnoremap <C-p> :Files<CR>

" Airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Custom key mappings
nnoremap <C-s> :w<CR>                 " Ctrl+s to save file
inoremap <C-s> <Esc>:w<CR>            " Ctrl+s to save file in insert mode
nnoremap <C-q> :q<CR>                 " Ctrl+q to quit
inoremap <C-q> <Esc>:q<CR>            " Ctrl+q to quit in insert mode

" Auto pairs settings
let g:AutoPairsMapBS = 1              " Enable backspace to delete pairs

" Git Gutter settings
let g:gitgutter_map_keys = 0

" NERDCommenter settings
let g:NERDSpaceDelims = 1

" Custom functions (if any)
" Example: function to reload vimrc
function! ReloadVimrc()
    source $MYVIMRC
    echo "vimrc reloaded!"
endfunction
command! ReloadVimrc call ReloadVimrc()

" Other customizations
set laststatus=2                    " Always display the status line
set updatetime=300                  " Faster completion
set timeoutlen=500                  " Faster key mapping response
set formatoptions-=cro               " Don't automatically insert comments on new lines

" Optional: Load specific settings for specific filetypes
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4
autocmd FileType javascript setlocal expandtab shiftwidth=2 tabstop=2

" Optional: Highlighting trailing spaces (useful for keeping code clean)
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/

" Optional: Automatically remove trailing spaces on save
autocmd BufWritePre * :%s/\s\+$//e
