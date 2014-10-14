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
set encoding=utf-8
set number 
set tabstop=4 						" size of a hard tabstop
set shiftwidth=4 					" size of an "indent"
set showcmd
set showmode						" always show the mode were in

set cmdheight=2

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
