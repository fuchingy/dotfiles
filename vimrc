""" Vundle management
" Tips, use BundleInstall to install
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
"call vundle#rc()    

""" Plugin list
" Let Vundle manage itself
"Plugin 'gmarik/vundle'
"   auto complete
"Plugin 'Valloric/YouCompleteMe'
"   general lint
"Plugin 'scrooloose/syntastic'

""" Plugin Setting
" scrooloose/syntastic checker "
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" 
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_loc_list_height = 3
" 
" let g:syntastic_python_checkers = ["pyflakes"]
" let g:syntastic_asm_checkers = ["aarch64-gcc"]

""" Appearance """
" set cursorline
syntax enable
set ruler

" Do tab completion for file names more like bash.
set wildmode=list:longest
set wildignore+=*.pyc,*.pyo,.svn,.git,.bzr,

" Default indentation.
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
" set autoindent

" Searching.
set hlsearch

" hexmode.
let mapleader = ","
let g:mapleader = ","

let hexmode = 0
map <leader>x  :%!xxd <cr>
map <leader>nx :%!xxd -r<cr>

