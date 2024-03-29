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
vim +PluginInstall +qall;
cd ~/.vim/bundle/YouCompleteMe;
./install.sh --clang-completer;

# add colors to vim
if [ ! -d ~/.vim/colors ]; then
    mkdir ~/.vim/colors
    git clone https://github.com/altercation/vim-colors-solarized.git ~/.vim/colors/vim-colors-solarized;
    git clone https://github.com/Siphalor/vim-atomified.git ~/.vim/colors/atomified;
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
    cp ~/.fzf/bin/fzf /usr/bin/fzf
    mv ~/.vim/colors/atomified/colors/atomified.vim ~/.vim/colors/;
fi

echo "export TERM=xterm-256color" >> ~/.bashrc;
echo "export HISTCONTROL=ignoredups:erasedups" >> ~/.bashrc;
# append history entries..
echo "shopt -s histappend" >> ~/.bashrc;
# After each command, save and reload history
echo 'export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"' >> ~/.bashrc;
# Fix date time issues
echo 'sudo hwclock --hctosys' >> ~/.bashrc

###################################
# i3 configuration
###################################
if [ $(dpkg-query -W -f i3wm 2>/dev/null | grep -c "ok installed") != 0 ]; then
    apt install i3
fi
# copy i3 config files into the configuration
mkdir -p ~/.config
cp -rf ~/dotfile/.config/i3 ~/.config/.;
