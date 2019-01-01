set nocompatible              " be iMproved, required
set nu
set tabstop=4

filetype off                  " required

let mapleader = "<"

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Installed plugins
if v:version > 704
	Plugin 'Valloric/YouCompleteMe'
endif
Plugin 'jnwhiteh/vim-golang'
Plugin 'klen/python-mode'
Plugin 'scrooloose/nerdtree'
Plugin 'puppetlabs/puppet-syntax-vim'
Plugin 'tpope/vim-fugitive'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'wkentaro-archive/conque.vim'
Plugin 'dracula/vim'
" Plugin 'christoomey/vim-tmux-navigator'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Mapped keys to send code lines to Conque-Shell
imap <silent> <leader>j <Esc>Vy<C-w>jp
nmap <silent> <leader>j Vy<C-w>jp
vmap <silent> <leader>j y<C-w>jp

command IPython ConqueTermSplit ipython
command Bash ConqueTermSplit bash
command Python ConqueTermSplit python

if has('gui_running')
	set background=light
else
	set background=dark
endif

set tabstop=4
syntax enable
syntax on
color dracula

let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeWinSize = 20
" autocmd VimEnter * NERDTree

let g:ConqueTerm_PyVersion = 3
let g:ConqueTerm_FastMode = 1
let g:ConqueTerm_CWInsert = 1
" let pyshell = conque_term#open('ipython', ['split', 'resize 20'], 0)
