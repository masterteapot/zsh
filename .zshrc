#!/bin/sh
export ZDOTDIR=$HOME/.config/zsh
export HISTFILE="$ZDOTDIR/.zsh_history"
export PATH=/home/jared/.cargo/bin:$PATH
export PATH="$PATH:/opt/nvim-linux64/bin"
export PATH="$PATH:$HOME/.jaredbs"

setopt appendhistory

# some useful options (man zshoptions)
setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments
stty stop undef		# Disable ctrl-s to freeze terminal.
zle_highlight=('paste:none')

# beeping is annoying
unsetopt BEEP

# completions
autoload -Uz compinit
zstyle ':completion:*' menu select
# zstyle ':completion::complete:lsof:*' menu yes select
zmodload zsh/complist

# compinit
_comp_options+=(globdots)		# Include hidden files.

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Colors
autoload -Uz colors && colors

# Useful Functions
source "$ZDOTDIR/zsh-functions"


# heavy exports
alias heavy='zsh_add_file "zsh-heavy-exports"'

# jareds fun scripts
zsh_add_file "extract-music.sh"
zsh_add_file "add-pic-size.sh"
zsh_add_file "ddg.sh"
zsh_add_file "fzf_custom.sh"

# Normal files to source
zsh_add_file "zsh-exports"
zsh_add_file "zsh-vim-mode"
zsh_add_file "zsh-aliases"
zsh_add_file "zsh-prompt"

# Plugins
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "hlissner/zsh-autopair"
zsh_add_completion "esc/conda-zsh-completion" false
fpath+=./completion


# For more plugins: https://github.com/unixorn/awesome-zsh-plugins
# More completions https://github.com/zsh-users/zsh-completions

# Key-bindings
bindkey -s '^o' 'ranger^M'
bindkey -s '^s' 'ncdu^M'
# bindkey -s '^b' 'nvim "$(rg --files --hidden | fzf --preview=\"batcat --style=plain --color=always {}\" --bind shift-up:preview-page-up,shift-down:preview-page-down)"^M'
bindkey -s '^f' 'nvim $(fzf)^M'
bindkey -s '^h' 'zsh_history | $(fzf)^M'
bindkey '^[[P' delete-char
bindkey "^p" up-line-or-beginning-search # Up
bindkey "^n" down-line-or-beginning-search # Down
bindkey "^k" up-line-or-beginning-search # Up
bindkey "^j" down-line-or-beginning-search # Down
bindkey -r "^u"
bindkey -r "^d"
bindkey -s '^f' 'fzf_open^M'
bindkey -s '^d' 'fzf_cd^M'
bindkey -s '^y' 'fzf_yay^M'


# FZF 
# [ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh
# [ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
# [ -f /usr/share/doc/fzf/examples/completion.zsh ] && source /usr/share/doc/fzf/examples/completion.zsh
# [ -f /usr/share/doc/fzf/examples/key-bindings.zsh ] && source /usr/share/doc/fzf/examples/key-bindings.zsh
# [ -f $ZDOTDIR/completion/_fnm ] && fpath+="$ZDOTDIR/completion/"
# export FZF_DEFAULT_COMMAND='rg --hidden -l ""'
compinit

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line

# Speedy keys
if [[ $XDG_SESSION_TYPE = "xll" ]]
then
	xset r rate 210 40
fi


# Environment variables set everywhere
export EDITOR="nvim"

# For QT Themes
export QT_QPA_PLATFORMTHEME=qt5ct
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
