call plug#begin()
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

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
Plug 'folke/which-key.nvim'

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

" telescope
" Using Lua functions
nnoremap <leader><leader> <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>e <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
