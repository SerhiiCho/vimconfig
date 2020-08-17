"           ██
"          ░░
"  ██    ██ ██ ██████████  ██████  █████
" ░██   ░██░██░░██░░██░░██░░██░░█ ██░░░██
" ░░██ ░██ ░██ ░██ ░██ ░██ ░██ ░ ░██  ░░
"  ░░████  ░██ ░██ ░██ ░██ ░██   ░██   ██
"   ░░██   ░██ ███ ░██ ░██░███   ░░█████
"    ░░    ░░ ░░░  ░░  ░░ ░░░     ░░░░░
"
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
Plugin 'gmarik/Vundle.vim'

" Vue syntax
Plugin 'posva/vim-vue'

" Color schemes
Plugin 'rafi/awesome-vim-colorschemes'

" Nerdtree
Plugin 'scrooloose/nerdtree'

" Copy to clipboard
Plugin 'christoomey/vim-system-copy'

" PHP superplugin
Plugin 'shawncplus/phpcomplete.vim'

" Auto pirs
Plugin 'jiangmiao/auto-pairs'

" Vim javascript
Plugin 'pangloss/vim-javascript'

" Emmet
Plugin 'mattn/emmet-vim'

" Autosave
Plugin 'vim-scripts/vim-auto-save'

" vim-airline
" Vim will draw a nice statusline at the bottom of each window
Plugin 'vim-airline/vim-airline'

"colour-scheme
Plugin 'ajh17/Spacegray.vim'

" Markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" Fugitive
" Git stuff
Plugin 'tpope/vim-fugitive'

" VMustache
Plugin 'tobyS/vmustache'

" Ultisnips
Plugin 'SirVer/ultisnips'

" PDV
Bundle 'tobyS/PDV'

" Namespace resolver
Bundle 'arnaud-lb/vim-php-namespace'

" Ctrlp
Plugin 'kien/ctrlp.vim'

" Commentary
Plugin 'tpope/vim-commentary'

" Easymotion
Plugin 'Lokaltog/vim-easymotion'

" Surround
" Changin quotes or deleting them
Plugin 'tpope/vim-surround'

" Gundo
Plugin 'sjl/gundo.vim'

" PHP
" syntax for PHP
Plugin 'StanAngeloff/php.vim'

" Supertab
" Supertab is a vim plugin which allows you to use <Tab> for all your insert
Plugin 'ervandew/supertab'

" PHP refactoring
Bundle 'vim-php/vim-php-refactoring'

" Blade syntax
Plugin 'xsbeats/vim-blade'

Plugin 'mhinz/vim-signify'

" PHP-complete
" Bundle 'Shougo/vimproc'
" Bundle 'Shougo/unite.vim'
" Bundle 'm2mdas/phpcomplete-extended'
" Bundle 'm2mdas/phpcomplete-extended-laravel'

" All plugins must be defined before here
call vundle#end()
filetype plugin indent on

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

"UltiSnips
let g:UltiSnipsExpandTrigger="<Leader>sn"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" PHP Documentor
inoremap <leader>db <ESC>:call pdv#DocumentWithSnip()<CR>i 
nnoremap <leader>db :call pdv#DocumentWithSnip()<CR> 
vnoremap <leader>db :call pdv#DocumentWithSnip()<CR> 
let g:pdv_template_dir = $HOME ."/.vim/DocBlocks/"

" PHP QA
let g:syntastic_phpcs_disable = 1
let g:syntastic_phpmd_disable = 1

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

"CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = 'node_modules\|git\|vendor'
set wildignore+=*.swp,*.zip,*.so,*/tmp/*

" Gundo
nnoremap <F5> :GundoToggle<CR>
let g:gundo_close_on_revert = 1
set hidden " stops undo history deleting after buffer change

" Omincomplete
highlight Pmenu ctermbg=238 gui=bold
set completeopt-=preview
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

"PHP complete_extended
"autocmd  FileType php setlocal omnifunc=phpcomplete_extended#CompletePHP
"let g:phpcomplete_index_composer_command="composer"

" Supertab
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

" PHP refactoring
let g:php_refactor_command='php ~/.vim/refactor/refactor.phar'

" keymaps
nmap <C-s> :w<CR>	" Make sure to add 'stty ixany' and 'stty ixoff -ixon' to .bashrc to disable freezing
imap <C-s> <ESC>:w<CR>i
nmap vs :vsplit<CR>
nmap sp :split<CR>
nmap <C-d> :bnext<CR>    " Faster buffer changes
nmap <C-a> :bprev<CR>   " Faster buffer changes
nmap <C-x> :bd<CR>  " Close the current buffer"

" Autosave
let g:auto_save = 1 " enable AutoSave on Vim startup
let g:auto_save_in_insert_mode = 0 " do not save while in insert mode
" let g:auto_save_silent = 1  " do not display the auto-save notification

"Standard Settings"
colorscheme spacegray
"colorscheme github
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

" Disable all beeps
set noerrorbells visualbell t_vb=
if has('autocmd')
    autocmd GUIEnter * set visualbell t_vb=
endif

" Namespace resolver
let g:php_namespace_sort_after_insert = 1 " dependencies sorted every time you insert one

" Automatically adds the corresponding use statement for the name under the cursor
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>

" Syntax highlighting
au BufNewFile,BufRead *.blade.php set filetype=blade " Set blade extension syntax

" Mapping
map ,, :!clear && php7.4 %<CR>
map ,py :!clear && python3.6 %<CR>
map ,node :!clear && node %<CR>
map ,go :!clear && go run %<CR>
map ,node :!clear && node %<CR>

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
nnoremap ,test :-1read $HOME/.vim/snippets/.test.php<CR>5j$a
nnoremap ,dusktest :-1read $HOME/.vim/snippets/.dusktest.php<CR>7j$a
nnoremap ,func :-1read $HOME/.vim/snippets/.func.php<CR>3jf(i
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
nnoremap ,foreach :-1read $HOME/.vim/snippets/.foreach.php<CR>fata
nnoremap ,foreach1 :-1read $HOME/.vim/snippets/.foreach1.php<CR>fata
nnoremap ,foreach2 :-1read $HOME/.vim/snippets/.foreach2.php<CR>fata
nnoremap ,extends :-1read $HOME/.vim/snippets/.extends.php<CR>2jf)hi
nnoremap ,iife :-1read $HOME/.vim/snippets/.iife.js<CR>j$
nnoremap ,php :-1read $HOME/.vim/snippets/.php.php<CR>4ji
nnoremap ,temp :-1read $HOME/.vim/snippets/.temp.vue<CR>j$
