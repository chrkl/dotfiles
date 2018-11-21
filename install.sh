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

ln -sf $HOME/dotfiles/.vim/ $HOME/
ln -sf $HOME/dotfiles/.vimrc $HOME/
ln -sf $HOME/dotfiles/.vimrc $HOME/.config/nvim/init.vim
ln -sf $HOME/dotfiles/.vim/bundle $HOME/.config/nvim/
ln -sf $HOME/dotfiles/.vim/colors $HOME/.config/nvim/
ln -sf $HOME/dotfiles/.zsh/ $HOME/
ln -sf $HOME/dotfiles/.zshrc $HOME/
ln -sf $HOME/dotfiles/.zlogin $HOME/
ln -sf $HOME/dotfiles/.tmux.conf $HOME/
if [ -f $HOME/.fzf ]; then
    ln -s $HOME/dotfiles/.fzf/ $HOME/
fi

$HOME/.fzf/install --all

