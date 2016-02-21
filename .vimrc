set nocompatible   " be iMproved
filetype off       " required!

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
Bundle 'altercation/vim-colors-solarized'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'jlanzarotta/bufexplorer'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'easymotion/vim-easymotion'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'pangloss/vim-javascript'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'Raimondi/delimitMate'
Bundle 'mustache/vim-mustache-handlebars'

filetype plugin indent on  " required!

set bs=2
set ts=4
set sw=4
set number
" shows row and column number at bottom right corner
set ruler

" For solarized plugin (color scheme)
" https://github.com/altercation/vim-colors-solarized

syntax enable
let g:solarized_termcolors=256
set t_Co=256
set background=dark
colorscheme solarized

""""""""""""""""""""""""""
" General Settings
""""""""""""""""""""""""""

set cpoptions+=$
set tabstop=2
set shiftwidth=2
set nowrap

imap <C-c> <CR><Esc>O

" Enables handlebars syntax highlighting
au BufRead,BufNewFile *.hbs setfiletype mustache

""""""""""""""""""""""""""
" Warn when columns > 80
""""""""""""""""""""""""""

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

""""""""""""""""""""""""""
" Launch NERDTree
""""""""""""""""""""""""""

let g:NERDTreeWinPos = "left"
au VimEnter * NERDTree

""""""""""""""""""""""""""
" Status line
""""""""""""""""""""""""""

if has("statusline") && !&cp
  set laststatus=2  " always show the status bar

  " Start the status line
  set statusline=%f\ %m\ %r
  set statusline+=Line:%l/%L[%p%%]
  set statusline+=Col:%v
  set statusline+=Buf:#%n
  set statusline+=[%b][0x%B]
endif

""""""""""""""""""""""""""
" JavaScript object keys get some color
""""""""""""""""""""""""""
hi def link jsObjectKey Label

""""""""""""""""""""""""""
" End
""""""""""""""""""""""""""
