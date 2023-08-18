set nocompatible
set background=dark
set relativenumber
set noswapfile
set t_Co=256
set showmatch
set path+=**
set wildmenu
set nowrap
set hlsearch
set ignorecase
set incsearch
set smartcase

syntax enable
filetype off

" Enable scrolling with a mouse wheel
set mouse=a
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

set list
set listchars=
set listchars+=tab:··
set listchars+=trail:·

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins =========================
Plugin 'VundleVim/Vundle.vim'

" Vue syntax
Plugin 'posva/vim-vue'

" Material theme
Plugin 'kaicataldo/material.vim'

" Nerdtree
Plugin 'scrooloose/nerdtree'

" Copy / paster
Plugin 'christoomey/vim-system-copy'

" PHP superplugin
Plugin 'shawncplus/phpcomplete.vim'

" Vim javascript
Plugin 'pangloss/vim-javascript'

" Vim will draw a nice statusline at the bottom of each window
Plugin 'vim-airline/vim-airline'

Plugin 'godlygeek/tabular'

" Markdown
Plugin 'plasticboy/vim-markdown'

" Fugitive. Git stuff
Plugin 'tpope/vim-fugitive'

" Ctrlp
Plugin 'kien/ctrlp.vim'

" Commentary
Plugin 'tpope/vim-commentary'

" PHP. Syntax for PHP
Plugin 'StanAngeloff/php.vim'

" Blade syntax
Plugin 'xsbeats/vim-blade'

" All plugins must be defined before here
call vundle#end()
filetype plugin indent on

" GitHub Copilot
let g:copilot_enabled = v:false

" NERDTree
map <C-\> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1 " Press I to toggle hidden files
let NERDTreeQuitOnOpen=1
let NERDTreeDirArrows=1
let NERDTreeChDirMode=2
let NERDTreeHighlightCursorline=1
autocmd StdinReadPre * let s:std_in=1 " Open NerdTree on launch if no file selected
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif " Close vim if only NerdTree open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif " Close vim if only NerdTree open

" vim-airline
set encoding=utf-8
set guifont=Meslo\ LG\ M\ for\ Powerline "Install the font on host Putty 'powerline/fonts'
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts = 1
set term=xterm-256color
set laststatus=2	" Always show the status bar
set showtabline=2
set noshowmode	"Hide the default mode text

" Quick fix window
au FileType qf call MoveAndResize()
function MoveAndResize()
    wincmd L
    vertical res 45
endfunction

nmap <Leader>ec :lcl<CR>
nmap <Leader>en :lne<CR>
imap <Leader>en <ESC>:lne<CR>i
vmap <Leader>en <ESC>:lne<CR>i
nmap <Leader>ep :lp<CR>
imap <Leader>ep <ESC>:lp<CR>i
vmap <Leader>ep <ESC>:lp<CR>

" Material theme 'default' | 'palenight' | 'ocean' | 'lighter' | 'darker' | 'default-community' | 'palenight-community' | 'ocean-community' | 'lighter-community' | 'darker-community'
" Doesn't work for some reason
" let g:material_theme_style = 'darker'

"CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = 'node_modules\|git\|vendor'
set wildignore+=*.swp,*.zip,*.so,*/tmp/*

" keymaps
nmap <C-s> :w<CR>	" Make sure to add 'stty ixany' and 'stty ixoff -ixon' to .bashrc to disable freezing
imap <C-s> <ESC>:w<CR>i
nmap vs :vsplit<CR>
nmap sp :split<CR>
nmap <C-d> :bnext<CR>    " Faster buffer changes
nmap <C-a> :bprev<CR>   " Faster buffer changes
nmap <C-x> :bd<CR>  " Close the current buffer"

" Standard Settings"
colorscheme material
set tabstop=4
set shiftwidth=4
set smarttab
set tags=tags
set softtabstop=4
set autoindent
set copyindent
set pastetoggle=<F2>
set expandtab
set shiftround
set backspace=indent,eol,start	" allow backspaceing over evetyting in insert mode
set number
set ignorecase
set smartcase
set noerrorbells
set autowrite

" Disable all annoying beeps
set noerrorbells visualbell t_vb=
if has('autocmd')
    autocmd GUIEnter * set visualbell t_vb=
endif

" Syntax highlighting
au BufNewFile,BufRead *.blade.php set filetype=blade " Set blade extension syntax

" Mapping
map ,, :!clear && php %<CR>
map ,py :!clear && python3 %<CR>
map ,node :!clear && node %<CR>
map ,js :!clear && node %<CR>
map ,go :!clear && go run %<CR>
map ,bash :!clear && ./%<CR>
map ,gh :!clear && ghci %<CR>

" Other
nnoremap <CR> :nohlsearch<cr>

"Snippets
nnoremap ,html :-1read $HOME/.vim/snippets/.html.html<CR>3jwf>a
nnoremap ,class :-1read $HOME/.vim/snippets/.class.php<CR>2jwi
nnoremap ,pubf :-1read $HOME/.vim/snippets/.pubf.php<CR>f(i
nnoremap ,prif :-1read $HOME/.vim/snippets/.prif.php<CR>f(i
nnoremap ,prof :-1read $HOME/.vim/snippets/.prof.php<CR>f(i
nnoremap ,conf :-1read $HOME/.vim/snippets/.conf.php<CR>2j$a
nnoremap ,var :-1read $HOME/.vim/snippets/.var.php<CR>jf)i
nnoremap ,var1 :-1read $HOME/.vim/snippets/.var1.php<CR>jf)i
nnoremap ,var2 :-1read $HOME/.vim/snippets/.var2.php<CR>jf)i
nnoremap ,try :-1read $HOME/.vim/snippets/.try.php<CR>j$a
nnoremap ,try1 :-1read $HOME/.vim/snippets/.try1.php<CR>j$a
nnoremap ,try2 :-1read $HOME/.vim/snippets/.try2.php<CR>j$a
nnoremap ,setup :-1read $HOME/.vim/snippets/.setup.php<CR>8j$a
nnoremap ,tear :-1read $HOME/.vim/snippets/.tear.php<CR>8j$a
nnoremap ,test :-1read $HOME/.vim/snippets/.test.php<CR>f(
nnoremap ,dusktest :-1read $HOME/.vim/snippets/.dusktest.php<CR>7j$a
nnoremap ,fun :-1read $HOME/.vim/snippets/.fun.php<CR>f(i
nnoremap ,map :-1read $HOME/.vim/snippets/.map.php<CR>2jf)i
nnoremap ,map1 :-1read $HOME/.vim/snippets/.map1.php<CR>2jf)i
nnoremap ,map2 :-1read $HOME/.vim/snippets/.map2.php<CR>2jf)i
nnoremap ,filter :-1read $HOME/.vim/snippets/.filter.php<CR>f,i
nnoremap ,filter1 :-1read $HOME/.vim/snippets/.filter1.php<CR>f,i
nnoremap ,filter2 :-1read $HOME/.vim/snippets/.filter2.php<CR>f,i
nnoremap ,walk :-1read $HOME/.vim/snippets/.walk.php<CR>f,i
nnoremap ,walk1 :-1read $HOME/.vim/snippets/.walk1.php<CR>f,i
nnoremap ,walk2 :-1read $HOME/.vim/snippets/.walk2.php<CR>f,i
nnoremap ,for :-1read $HOME/.vim/snippets/.for.php<CR>f;f;
nnoremap ,for1 :-1read $HOME/.vim/snippets/.for1.php<CR>f;f;
nnoremap ,for2 :-1read $HOME/.vim/snippets/.for2.php<CR>f;f;
nnoremap ,fore :-1read $HOME/.vim/snippets/.foreach.php<CR>fata
nnoremap ,fore1 :-1read $HOME/.vim/snippets/.foreach1.php<CR>fata
nnoremap ,fore2 :-1read $HOME/.vim/snippets/.foreach2.php<CR>fata
nnoremap ,extends :-1read $HOME/.vim/snippets/.extends.php<CR>2jf)hi
nnoremap ,iife :-1read $HOME/.vim/snippets/.iife.js<CR>j$
nnoremap ,php :-1read $HOME/.vim/snippets/.php.php<CR>4ji
nnoremap ,temp :-1read $HOME/.vim/snippets/.temp.vue<CR>j$
