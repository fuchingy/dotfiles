""" Vundle management
" To install vundle, follow below instructions:
"   > sudo apt-get install git curl
"   > git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
"   > vim +PluginInstall +qall
" Tips, use BundleInstall to install
set nocompatible
filetype plugin on
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()    

""" Plugin list
" Let Vundle manage itself
Plugin 'gmarik/vundle'
"   nerdtree
Plugin 'scrooloose/nerdtree'
"   signature
Plugin 'kshenoy/vim-signature'
"   cscope
Plugin 'chazy/cscope_maps'
"   auto complete
"Plugin 'Valloric/YouCompleteMe'
"   general lint
"Plugin 'scrooloose/syntastic'
"   markdown highlight
Plugin 'gabrielelana/vim-markdown'
"   typescript highlight
Plugin 'leafgarland/typescript-vim'
Plugin 'peitalin/vim-jsx-typescript'

""" Plugin Setting
nnoremap <silent> <F5> :NERDTreeToggle<CR>
nnoremap <silent> <F6> :NERDTreeFind<CR>
let NERDTreeWinPos="left"
let NERDTreeShowBookmarks=1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeBookmarksFile=expand("$HOME/.vim-NERDTreeBookmarks")

nnoremap <silent> <F2> ]'<CR>

" cscope "
if has("cscope")
    set csprg=/usr/bin/cscope
    set csto=0
    set cst
    set nocsverb
"    " add any database in current directory
"    if filereadable("cscope.out")
"        cs add cscope.out
"    " else add database pointed to by environment
"    elseif $CSCOPE_DB != ""
"        cs add $CSCOPE_DB
"    endif
endif

map g<C-]> :cs find 3 <C-R>=expand("<cword>")<CR><CR>
map g<C-\> :cs find 0 <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>

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

" typescript highlight
" set filetypes as typescript.tsx
" http://vimdoc.sourceforge.net/htmldoc/filetype.html#new-filetype
autocmd BufNewFile,BufRead *.tsx,*.jsx,*.ts set filetype=typescript.tsx

""" Appearance """
" set cursorline
syntax enable
set ruler

" Do tab completion for file names more like bash.
set wildmode=list:longest
set wildignore+=*.pyc,*.pyo,.svn,.git,.bzr,

" Default indentation.
set expandtab
set shiftwidth=4
set softtabstop=4
set noautoindent

" Fix backspace delete
set backspace=indent,eol,start

" Layout
:noremap <F3> :set number! number?<CR>
set splitright

" Searching.
set hlsearch
:noremap <F4> :set hlsearch! hlsearch?<CR>

set laststatus=2
set statusline+=%F

" hexmode.
let mapleader = ","
let g:mapleader = ","

let hexmode = 0
map <leader>x  :%!xxd <cr>
map <leader>nx :%!xxd -r<cr>

set encoding=utf8
try
    lang en_US
catch
endtry

" Remove arrow key to force hjkl adoption
inoremap jk <esc>
nnoremap <Up> <nop>
nnoremap <Down> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>
inoremap <esc> <nop>

" Search without moving cursor
nnoremap * :let @/ = '\<'.expand('<cword>').'\>'\|set hlsearch<C-M>

" Avoid connect to X server to reduce vim start-up time
set clipboard=exclude:.*

" Draw a line at 130 for line-length coding style for python
fun! ToggleCC()
  if &cc == ''
    set cc=130
  else
    set cc=
  endif
endfun

nnoremap <F2> :call ToggleCC()<CR>
