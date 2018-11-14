export ZSH=~/.zsh

# Load all of the config files in ~/oh-my-zsh that end in .zsh
for config_file ($ZSH/lib/*.zsh) source $config_file

# Load additional site-functions (e.g. installed by brew)
export FPATH=/usr/local/share/zsh/site-functions:/usr/local/share/zsh-completions:$FPATH

# Load and run compinit
autoload -U compinit
compinit -i

[ -f ~/.zsh_profile ] && source ~/.zsh_profile
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [[ -n $SSH_CONNECTION && -z $TMUX ]]; then
    tmux attach || tmux new
fi

