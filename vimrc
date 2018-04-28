set nocompatible              " be iMproved, required
filetype off                  " required

"
" Plugins
"

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'vim-airline/vim-airline'
Plugin 'rodjek/vim-puppet'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'morhetz/gruvbox'
Plugin 'jamessan/vim-gnupg'
if v:version > 704
Plugin 'Valloric/YouCompleteMe'
endif
Plugin 'prettier/vim-prettier'
Plugin 'fatih/vim-go'
Plugin 'fatih/vim-hclfmt'
Plugin 'editorconfig/editorconfig-vim'
" to ensure editorconfig plays nice with fugitive
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

call vundle#end()            " required

filetype plugin indent on    " required

"
" Settings
"
let t_Co=256
try
    colorscheme gruvbox
    let g:gruvbox_contrast_dark='medium'
catch
endtry

set background=dark

" vim-airline
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_theme='gruvbox'
" display all buffers when one tab is open
let g:airline#extensions#tabline#enabled = 1

if !exists('g:airline_powerline_fonts')
    let g:airline#extensions#tabline#left_sep = ' '
    let g:airline#extensions#tabline#left_alt_sep = '|'
    let g:airline_left_sep          = '▶'
    let g:airline_left_alt_sep      = '»'
    let g:airline_right_sep         = '◀'
    let g:airline_right_alt_sep     = '«'
    let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
    let g:airline#extensions#readonly#symbol   = '⊘'
    let g:airline#extensions#linecolumn#prefix = '¶'
    let g:airline#extensions#paste#symbol      = 'ρ'
    let g:airline_symbols.linenr    = '␊'
    let g:airline_symbols.branch    = '⎇'
    let g:airline_symbols.paste     = 'ρ'
    let g:airline_symbols.paste     = 'Þ'
    let g:airline_symbols.paste     = '∥'
    let g:airline_symbols.whitespace = 'Ξ'
else
    let g:airline#extensions#tabline#left_sep = ''
    let g:airline#extensions#tabline#left_alt_sep = '' " powerline symbols
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_symbols.branch = ''
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.linenr = ''
endif

" UltiSnips triggering
let g:UltiSnipsExpandTrigger = '<c-j>'
let g:UltiSnipsJumpForwardTrigger = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'
" workaround for https://github.com/SirVer/ultisnips/issues/711
let g:UltiSnipsSnippetDirectories = [ '~/.vim/my-ultisnips', '~/.vim/bundle/vim-snippets/UltiSnips', 'UltiSnips' ]
autocmd FileType javascript UltiSnipsAddFiletypes javascript-jasmine

" syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 3
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:tf_fmt_autosave = 0

set encoding=utf-8
set noerrorbells                    " no beeps
set autoread                        " reread changes without asking
set number                          " show line numbers
set textwidth=79                    " lines longer than 79 columns will be broken
syntax on                           " syntax highlighting

set tabstop=4                       " size of a hard tabstop
set shiftwidth=4                    " size of an "indent"
set softtabstop=4
set shiftround                      " round indent to multiple of 'shiftwidth'
set expandtab

set showcmd
set cursorline                      " colors the current line differently during insert
set cmdheight=2

set modelines=0
set backspace=indent,eol,start      " backspace did not work in mintty

set wildmenu                        " enables a menu at the bottom
set wildmode=list:longest,full      " shows list of commands when doing completion in cmd line via tab
set history=200                     " keep history of # ex commands
set ruler                           " shows ruler at the bottom right

set timeout timeoutlen=1500
set pastetoggle=<F3>                " toggle 'paste' to disable autoindent on pasting

"
" Key mappings
"
let mapleader=","
" shortcuts for opening files located in the same directory as the current file
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

if has("autocmd")
    filetype plugin indent on
    autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
    autocmd Filetype puppet setlocal ts=2 sts=2 sw=2
endif

" disable my arrow keys ;(
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>
"cursor should move down a single row on the screen
:nmap j gj
:nmap k gk
" automatically insert this before search to change regex behavior
nnoremap / /\v
vnoremap / /\v
set ignorecase                      " affects case-sensitive searching
set smartcase
set gdefault                        " replace all occurances on substitutions
set incsearch                       " highlight search results
set showmatch
set hlsearch
" clear search results
nnoremap <leader><space> :noh<cr>
" match bracket pairs when moving with tab
nnoremap <tab> %
vnoremap <tab> %

set wrap                            " to handle long lines

" get rid of help key
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" quickly open vimrc file in split window
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>  
" open and move to new vertical split
nnoremap <leader>w <C-w>v<C-w>l

" Shortcut to rapidly toggle set list
nmap <leader>l :set list!<CR>
set listchars=tab:>-,trail:*,eol:¬
"Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" open nerdtree toggle
map <C-n> :NERDTreeToggle<CR>

" start vim-airline by default
set laststatus=2
set noshowmode                      " hide the mode at the bottom, since vim-airline does that now

" in normal mode Space toggles current fold. if not on a fold moves to the
" right.
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

""""""""""""""
" GnuPG Extensions
""""""""""""""
" Tell the GnuPG plugin to armor new files.
let g:GPGPreferArmor=1

" Tell the GnuPG plugin to sign new files.
let g:GPGPreferSign=1

augroup GnuPGExtra
    " Set extra file options
    autocmd BufReadCmd,FileReadCmd *.\(gpg\|asc\|pgp\) call SetGPGOptions()
    " Automatically close unmodified files after inactivity.
    autocmd CursorHold *.\(gpg\|asc\|pgp\) quit
augroup END

function SetGPGOptions()
    setlocal noswapfile
    set viminfo=
    set updatetime=60000
    set foldmethod=marker
    set foldlevel=0
    set foldclose=all
    set foldopen=insert
    " make it harder to open folds by accident
    set foldopen=""
    " move cursor over word and press 'e' to obfuscate/unobfuscate it
    "noremap e g?iw
endfunction

" add go linter to runtime path
set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim
