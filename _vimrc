" ===============================================================================
" General Configuration
" ===============================================================================
set nocompatible

set number  " Set the line number
syntax on  " Syntax highlighting
"set autochdir  " Set the current dir as thr work dir
filetype on  " File type detection
filetype plugin on  " Loading the plugin files for specific file types
filetype indent on  " Loading the indent file for specific file types withset nocompatible

" Tab and Indent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
"set expand tab  " Use the space to instead of tab
set autoindent  " Copy indent from current line when starting a new line
set smartindent
set cindent

" Search and Match
set hlsearch  " Highlight the search result
set incsearch  " Real-time search
set ignorecase
set smartcase
set showmatch  " When a bracket is inserted, briefly jump to the matching one

" Spell
"set spell
"set spelllang=en

"Others
set nobackup
set nowritebackup
set cursorline
set history=1000
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936,utf-16,big5,euc-jp,latin1  
language messages zh_CN.utf-8

"shortcut
let mapleader=","
let g:mapleader=","

" whether is running GUI version
if has("gui_running")
	let g:isgui = 1
else
	let g:isgui = 0
endif

" operation system
if(has("win32") || has("win64") || has("win95") || has("win16"))
	let g:iswindows = 1
else
	let g:iswindows = 0
endif

if has('mac')
	let g:isMac = 1
else
	let g:isMac = 0
endif

"windows menu
if (g:iswindows==1)
	source $VIMRUNTIME/delmenu.vim
	source $VIMRUNTIME/menu.vim
endif

"" ===============================================================================
"" Vundle Configuration
"" ===============================================================================
"set nocompatible               " be improved, required
"filetype off                   " required!
""Vundle path
"set rtp+=$VIM/vimfiles/bundle/vundle
""Plugin path
"call vundle#begin('$VIM/vimfiles/bundle/')  " required!

""Plugin
"Plugin 'gmarik/vundle'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'SirVer/ultisnips'
"Plugin 'tpope/vim-surround'

""go
"Plugin 'fatih/vim-go'

"Plugin 'jiangmiao/auto-pairs'
"Plugin 'scrooloose/syntastic'
"Plugin 'scrooloose/nerdcommenter'
"Plugin 'scrooloose/nerdtree'

""Search
"Plugin 'kien/ctrlp.vim'

""markdown
"Plugin 'plasticboy/vim-markdown'
"Plugin 'iamcco/markdown-preview.vim'

""Display
"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
"Plugin 'chriskempson/tomorrow-theme'
"Plugin 'majutsushi/tagbar' 
"Plugin 'altercation/vim-colors-solarized'

""git
"Plugin 'tpope/vim-fugitive'

"call vundle#end()			" required!

"filetype plugin indent on  " required!

" ===============================================================================
" vim-plug Configuration
" ===============================================================================
"Plugin path
call plug#begin('$VIM/vimfiles/bundle/')  " required!

"Plugin
Plug 'gmarik/vundle'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-surround'
Plug 'ervandew/supertab'
Plug 'easymotion/vim-easymotion'

"go
Plug 'fatih/vim-go'

Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/syntastic'
Plug 'godlygeek/tabular'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'

"Search
Plug 'kien/ctrlp.vim'

"markdown
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.vim'

"Display
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'chriskempson/tomorrow-theme'
Plug 'majutsushi/tagbar' 
Plug 'altercation/vim-colors-solarized'

"git
Plug 'mhinz/vim-signify'
"Plug 'airblade/vim-gitgutter'
"Plug 'tpope/vim-fugitive'

call plug#end()			" required!

"vim-colors-solarized
syntax enable
set background=dark
colorscheme solarized

"vim-airline
let g:airline_theme='tomorrow'
let g:solarized_italic=0

"tagbar
let g:tagbar_ctags_bin='D:/IDE/Vim/vimfiles/plugin/ctags' 
let g:tagbar_width=30 

" NERDTree settings {{{
"let g:NERDTree_title = "[NERDTree]"
"function! NERDTree_Start()  
	"exec 'NERDTree'  
"endfunction  

"function! NERDTree_IsValid()  
	"return 1  
"endfunction 
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <leader>m :NERDTreeClose<CR>:NERDTreeFind<CR>
nnoremap <leader>N :NERDTreeClose<CR>

" Store the bookmarks file
let NERDTreeBookmarksFile=expand("$HOME/.vim/NERDTreeBookmarks")

" Show the bookmarks table on startup
let NERDTreeShowBookmarks=1

" Show hidden files, too
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1

" Quit on opening files from the tree
let NERDTreeQuitOnOpen=1

" Highlight the selected entry in the tree
let NERDTreeHighlightCursorline=1

" Use a single click to fold/unfold directories and a double click to open
" files
let NERDTreeMouseMode=2

" Don't display these kinds of files
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$',
            \ '\.o$', '\.so$', '\.egg$', '^\.git$', '__pycache__', '\.DS_Store' ]

" }}}

"ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
if (g:iswindows==1)
	set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
	let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows
else
	set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
	let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
endif
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
\ 'dir':  '\v[\/]\.(git|hg|svn)$',
\ 'file': '\v\.(exe|so|dll)$',
\ 'link': 'some_bad_symbolic_links',
\ }

"markdown-preview{{{
let g:mkdp_path_to_chrome = "C:/Program Files (x86)/Google/Chrome/Application/chrome.exe"
" path to the chrome or the command to open chrome(or other modern browsers)

let g:mkdp_auto_start = 0
" set to 1, the vim will open the preview window once enter the markdown
" buffer

let g:mkdp_auto_open = 0
" set to 1, the vim will auto open preview window when you edit the
" markdown file

let g:mkdp_auto_close = 1
" set to 1, the vim will auto close current preview window when change
" from markdown buffer to another buffer

let g:mkdp_refresh_slow = 0
" set to 1, the vim will just refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor

let g:mkdp_command_for_global = 0
" set to 1, the MarkdownPreview command can be use for all files,
" by default it just can be use in markdown file
"}}}
