call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
Plug 'sjl/badwolf'
Plug 'https://github.com/kien/ctrlp.vim'
Plug 'https://github.com/morhetz/gruvbox'
Plug 'https://github.com/junegunn/seoul256.vim'
Plug 'https://github.com/scrooloose/syntastic' 
Plug 'https://github.com/airblade/vim-gitgutter'

" Add plugins to &runtimepath
call plug#end()

""UI
set t_Co=256
set number
syntax enable
set tabstop=4       " number of visual spaces per TAB
set expandtab       " tabs are spaces
set showcmd    
set cursorline          " highlight current line
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
set wildmenu            " visual autocomplete for command menu

"Add 80 character ruler
highlight ColorColumn ctermbg=darkred ctermfg=white guibg=#FFD9D9
call matchadd('ColorColumn', '\%81v', 100) "set column nr

colorscheme gruvbox         " awesome colorscheme
" " Switch
set background=dark
"set background=light

""Search
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

"CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

""""""""""""""""""""""""""""""
" => Status line
" """"""""""""""""""""""""""""""
" " Always show the status line
set laststatus=2
"
" " Format the status line

set statusline=%f       "filename
"set statusline+=%t       "tail of the filename
"set statusline+=%y      "filetype
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%=      "left/right separator
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %c    "cursor column
set statusline+=\ %P    "percent through file

"tmu
"" allows cursor change in tmux mode
if exists('$TMUX')
		let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
		let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
		let &t_SI = "\<Esc>]50;CursorShape=1\x7"
		let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
