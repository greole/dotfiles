" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!


" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
"NeoBundle 'VundleVim/Vundle.vim'
NeoBundle 'tComment'
NeoBundle 'Tabular'
" NeoBundle 'command-t'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'ZoomWin'
" NeoBundle 'Syntastic'
NeoBundle 'ervandew/supertab'
NeoBundle 'tpope/vim-fugitive'
" NeoBundle 'dag/vim2hs'
NeoBundle 'morhetz/gruvbox'
" NeoBundle 'eagletmt/ghcmod-vim'
NeoBundle 'kassio/neoterm'
NeoBundle 'Ron89/thesaurus_query.vim'
NeoBundle 'takac/vim-hardtime'
NeoBundle 'tpope/vim-surround'
" NeoBundle 'vim-syntastic/syntastic'
NeoBundle 'morhetz/gruvbox'
NeoBundle 'KeitaNakamura/neodark.vim'
NeoBundle 'tyrannicaltoucan/vim-quantum'
NeoBundle 'chriskempson/base16-vim'
NeoBundle 'rhysd/vim-clang-format'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'twerth/ir_black'
NeoBundle 'LeonB/vim-previous-buffer'
NeoBundle 'kien/rainbow_parentheses.vim'
NeoBundle 'neomake/neomake'
" NeoBundle 'w0rp/ale.git'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'severin-lemaignan/vim-minimap'
NeoBundle 'arcticicestudio/nord-vim'


NeoBundleCheck
call neobundle#end()

syntax on
set nobackup
set noswapfile
set path+=../**4

" set background=dark
let g:rehash256 = 1
set t_Co=256
colorscheme nord
" colorscheme neodark
" let g:neodark#use_256color = 1
" let g:neodark#background = '#202020'
set background=dark
set termguicolors
" colorscheme base16-outrun-dark
let g:quantum_black=1

let g:hardtime_default_on = 0

cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev X x
cnoreabbrev E e

" Neomake

let g:neomake_make_maker = {
    \ 'exe': 'make',
    \ 'args': [],
    \ 'errorformat': '%f:%l:%c: %m',
    \ }
" Use the maker like this:


" silence make
" set makeprg=make\ >/dev/null\ 2>&1;echo\ $?;

" relative line numbers
set number relativenumber " TODO slow on larger files
set lazyredraw
" he tex-slow

highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

" Necesary  for lots of cool vim things
set nocompatible
" This shows what you are typing as a command.
set number
set showcmd
set incsearch
set tabstop=4
set shiftwidth=4
set expandtab
set list
set hlsearch
set listchars=tab:>-
filetype plugin indent on
" set nofoldenable
set foldmethod=expr
set foldexpr=MyFoldLevel(getline(v:lnum))
" fold colors
hi Folded ctermfg=240 ctermbg=235 guifg=blue guibg=grey
hi FoldedNC ctermfg=240 ctermbg=236 guifg=blue guibg=grey
hi NormalNC ctermbg=236


"   function MyFoldLevel(thisline)
"     if or(match(a:thisline, '\\begin') >= 0, match(a:thisline, '\\[sub]*section') >= 0)
"       return 'a1'
"     elseif or(match(a:thisline, '\\end') >= 0, match(a:thisline, 'END[SUB]*SECTION') >= 0)
"       return 's1'
"     else
"       return '='
"     endif
"   endfunction


" set foldexpr=getline(v:lnum)=~'^\\s*$'&&getline(v:lnum+1)=~'\\S'?'<1':1
" set listchars=eol:$,tab:>-,trail:~,

highlight Folded guibg=grey guifg=blue
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %
" set clipboard=unnamed
cmap w!! %!sudo tee > /dev/null %
"" smash escape
inoremap jk <Esc>
inoremap kj <Esc>
"" insert single character
"" remap autocomplete
inoremap <Nul> <C-n>
nnoremap D d$

let mapleader=" "


nnoremap <LEADER>c setlocal spell spelllang=en_gb
nnoremap <LEADER>g setlocal spell spelllang=de_de
nnoremap <F12> :call ToggleSpell()<CR>
function! ToggleSpell()
  if &mouse == 'a'
    echo "Mouse usage disabled"
  else
    setlocal spell spelllang=en_gb
    echo "Mouse usage enabled"
  endif
endfunction

" map ,f :CommandT<CR>

"" remove trailing white spaces
:nnoremap <Leader>w :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
"" set rtp+=/home/go/documents/code/powerline/powerline/bindings/vim
"" set laststatus=2 " Always display the statusline in all windows
"" set showtabline=2 " Always display the tabline, even if there is only one tab
"" set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline):w

set path+=**

" terminal emulator
 """""""""""""""
tnoremap <Esc> <C-\><C-n>

" Move between windows
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l

let g:neoterm_size = '2'
let g:neoterm_default_mod = 'topleft'
" let g:neoterm_position = 'vertical'
" let g:neoterm_automap_keys = ',tt'

" Useful maps
" hide/close terminal
nnoremap <silent> <LEADER>th :call neoterm#close()<cr>
" " clear terminal
" nnoremap <silent> <LEADER>tl :call neoterm#clear()<cr>
" " kills the current job (send a <c-c>)
nnoremap <silent> <LEADER>tc :call neoterm#kill()<cr>
nnoremap <Leader>m :T make
nnoremap <Leader>t :T ctest ..
nnoremap <Leader>c :T cmake ..

" xclip
:map xyy :w !xclip<CR><CR>
:vmap xyy "*y
:map xpp :r!xclip -o<CR>
:map xps :r!xclip -o<CR> -s clipboard


" clang format
:vmap <Leader>f :ClangFormat<CR>

" spell check
nnoremap <Leader>n ]s
nnoremap <Leader>b [s
nnoremap <Leader>v z=
nnoremap <Leader>a ]s z=

" Snippets
nnoremap <Leader>eq :-q read ~/.nvim/snippets/latex_equation<CR>
nnoremap <Leader>lst :-q read ~/.nvim/snippets/latex_listing<CR>
nnoremap <Leader>tikz :-q read ~/.nvim/snippets/latex_tikz<CR>
nnoremap <Leader>ite :-q read ~/.nvim/snippets/latex_itemize<CR>

" buffer jumps
nmap <Leader>bn :PreviousBuffer<CR>


" rainbow parenths

au VimEnter * RainbowParenthesesToggle
" au Syntax * RainbowParenthesesLoadRound
" au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

" Notes
" dfc - delete until first c character
" gf  - open file
" <Tab> - inverse of CTRL-O
" * :he  tex-slow
" :he tex-folding
" :he tex_fast
" ,cs thesaurus
"
