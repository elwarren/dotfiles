# my .zshrc
# still learning zsh
#

export VISUAL=vim
export EDITOR=vim
export TZ="America/New_York"

# history
HISTFILE=~/.zhistory
HISTSIZE=SAVEHIST=5000
setopt incappendhistory
setopt sharehistory
setopt extendedhistory

# vi mode
bindkey -v

# antigen from brew
source /usr/local/share/antigen.zsh
# load oh-my-zsh library
# antigen use oh-my-zsh
# theme
# author suggests NOT using antigen theme pure
antigen bundle sindresorhus/pure
# git
antigen bundle git
antigen bundle git-extras
antigen bundle tmuxinator
# python
antigen bundle python
antigen bundle pip
antigen bundle virtualenv
# node
antigen bundle node
antigen bundle npm
# ruby
antigen bundle rvm
antigen bundle gem
# osx
if [[ $CURRENT_OS == 'OS X' ]]; then
    antigen bundle brew
    antigen bundle osx
elif [[ $CURRENT_OS == 'OS X' ]]; then
    true
fi
# fish style
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
# do it!
antigen apply

# Disable autocorrect guesses. Happens when typing a wrong
unsetopt CORRECT
# Disable autocorrection
DISABLE_CORRECTION="true"

# private environment stuff that should not be synced to github
source ~/.bash_private

source ~/bin/finto-helpers.sh
# source ~/.bash_completion.d/bamgo

# my bin
export PATH=$PATH:~/bin
# add go to path
export PATH=$PATH:/usr/local/opt/go/libexec/bin
# Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.rvm/bin"
