execute pathogen#infect()

set nocompatible " be iMproved, required  
filetype off " required

" Some settings to enable the theme:
set number
syntax enable
set background=dark
let g:solarized_termcolors = 256  " New line!!
color solarized

let mapleader = ","
let maplocalleader = "z"


map w :w!<CR>
map q :q!<CR>
map <Leader>n :NERDTreeFind<CR>
map <LocalLeader>[ 5<C-w>-<Esc>
map <LocalLeader>] 5<C-w>+<Esc>
map <LocalLeader>; :vertical resize +10<CR><CR>
map <LocalLeader>' :vertical resize -10<CR><CR>
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <Leader>o :tabNext<CR>
map <Leader>p :tabprevious<CR>

"Powerline
source /usr/local/lib/python2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim
set laststatus=2
set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8
if has("gui_running")
	let s:uname = system("uname")
	if s:uname == "Darwin\n"
		set guifont=Inconsolata\ for\ Powerline:h15
	endif
endif

"Javascript Syntax
let g:javascript_conceal_function   = "ƒ"
let g:javascript_conceal_null       = "ø"
let g:javascript_conceal_this       = "@"
let g:javascript_conceal_return     = "⇚"
let g:javascript_conceal_undefined  = "¿"
let g:javascript_conceal_NaN        = "ℕ"
let g:javascript_conceal_prototype  = "¶"
let g:javascript_conceal_static     = "•"
let g:javascript_conceal_super      = "Ω"
let g:javascript_enable_domhtmlcss = 1

"Multiple Cursor
"Default mapping
" let g:multi_cursor_next_key='<C-n>'
" let g:multi_cursor_prev_key='<C-p>'
" let g:multi_cursor_skip_key='<C-x>'
" let g:multi_cursor_quit_key='<Esc>'

"Easymotion
nmap s <Plug>(easymotion-s)
 "Bidirectional & within line 't' motion
omap t <Plug>(easymotion-bd-tl)
" Use uppercase target labels and type as a lower case
let g:EasyMotion_use_upper = 1
" type `l` and match `l`&`L`
let g:EasyMotion_smartcase = 1
" Smartsign (type `3` and match `3`&`#`)
let g:EasyMotion_use_smartsign_us = 1
nmap s <Plug>(easymotion-s2)
" Gif config
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-previous)
" Gif config
map <LocalLeader>l <Plug>(easymotion-lineforward)
map <LocalLeader>j <Plug>(easymotion-j)
map <LocalLeader>k <Plug>(easymotion-k)
map <LocalLeader>h <Plug>(easymotion-linebackward)
"
"
let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
"
"Undotree
if has("persistent_undo")
    set undodir='~/.undodir/'
    set undofile
endif

map U :UndotreeFocus<CR>
map <LocalLeader>u :UndotreeToggle<CR>
autocmd vimenter * UndotreeShow

filetype plugin indent on
let g:acp_behaviorSnipmateLength = 1
