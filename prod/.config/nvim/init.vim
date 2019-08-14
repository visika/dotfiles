call plug#begin('~/.vim/plugged')
    Plug 'liuchengxu/space-vim-dark'
    Plug 'itchyny/lightline.vim'
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'
    Plug 'zefei/vim-wintabs'
    Plug 'PotatoesMaster/i3-vim-syntax'
call plug#end()

let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

set nocompatible " turn off vi-compatible features/bindings
syntax enable " enable syntax highlighting
color space-vim-dark " colorscheme, set in ~/.vim/color
set updatetime=100 " interface update time in ms
set laststatus=2 " needed for lightline bar to work
set noshowmode " disable mode showing as lightline already displays this
set tabstop=4 " number of visual spaces per tab
set softtabstop=4 " number of spaces in tab when editing
set shiftwidth=4 " number of spaces to use for each step of (auto)indent
set autoindent " copy indent from current line when starting a new line
set expandtab " transform tabs to spaces
set number " show line numbers
set relativenumber " show line numbers relative to current position
" set numberwidth=10
" set foldcolumn=3
" set colorcolumn=80
set showcmd " show command in bottom bar
filetype indent on " load filetype-specific indent files
set wildmenu " visual autocomplete for command menu
set showmatch " highlight matching/closing brackets [{()}]
set incsearch " search as characters are entered
set hlsearch " highlight matches, turn off with nohlsearch
set formatoptions=tq " default is tcq, remove c to stop auto-insert of hashes when inserting comments
set listchars=tab:>>,trail:. " show tabs and spaces

highlight Normal ctermbg=none " turn off background colours from theme
highlight LineNr ctermbg=none ctermfg=none" turn off background colors for line number gutter
highlight CursorLineNr ctermbg=none " turn off background colors for current line number gutter
