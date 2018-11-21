#!/bin/sh

if [ -d $HOME/dotfiles ]; then
    cd $HOME/dotfiles && git pull
else
    cd $HOME && git clone https://github.com/chrkl/dotfiles.git
fi

cd $HOME/dotfiles
git submodule init && git submodule update

mkdir -p $HOME/.vimbackup
mkdir -p $HOME/.config/nvim

ln -s $HOME/dotfiles/.vim/ $HOME/
ln -s $HOME/dotfiles/.vimrc $HOME/
ln -s $HOME/dotfiles/.vimrc $HOME/.config/nvim/init.vim
ln -s $HOME/dotfiles/.vim/bundle $HOME/config/nvim/
ln -s $HOME/dotfiles/.vim/colors $HOME/config/nvim/
ln -s $HOME/dotfiles/.zsh/ $HOME/
ln -s $HOME/dotfiles/.zshrc $HOME/
ln -s $HOME/dotfiles/.zlogin $HOME/
ln -s $HOME/dotfiles/.tmux.conf $HOME/
ln -s $HOME/dotfiles/.fzf/ $HOME/

$HOME/.fzf/install --all

