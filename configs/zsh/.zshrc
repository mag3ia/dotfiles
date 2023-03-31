# Set up the $PATH variable
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Set the default shell options
HISTFILE=$HOME/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt append_history autocd extended_history nomatch notify

# Enable zsh completions
autoload -Uz compinit
compinit

# Set up the prompt
PROMPT="%n@%m:%~%# "

# Source the aliases file
if [ -f $HOME/.aliases ]; then
  source $HOME/.aliases
fi
