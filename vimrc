" Podstawowe ustawienia
set nocompatible
filetype plugin indent on
syntax enable

" Numerowanie linii
set number
set relativenumber

" Podświetlanie bieżącej linii
" set cursorline

" Ustawienia wcięć
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set autoindent
set smartindent

" Przycinanie długich linii
set wrap
set linebreak
set textwidth=0

" Kolumny graniczne
set colorcolumn=80,100,120
highlight ColorColumn ctermbg=238 guibg=#444444

" Wyszukiwanie
set ignorecase
set smartcase
set incsearch
set hlsearch

" Interfejs
set showmatch
set showmode
set showcmd
set wildmenu
set wildmode=longest:full,full
set laststatus=2
set ruler
