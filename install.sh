#!/bin/sh

if [ -d $HOME/dotfiles ]; then
    cd $HOME/dotfiles && git pull
else
    cd $HOME && git clone https://github.com/chrkl/dotfiles.git
fi

cd $HOME/dotfiles
git submodule update --init --recursive

#mkdir -p $HOME/.vimbackup
#mkdir -p $HOME/.config/nvim

#ln -sf $HOME/dotfiles/.vim/ $HOME/
#ln -sf $HOME/dotfiles/.vimrc $HOME/
#ln -sf $HOME/dotfiles/.vimrc $HOME/.config/nvim/init.vim
#ln -sf $HOME/dotfiles/.vimrc $HOME/.ideavimrc
#ln -sf $HOME/dotfiles/.vim/bundle $HOME/.config/nvim/
#ln -sf $HOME/dotfiles/.vim/colors $HOME/.config/nvim/
ln -sf $HOME/dotfiles/.zsh/ $HOME/
ln -sf $HOME/dotfiles/.zshrc $HOME/
ln -sf $HOME/dotfiles/.zlogin $HOME/
ln -sf $HOME/dotfiles/.tmux.conf $HOME/
ln -sf $HOME/dotfiles/.tmux $HOME/
ln -sf $HOME/dotfiles/.fzf/ $HOME/
ln -sf $HOME/dotfiles/.functions $HOME/
ln -sf $HOME/dotfiles/.dir_colors $HOME/
ln -sf $HOME/dotfiles/.config/nvim $HOME/.config/
ln -sf $HOME/dotfiles/.config/bat $HOME/.config/
ln -sf $HOME/dotfiles/.config/hunk $HOME/.config/
ln -sf $HOME/dotfiles/.config/helix $HOME/.config/
ln -sf $HOME/dotfiles/.config/zellij $HOME/.config/

$HOME/.fzf/install --all

