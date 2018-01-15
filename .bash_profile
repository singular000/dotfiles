# =============================================================================
# BASH PROFILE
# =============================================================================

# Use 256 color if possible
if [[ $COLORTERM = gnome-* && $TERM = xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then
  export TERM=gnome-256color
elif infocmp xterm-256color >/dev/null 2>&1; then
  export TERM=xterm-256color
fi

## Get and parse git branch for use in prompt
get_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [\1]/'
}

# Prompt - username, directory basename, git branch if exists, newline
export PS1="\e[0;37m\u \e[0;32m\W\e[0m\$(get_git_branch) \n$ "

# Let other programs use ctrl-s and ctrl-q (useful for Vim)
stty -ixon

# History
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoredups
export HISTCONTROL=ignoreboth

# =============================================================================
# ALIASES
# =============================================================================
alias reload="clear; source ~/.bash_profile"

# Extend commands with more detail
alias ls='ls -F'
alias ll='ls -FGlAhp'
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'
alias mkdir='mkdir -pv'
# find file
alias qfind='find . -name '

# git aliases
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias ghk='git checkout '
alias gb='git branch'
# git diff last commit
alias gdl='git diff --cached HEAD^'
# minimal git log
alias gl='git log --graph --oneline'
# minimal git log expanded with date and author
alias glx='git log --pretty=format:"%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --date=short --graph'
# git shortcuts (bad practice, PROHIBITED, only for messing around)
alias gpull='git pull origin master'
alias gpom='git push origin master'
alias gall='git add -A && git commit -m'

# Hide/show all desktop icons
alias hide_desktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias show_desktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
# Hide or show hidden files in Finder and on Desktop
alias hide_files="defaults write com.apple.finder AppleShowAllFiles FALSE && killall Finder"
alias show_files="defaults write com.apple.finder AppleShowAllFiles TRUE && killall Finder"

# =============================================================================
# PATH
# =============================================================================
export RBENV_ROOT=/usr/local/var/rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

