call plug#begin()
" see https://github.com/junegunn/vim-plug
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'
"
Plug 'arcticicestudio/nord-vim'
Plug 'numToStr/Comment.nvim'

call plug#end()


syntax on
" get rid of swp and backup files
set nobackup
set noswapfile

set path+=../**4
set number
set showcmd
set incsearch
set tabstop=4
set shiftwidth=4
set expandtab
set list
set hlsearch
set listchars=tab:>-

" set background=dark
let g:rehash256 = 1
set t_Co=256
colorscheme nord

lua require('Comment').setup()

let mapleader=" "

nnoremap <leader>sv :source $HOME/.config/nvim/init.vim<CR>

