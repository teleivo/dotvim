" On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
" across (heterogeneous) systems easier.
if has('win32') || has('win64')
	set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif

call pathogen#infect()
call pathogen#helptags()

" ---------------------------------------------------------------------------------
" basic options
" ---------------------------------------------------------------------------------
colorscheme molokai
set encoding=utf-8
set number                          " show line numbers
set tabstop=4 						" size of a hard tabstop
set shiftwidth=4 					" size of an "indent"
set softtabstop=4
set expandtab
set showcmd
set showmode						" always show the mode were in at the bottom
set cursorline                      " colors the current line differently during insert
set cmdheight=2

set modelines=0
set nocompatible                    " turn off vi compatibilty

set wildmenu                        " enables a menu at the bottom
set wildmode=list:longest,full      " shows list of commands when doing completion in cmd line via tab
set ruler                           " shows ruler at the bottom right
let mapleader=","
set timeout timeoutlen=1500

" shortcuts for opening files located in the same directory as the current file
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

if has("autocmd")
	filetype plugin indent on
endif

inoremap  <Up>     <NOP>            " disable my arrow keys ;(
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

nnoremap / /\v                      " automatically insert this before search to change regex behavior
vnoremap / /\v                      
set ignorecase                      " affects case-sensitive searching
set smartcase
set gdefault                        " replace all occurances on substitutions
set incsearch                       " highlight search results
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>   " clear search results
nnoremap <tab> %                    " match bracket pairs when moving with tab
vnoremap <tab> %

set wrap                            " to handle long lines

inoremap <F1> <ESC>                 " get rid of help key
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>  " quickly open vimrc file in split window
nnoremap <leader>w <C-w>v<C-w>l     " open and move to new vertical split


