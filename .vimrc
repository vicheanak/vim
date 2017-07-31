execute pathogen#infect()
syntax on
let python_highlight_all=1
filetype plugin indent on
set shell=bash\ -i

set nocompatible " be iMproved, required
filetype off " required

" Some settings to enable the theme:
set number
syntax enable


" Fold
set foldmethod=indent
set foldlevel=99

nnoremap <space> za

" set background=dark
set background=light
set nobackup
let g:solarized_termcolors = 256  " New line!!

colorscheme monokai
" color solarized
" colorscheme gruvbox
" colorscheme PaperColor
" color xcode
hi Normal ctermfg=252 ctermbg=none

let g:html_indent_inctags = "hello-hello"

" function s:CompleteTags()
"   inoremap <buffer> > ></<C-x><C-o><Esc>:startinsert!<CR><C-O>?</<CR>
"   inoremap <buffer> ><Leader> >
"   inoremap <buffer> ><CR> ></<C-x><C-o><Esc>:startinsert!<CR><C-O>?</<CR><CR><Tab><CR><Up><C-O>$
" endfunction
" autocmd BufRead,BufNewFile *.html,*.js,*.xml call s:CompleteTags()


let mapleader      = ","
let maplocalleader = "z"

" Open NERDTree in the directory of the current file (or /home if no file is
" open)
nmap <silent> <LocalLeader>n :call NERDTreeToggleInCurDir()<cr>
function! NERDTreeToggleInCurDir()
    if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
        exe ":NERDTreeClose"
    else
        exe ":NERDTreeFind"
    endif
endfunction

"nnoremap <S-Tab> <<
"nnoremap <Tab> >>
" inoremap <S-Tab> <C-d>
map <Tab> >
map <S-Tab> <

map <C-a> ggVG
map m %
map w :w!<CR>
map q :q!<CR>
map W :Gwrite<CR>
map C :Gcommit -m "commit"<CR>
map P :Gpush origin master<CR>
" map <LocalLeader>[ 5<C-w>-<Esc>
" map <LocalLeader>] 5<C-w>+<Esc>
map <LocalLeader>; :vertical resize +1<CR><CR>
map <LocalLeader>' :vertical resize -1<CR><CR>
map <LocalLeader>w :Hupload<CR>
map <LocalLeader>d :Hdownload<CR>
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map T :tabnext<CR>
map t :tabprevious<CR>
map Y "+y<CR>
map <Leader>a :Tabularize /=<CR>
map <Leader>b :Tabularize /:\zs<CR>
map f :Ag<space>
" will run esformatter after pressing <leader> followed by the 'e' and 's'
" keys
nnoremap <silent> <leader>es :Esformatter<CR>
vnoremap <silent> <leader>es :EsformatterVisual<CR>

"autocmd BufWritePost * :call SyncUploadFile()
"autocmd BufReadPre * :call SyncDownloadFile()


"NERDTree
"autocmd VimEnter * NERDTreeFind | wincmd p
"autocmd BufWinEnter * NERDTreeMirror

"Powerline
"source /usr/local/lib/python2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim

" These lines setup the environment to show graphics and colors correctly.
set nocompatible
set t_Co=256

let g:minBufExplForceSyntaxEnable = 1
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif

set laststatus=2 " Always display the statusline in all windows
set guifont=Inconsolata\ for\ Powerline:h14
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)


" set laststatus=2
" set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
" set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8
" if has("gui_running")
" 	let s:uname = system("uname")
" 	if s:uname == "Darwin\n"
" 		set guifont=Inconsolata\ for\ Powerline:h15
" 	endif
" endif

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



" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

nmap s <Plug>(CommandT)

" s{char}{char} to move to {char}{char}
"nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" You can use other keymappings like <C-l> instead of <CR> if you want to
" use these mappings as default search and somtimes want to move cursor with
" EasyMotion.
function! s:incsearch_config(...) abort
  return incsearch#util#deepextend(deepcopy({
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {
  \     "\<CR>": '<Over>(easymotion)'
  \   },
  \   'is_expr': 0
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))


function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
  \   'converters': [incsearch#config#fuzzyword#converter()],
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  \   'is_expr': 0,
  \   'is_stay': 1
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())
"noremap <silent><expr> / incsearch#go(<SID>config_easyfuzzymotion())

