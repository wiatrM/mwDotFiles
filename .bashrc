# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

LD_LIBRARY_PATH=/home/dev/lib/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH

PATH=$PATH:/home/dev/lib/bin
PATH=~/home/dev/lib/bin:$PATH


export PATH="$HOME/.tmuxifier/bin:$PATH"
export PATH="$HOME/bin:$PATH";

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
   [ -r "$file"  ] && [ -f "$file"  ] && source "$file";
   done;
unset file;


eval "$(tmuxifier init -)"

LS_COLORS="di=1;35:ex=4;31:*.mp3=1;32;41"
alias ls='ls --color -F'
alias tm='tmux -2'
