# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/dev/.oh-my-zsh

ZSH_THEME="powerlevel9k/powerlevel9k"

ENABLE_CORRECTION="true"
plugins=(fabric history git-flow zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
export EDITOR='vim2'

if [[ -a ~/.localrc  ]]; then
   source ~/.localrc
fi

alias tcpp='tmuxifier load-session cpp-fpwork'
