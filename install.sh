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
if [ ! -f ~/.tmux.conf ]; then
    touch ~/.tmux.conf;
    echo "set-window-option -g xterm-keys on" >> ~/.tmux.conf;
    # Move panes with mouse
    # echo "set-option -g mouse-select-pane on" >> ~/.tmux.conf;
    # Move panes with Alt+arrow
    echo "bind -n M-Left select-pane -L" >> ~/.tmux.conf;   
    echo "bind -n M-Right select-pane -R" >> ~/.tmux.conf;
    echo "bind -n M-Up select-pane -U" >> ~/.tmux.conf;
    echo "bind -n M-Down select-pane -D" >> ~/.tmux.conf;
    # install tmux-resurrect
    echo "set -g @plugin 'tmux-plugins/tmux-resurrect'" >> ~/.tmux.conf;
    echo "set -g @plugin 'tmux-plugins/tmux-continuum'" >> ~/.tmux.conf;
    echo "set -g @resurrect-processes 'ssh psql mysql sqlite3'" >> ~/.tmux.conf;
    echo "run-shell ~/tmux/resurrect.tmux" >> ~/.tmux.conf;
fi

###################################
# vim configuration
###################################

# ensure the .vim directory exists
if [ ! -d ~/.vim ]; then
    mkdir ~/.vim;
    touch ~/.vim/packages.vim;
    touch ~/.vim/shortcuts.vim;
fi

# setup powerline fonts
# download Vundle files
if [ ! -d ~/.vim/bundle ]; then
#    git clone git@github.com:powerline/fonts.git ~/.powerline_fonts
#    . ~/.powerline_fonts/install.sh
#    sudo -E fc-cache -vf ~/.fonts/
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim;
fi
# copy preconfigured vimrc
if [ ! -f ~/.vimrc ]; then
    cp ~/dotfile/vimrc ~/.vimrc;
    vim +PluginInstall +qall;
    cd ~/.vim/bundle/YouCompleteMe;
    ./install.sh --clang-completer;
    echo "set tabstop=4" >> ~/.vimrc;
    echo 'syntax enable " light' >> ~/.vimrc;
    echo "set background=dark" >> ~/.vimrc; 
    echo "colorscheme atomified" >> ~/.vimrc;
fi
# add colors to vim
if [ ! -d ~/.vim/colors ]; then
    mkdir ~/.vim/colors
    git clone https://github.com/altercation/vim-colors-solarized.git ~/.vim/colors/vim-colors-solarized;
    git clone https://github.com/Siphalor/vim-atomified.git ~/.vim/colors/atomified;
    mv ~/.vim/colors/atomified/colors/atomified.vim ~/.vim/colors/;
fi

