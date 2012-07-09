" http://vimdoc.sourceforge.net/htmldoc/starting.html#vimrc

au GUIEnter * simalt ~x "open maximised

filetype plugin on

set fileencodings=utf-8,latin2
set enc=utf-8
set relativenumber 	

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set wildmenu
set wildmode=list:longest " make completion behave like in bash

set autochdir
set backupdir=/tmp,d:\vim-backups
set noswapfile

set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set cursorline          " highlight current line

set nocompatible        " use vim defaults
set scrolloff=3         " keep 3 lines when scrolling
set ai                  " set auto-indenting on for programming

set showcmd             " display incomplete commands
set nobackup            " do not keep a backup file
set ruler               " show the current row and column
set hlsearch            " highlight searches
set incsearch           " do incremental searching
set showmatch           " jump to matches when entering regexp
set ignorecase          " ignore case when searching
set smartcase           " no ignorecase if Uppercase char present
set gdefault            " replace all occurences by default

set visualbell t_vb=    " turn off error beep/flash
set novisualbell        " turn off visual bell

set backspace=indent,eol,start  " make that backspace key work the way it should

syntax on               " turn syntax highlighting on by default
filetype on             " detect type of file
filetype indent on      " load indent file for specific file type

set t_RV=               " http://bugs.debian.org/608242, http://groups.google.com/group/vim_dev/browse_thread/thread/9770ea844cec3282

set laststatus=2        " always show the status line
" buffer number / full filename / {endline type | encoding / filetype}  [line,col][percent]
set statusline=\ %n\ \ %<%F%m%r%h%w\ %=%(%{&ff}\ \|\ %{(&fenc==\"\"?&enc:&fenc)}%k\ \|\ %Y%)\ %([%l,%v][%p%%]\ %)

"  parts from http://amix.dk/vim/vimrc.html
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = " "
let g:mapleader = " "

" Fast saving
nmap <leader>w :w!<cr>
" This is fast after exiting from insert mode
map <F2> :w<cr>

" kill hilights
nnoremap <leader><space> :noh<cr>   
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quickly open a buffer for scribble
map <leader>q :tabe ~/buffer<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" Scroll faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Switch between tabs with ctrl + h|l
map <C-h> :tabp<CR>
map <C-l> :tabn<CR>
" Move tabs with ctrl + j|k
nnoremap <silent> <C-j> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <C-k> :execute 'silent! tabmove ' . tabpagenr()<CR>

map <leader>c :tabclose<cr>

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Remember info about open buffers on close
set viminfo^=%

" reload vim snippets
" This function will update snippets list for current and empty filetype:
function! SnippetsUpdate(snip_dir)
  call ResetSnippets()
  call GetSnippets(a:snip_dir, '_')
  call GetSnippets(a:snip_dir, &ft)
endfunction

" This command will cause SnippetsUpdate() with parameter <your_snip_dir>
nmap <leader>rr :call SnippetsUpdate("~/.vim/snippets/")<CR>

t_Co=256
colo zenburn
