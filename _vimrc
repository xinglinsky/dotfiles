filetype on
set nocompatible
set encoding=utf-8
set shiftwidth=4
set softtabstop=4
set tabstop=4
set nobackup
set number
set autochdir	
set history=1000
set smartindent
set cursorline
set hlsearch
set nobackup
set nowritebackup
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
set fileencodings=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936,utf-16,big5,euc-jp,latin1  
language messages zh_CN.utf-8


"Vundle path
set rtp+=$VIM/vimfiles/bundle/vundle
"Plugin path
call vundle#begin('$VIM/vimfiles/bundle/')
 
"Plugin
Plugin 'gmarik/vundle'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'fatih/vim-go'
Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'majutsushi/tagbar' 
Plugin 'altercation/vim-colors-solarized'

call vundle#end() 

filetype plugin indent on
colorscheme molokai

"tagbar
let g:tagbar_ctags_bin='D:\IDE\Vim\vimfiles\plugin\ctags' 
let g:tagbar_width=30 

"NERDTree{
let g:NERDTree_title = "[NERDTree]"
function! NERDTree_Start()  
    exec 'NERDTree'  
endfunction  
  
function! NERDTree_IsValid()  
    return 1  
endfunction 
"}

"ctrlp{
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
"set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
"let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
"let g:ctrlp_custom_ignore = {
  "\ 'dir':  '\v[\/]\.(git|hg|svn)$',
  "\ 'file': '\v\.(exe|so|dll)$',
  "\ 'link': 'some_bad_symbolic_links',
  "\ }
"}


set diffexpr=MyDiff()
"function MyDiff()
  "let opt = '-a --binary '
  "if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  "if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  "let arg1 = v:fname_in
  "if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  "let arg2 = v:fname_new
  "if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  "let arg3 = v:fname_out
  "if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  "if $VIMRUNTIME =~ ' '
    "if &sh =~ '\<cmd'
      "if empty(&shellxquote)
        "let l:shxq_sav = ''
        "set shellxquote&
      "endif
      "let cmd = '"' . $VIMRUNTIME . '\diff"'
    "else
      "let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    "endif
  "else
    "let cmd = $VIMRUNTIME . '\diff'
  "endif
  "silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  "if exists('l:shxq_sav')
    "let &shellxquote=l:shxq_sav
  "endif
"endfunction

