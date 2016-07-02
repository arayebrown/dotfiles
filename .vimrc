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
Bundle 'davidosomething/syntastic-hbstidy'

filetype plugin indent on  " required!

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

set number
" shows row and column number at bottom right corner
set ruler

set nowrap                        " don't wrap lines
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs
set backspace=indent,eol,start    " backspace through everything in insert mode

imap <C-c> <CR><Esc>O

" Enables handlebars syntax highlighting
au BufRead,BufNewFile *.hbs setfiletype mustache

" Map some filetypes, e.g. turn off html checkers on handlebars (I'm using my
" hbstidy instead of html tidy)
let g:syntastic_filetype_map = {
      \   'html.handlebars': 'handlebars',
      \ }

" Use these checkers (handlebars is a different checker, not required for the
" hbstidy plugin)
let g:syntastic_handlebars_checkers  = ['handlebars', 'hbstidy']
" eslint checker
let g:syntastic_javascript_checkers = ['eslint']

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
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.DS_Store$', '\.git$']

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
" Other
""""""""""""""""""""""""""
set directory^=~/.vim/_temp//      " where to put swap files."

""""""""""""""""""""""""""
" End
""""""""""""""""""""""""""
