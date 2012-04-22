set shiftwidth=4
set ts=4
set softtabstop=4
set smartindent
set expandtab
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set ruler
set nocompatible
set showcmd
set hidden
set wildmenu
set wildmode=list:longest,full
set ruler
set backspace=indent,eol,start
set laststatus=2
set number
set lazyredraw
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
syntax on
set tags=tags;/

syntax on
filetype plugin indent on

"call pathogen#infect()

nnoremap ; :
let mapleader=","

" Open definition in a new tab
map <C-\> :vsp <CR><C-l>:exec("tag ".expand("<cword>"))<CR>

",<space> to clear highlights
nnoremap <leader><space> :noh<CR>

" Replace %% by current editing dir
cabbr <expr> %% expand('%:p:h')

" Vertically split and focus to that window
nnoremap <leader>w <C-w>v<C-w>l

" ,l to do what S-j does
nnoremap <leader>l <S-j>

" Fast navigation through windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

",ev to open vimrc
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

" Open tag list
nnoremap <leader>ft Vatzf


let g:user_zen_expandabbr_key = '<c-e>' 
let g:use_zen_complete_tag = 1

if has("gui_running")
" MacVim settings
  set lines=60 columns=200
  :set guifont=Monaco:h13
  colorscheme lucius
  set background=dark
  set guioptions=egmrt
endif

" For HTML
set matchpairs+=<:>

function! VisualTagsWrap()
    if !exists('g:tags_to_wrap')
        let g:tags_to_wrap=[]
    endif
    let g:tags_to_wrap=split(input('space separated tags to wrap block: ', join(g:tags_to_wrap, ' ')), '\s\+')
    if len(g:tags_to_wrap)>0
        execute 'normal! `>a</'.join(reverse(g:tags_to_wrap), '></').'>'
        execute 'normal! `<i<'.join(reverse(g:tags_to_wrap), '><').'>'
    endif
endfunction