" Gif config
"nmap s <Plug>(easymotion-s2)
"nmap t <Plug>(easymotion-t2)

" Gif config
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" Gif config
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0 " keep cursor column when JK motion

let g:EasyMotion_smartcase = 1

" Paste
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
set pastetoggle=<Esc>[201~
set paste
return ""
endfunction
" End Paste

"
"let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
"
"Undotree
if has("persistent_undo")
    set undodir='~/.undodir/'
    set undofile
endif

map B :UndotreeToggle<CR>:UndotreeFocus<CR>
map U <C-r>

" filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

"Unicode
if has("multi_byte")
    if &termencoding == ""
        let &termencoding = &encoding
    endif
    set encoding=utf-8
    setglobal fileencoding=utf-8
    setglobal bomb
    set fileencodings=ucs-bom,utf-8,latin1
endif


"ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.tar,*.jpg,*.png,*.jpeg     " MacOSX/Linux

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|swp|swo)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|node_modules)$',
  \ 'file': '\v\.(exe|so|dll|swp|swo)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|tar|dmg|swp|swo)$'
let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1

let g:mta_use_matchparen_group = 0
let g:mta_set_default_matchtag_color = 0
" highlight MatchTag ctermfg=black ctermbg=lightgreen guifg=black guibg=lightgreen
highlight MatchTag ctermfg=red guifg=red

let g:jsx_ext_required = 0

augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }"

set autoread
" check file change every 4 seconds ('CursorHold') and reload the buffer upon
" detecting change
" set autoread
" au CursorHold * checktime
"
"autocmd BufWritePost * :call SyncUploadFile()
"autocmd BufReadPre * :call SyncDownloadFile()

" Track the engine.
"Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
"Plugin 'honza/vim-snippets'


"Multi_cursor
let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
" Map start key separately from next key
let g:multi_cursor_start_key='<F6>'
let g:multi_cursor_start_key='<C-n>'
let g:multi_cursor_start_word_key='g<C-n>'
let g:multi_cursor_quit_key='<C-c>'
nnoremap <C-c> :call multiple_cursors#quit()<CR>

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsExpandTrigger="<c-space>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Vim Javascript
let g:javascript_enable_domhtmlcss = 1
let g:javascript_ignore_javaScriptdoc = 1

" Vim CSS3 Syntax
augroup VimCSS3Syntax
    autocmd!

    autocmd FileType css setlocal iskeyword+=-
augroup END
":highlight VendorPrefix guifg=#00ffff gui=bold
":match VendorPrefix /-\(moz\|webkit\|o\|ms\)-[a-zA-Z-]\+/

"Auto Read
set autoread
augroup checktime
    au!
    if !has("gui_running")
        "silent! necessary otherwise throws errors when using command
        "line window.
        autocmd BufEnter        * silent! checktime
        autocmd CursorHold      * silent! checktime
        autocmd CursorHoldI     * silent! checktime
        "these two _may_ slow things down. Remove if they do.
        autocmd CursorMoved     * silent! checktime
        autocmd CursorMovedI    * silent! checktime
    endif
augroup END

"Vim AG
let g:ag_working_path_mode="r"

"Library Javascript Syntax
let g:used_javascript_libs = 'underscore,angularjs,angularui,angularuirouter'
autocmd BufReadPre *.js let b:javascript_lib_use_jquery = 1
autocmd BufReadPre *.js let b:javascript_lib_use_underscore = 1
autocmd BufReadPre *.js let b:javascript_lib_use_backbone = 1
autocmd BufReadPre *.js let b:javascript_lib_use_angularjs = 1

"Emmet
let g:user_emmet_mode='inv'
let g:user_emmet_leader_key='<C-e>'
let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/.snippets_custom.json')), "\n"))


"Python
let g:SimpylFold_docstring_preview=1
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
"python with virtualenv support




"Syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_javascript_checkers = ['jslint']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi']
let syntastic_mode_map = { 'passive_filetypes': ['html'] }
let g:RootIgnoreAgignore = 1
let g:ctrlp_working_path_mode = '0'
let g:CommandTTraverseSCM = 'pwd'
let g:CommandTCancelMap=['<C-x>', '<C-c>']
let g:CommandTAcceptSelectionVSplitMap=['<CR>']


function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END
set runtimepath^=~/.vim/bundle/ag
