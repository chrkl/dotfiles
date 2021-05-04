export ZSH=~/.zsh

# Load all of the config files in ~/oh-my-zsh that end in .zsh
for config_file ($ZSH/lib/*.zsh) source $config_file

# Load additional site-functions (e.g. installed by brew)
export FPATH=/usr/local/share/zsh/site-functions:/usr/local/share/zsh-completions:/opt/homebrew/share/zsh/site-functions:$FPATH

# Load and run compinit
autoload -U compinit
compinit -i

[ -f ~/.zsh_profile ] && source ~/.zsh_profile
[ -f ~/.zsh_private ] && source ~/.zsh_private

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias txc="tmux show-buffer | xclip -sel clip -i"
if [[ -n $SSH_CONNECTION && -z $TMUX ]]; then
    tmux attach -d || tmux new
fi

alias cdd='cd $(git rev-parse --show-toplevel)'

[ -f $HOME/.functions ] && source $HOME/.functions

autoload -U +X bashcompinit && bashcompinit
[ -f /usr/local/bin/terraform ] && complete -o nospace -C /usr/local/bin/terraform terraform

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

[ -f ${HOME}/dotfiles/fubectl/fubectl.source ] && source ${HOME}/dotfiles/fubectl/fubectl.source

