" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif
"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/kit/scc/nq7776/.vim/bundles/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('/home/kit/scc/nq7776/.vim/bundles')

" Let dein manage dein
" Required:
call dein#add('/home/kit/scc/nq7776/.vim/bundles/repos/github.com/Shougo/dein.vim')

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
"call dein#add( 'VundleVim/Vundle.vim')
call dein#add('tomtom/tcomment_vim')
" call dein#add( 'Tabular')
" call dein#add( 'command-t')
call dein#add('bronson/vim-trailing-whitespace')
" call dein#add( 'ZoomWin')
" call dein#add( 'Syntastic')
call dein#add('ervandew/supertab')
call dein#add('tpope/vim-fugitive')
" call dein#add( 'dag/vim2hs')
call dein#add('morhetz/gruvbox')
" call dein#add( 'eagletmt/ghcmod-vim')
call dein#add('kassio/neoterm')
call dein#add('Ron89/thesaurus_query.vim')
call dein#add('takac/vim-hardtime')
call dein#add('tpope/vim-surround')
" call dein#add( 'vim-syntastic/syntastic')
call dein#add('KeitaNakamura/neodark.vim')
call dein#add('tyrannicaltoucan/vim-quantum')
call dein#add('chriskempson/base16-vim')
call dein#add('rhysd/vim-clang-format')
call dein#add('nanotech/jellybeans.vim')
call dein#add('twerth/ir_black')
call dein#add('LeonB/vim-previous-buffer')
call dein#add('kien/rainbow_parentheses.vim')
call dein#add('neomake/neomake')
" call dein#add( 'w0rp/ale.git')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('severin-lemaignan/vim-minimap')
call dein#add('arcticicestudio/nord-vim')

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

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
" set termguicolors
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
