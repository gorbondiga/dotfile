#!/bin/bash

###################################
# tmux configuration
###################################
#ensure tmux installed
if [ $(dpkg-query -W -f tmux 2>/dev/null | grep -c "ok installed") != 0 ]; then
    apt install tmux
fi
# clone tmux-resurrect
if [ ! -d ~/tmux ]; then
    mkdir ~/tmux;
    git clone https://github.com/tmux-plugins/tmux-resurrect ~/tmux;
fi
# add tmux configuration, resurrect and xterm-keys
cp tmux.conf ~/.tmux.conf;

###################################
# vim configuration
###################################
# ensure the .vim directory exists
if [ ! -d ~/.vim ]; then
    mkdir ~/.vim;
    touch ~/.vim/packages.vim;
    touch ~/.vim/shortcuts.vim;
fi
# download Vundle files
if [ ! -d ~/.vim/bundle ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim;
fi
# copy preconfigured vimrc
cp ~/dotfile/vimrc ~/.vimrc;
if [ ! -f ~/.vimrc ]; then
    vim +PluginInstall +qall;
    cd ~/.vim/bundle/YouCompleteMe;
    ./install.sh --clang-completer;
fi
# add colors to vim
if [ ! -d ~/.vim/colors ]; then
    mkdir ~/.vim/colors
    git clone https://github.com/altercation/vim-colors-solarized.git ~/.vim/colors/vim-colors-solarized;
    git clone https://github.com/Siphalor/vim-atomified.git ~/.vim/colors/atomified;
    mv ~/.vim/colors/atomified/colors/atomified.vim ~/.vim/colors/;
fi

