set nocompatible
syntax on
filetype off

"noremap <C-N> <Left>
"noremap <C-E> <Down>
"noremap <C-U> <Up>
"noremap <C-I> <Right>
"noremap <C-Y> <PageDown>
"noremap <C-L> <PageUp>




call plug#begin('~/.vim/plugged')

Plug 'mileszs/ack.vim'
Plug 'nvie/vim-flake8'

call plug#end()
"Bundle 'rbgrouleff/bclose.vim'
"Bundle 'scrooloose/nerdtree'
"Bundle 'scrooloose/nerdcommenter'
"Bundle 'godlygeek/csapprox'
"Bundle 'airblade/vim-gitgutter'
"Bundle 'google/vim-maktaba'
"Bundle 'google/vim-codefmtlib'
"Bundle 'google/vim-codefmt'
"Bundle 'google/vim-glaive'
"Bundle 'xolox/vim-misc'
"Bundle 'xolox/vim-session'


"Bundle 'tpope/vim-fugitive'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'L9'
"Bundle 'eiginn/netrw'
"Bundle 'kien/ctrlp.vim'
"Bundle 'tpope/vim-unimpaired'
"Bundle 'tpope/vim-surround'
"Bundle 'ervandew/supertab'
filetype plugin indent on
set completeopt="menu"
set confirm
"//set shell=/bin/zsh\ -i

"let g:journal_directory = "~/blog/posts/journal"
"let g:journal_extension = "markdown"
"let g:instant_markdown_autostart = 0
"let g:vim_markdown_initial_foldlevel = 3
"let g:always_use_first_snippet = 1

"let g:airline#extensions#pomodoro#enabled=1
set timeout timeoutlen=150 ttimeoutlen=50
set laststatus=2
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif
let g:airline_symbols.space = "\ua0""
"end airline configuration"

"Pomodoro configuration
" Duration of a pomodoro in minutes (default: 25)
let g:pomodoro_time_work = 25

" Duration of a break in minutes (default: 5)
let g:pomodoro_time_slack = 5 
"
" " Log completed pomodoros, 0 = False, 1 = True (default: 0)
let g:pomodoro_do_log = 1
"
" " Path to the pomodoro log file (default: /tmp/pomodoro.log)
let g:pomodoro_log_file = "~/media/pomodoro.log"

nnoremap <F2> :GundoToggle<CR>
let g:ack_default_options = " -H --nocolor --nogroup --column"

"set guifont=Terminus
set guicursor=n-v-c:block-Cursor-blinkon0
set guicursor+=ve:ver35-Cursor
set guicursor+=o:hor50-Cursor
set guicursor+=i-ci:ver25-Cursor
set guicursor+=r-cr:hor20-Cursor
set guicursor+=sm:block-Cursor-blinkwait175-blinkoff150-blinkon175
set guioptions=Ace
"let g:jedi#popup_on_dot = 0
let g:gist_detect_filetype = 1
let g:gist_get_multiplefile=1


if $TERM == "linux" 
	set term=xterm
  set <F1>=[[A
  set <F2>=[[B
  set <F3>=[[C
  set <F4>=[[D
  set <F5>=[[E
endif
if $TERM == "screen"
  set term=xterm
endif
set t_Co=256


nnoremap  <silent>   <c-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:tabn<CR>
nnoremap  <silent> <c-s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:tabp<CR>

noremap <C-Down> <C-W>j
noremap <C-Right> <C-W>l
noremap <C-Left> <C-W>h
noremap <C-Up> <C-W>k
inoremap <C-Down> <C-o><C-W>j
inoremap <C-Right> <C-o><C-W>l
inoremap <C-Left> <C-o><C-W>h
inoremap <C-Up> <C-o><C-W>k


map <C-PageUp> :tabp <CR>
map <C-PageDown> :tabn <CR>
cmap w!! w !sudo tee > /dev/null %
"vmap <C-c> '<,'>w !xclip -selection clipboard
nmap ,p :r ~/.buffer <CR>

command C :nohls

colorscheme wombat256mod
set ssop-=options
"set ssop-=folds
set ssop-=blank
set ssop-=buffers
set wildmode=longest:full
set wildmenu
"""""""""""""""""""MiniBufExpl""""""""""""""""""
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplorerDebugLevel=0
"let g:miniBufExplorerDebugMode=2

set ruler
set incsearch
set cuc
set cul
set number
set noshowmatch
let loaded_matchparen=1
map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
map ,t :tabe <C-R>=expand("%:p:h") . "/" <CR>
map ,s :split <C-R>=expand("%:p:h") . "/" <CR>
map ,v :vsplit <C-R>=expand("%:p:h") . "/" <CR>
nnoremap ,cd :lcd %:p:h<CR>:pwd<CR>
"set shellcmdflag=-ic

set nosmartindent
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal textwidth=79
setlocal nowrap
set colorcolumn=+1

"map <F4> :NERDTree <CR>
map <F6> :setlocal spell spelllang=en_us <CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""'
"folders
if isdirectory($HOME . '/dump/vim-backup') == 0
  :silent !mkdir -p ~/dump/vim-backup >/dev/null 2>&1
endif
set backupdir-=.
set backupdir=~/dump/vim-backup/
"set backupdir^=./.vim-backup/
set backup

" Save your swp files to a less annoying place than the current directory.
" If you have .vim-swap in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/swap, ~/tmp or .
if isdirectory($HOME . '/dump/vim-swap') == 0
  :silent !mkdir -p ~/dump/vim-swap >/dev/null 2>&1
endif
"set directory=./.vim-swap//
set directory=~/dump/vim-swap/
"set directory+=~/tmp//
"set directory+=.
" viminfo stores the the state of your previous editing session
set viminfo+=n~/dump/viminfo

if exists("+undofile")
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
  " :help undo-persistence
  " This is only present in 7.3+
  if isdirectory($HOME . '/dump/vim-undo') == 0
    :silent !mkdir -p ~/dump/vim-undo > /dev/null 2>&1
  endif
  "set undodir=./.vim-undo//
  set undodir=~/dump/vim-undo/
  set undofile
endif


"
"
"imap <c-n> <NL>
"cmap <c-n> <NL>
inoremap <c-j> <c-n>
cnoremap <c-j> <c-n>

" rotate some keys about to get qwerty "hjkl" back for movement
noremap n <down>
noremap e <up>
noremap i <right>

" move these keys to their qwerty positions because they are
" in the way of hjkl (and E for J)
noremap k n
noremap K N
noremap l i
noremap L I
noremap N J
noremap E K
noremap I L
"
"" this is the only key that isn't in qwerty or colemak position
noremap j e
noremap J E

" window movement
nnoremap <c-w>n <c-w>j
nnoremap <c-w>i <c-w>l
nnoremap <c-w>e <c-w>k

" qwerty <c-w>n and <c-w>i stolen but do nothing so map back
nnoremap <c-w>k <c-w>n
nnoremap <c-w>l <c-w>i

" pentadactyl binds ctrl-h to history otherwise
map <c-h> <BS>
cmap <c-h> <BS>

" this nerdtree mapping interferes with movement
let g:NERDTreeMapOpenExpl = "j"


let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-e>"
