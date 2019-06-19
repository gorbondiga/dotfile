set nocompatible              " be iMproved, required
set nu
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set nu rnu

filetype off
filetype plugin indent on
filetype plugin on

syntax on
syntax enable

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
Plugin 'fatih/vim-go'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'klen/python-mode'
Plugin 'scrooloose/nerdtree'
Plugin 'puppetlabs/puppet-syntax-vim'
Plugin 'tpope/vim-fugitive'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'wkentaro-archive/conque.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'dracula/vim'
Plugin 'flazz/vim-colorschemes'
" Plugin 'christoomey/vim-tmux-navigator'

" All of your Plugins must be added before the following line
call vundle#end()            " required

colorscheme gruvbox

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

let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeWinSize = 20
" autocmd VimEnter * NERDTree

let g:ConqueTerm_PyVersion = 3
let g:ConqueTerm_FastMode = 1
let g:ConqueTerm_CWInsert = 1
" let pyshell = conque_term#open('ipython', ['split', 'resize 20'], 0)

let g:airline#extensions#tabline#enabled = 1
let g:airline_detect_modified = 1
let g:airline_theme = 'solarized'

nmap <silent> <Tab> :bnext<CR>
nmap <silent> <S-Tab> :bprevious<CR>
nmap <silent> <C-X> :bdelete<CR>

" MISC
au BufNewFile,BufRead *.pp set ft=puppet
