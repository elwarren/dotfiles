# my .zshrc
# still learning zsh
#
#set -x
#
export WORK_HOME=$HOME/work
export PROJECTS_HOME=$HOME/Projects
export LANG=en_US.UTF-8
export VISUAL=vim
export EDITOR=vim
export TZ="America/New_York"
# gnu coreutils for ls
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
# my bin
export PATH="$HOME/bin:$PATH"
# brew doctor recommends
export PATH="$PATH:/usr/local/sbin"

# setup oracle instant client 12
export ORACLE_HOME="$HOME/db/instantclient_12_1"
export OCI_DIR="$ORACLE_HOME"
export TNS_NAMES="$ORACLE_HOME"
export DYLD_LIBRARY_PATH="$ORACLE_HOME:$DYLD_LIBRARY_PATH"
export LD_LIBRARY_PATH="$ORACLE_HOME"
export PATH="$PATH:$ORACLE_HOME"
export NLS_LANG="AMERICAN_AMERICA.UTF8"
# TODO is this still needed?
# ln -s "$ORACLE_HOME"/libclntsh.dylib.* "$ORACLE_HOME"/libclntsh.dylib
# ln -s "$ORACLE_HOME"/libocci.dylib.* "$ORACLE_HOME"/libocci.dylib

# setup oracle sqlcl
export LD_LIBRARY_PATH=$HOME/db/sqlcl/lib
export PATH=$PATH:$HOME/db/sqlcl/bin

# setup golang
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export GOPATH=$HOME/work/gocode

# setup java
export JAVA_HOME=$( /usr/libexec/java_home )

# setup ruby environment with rbenv
eval "$(rbenv init -)"

# setup python environment with pyenv and virtualenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PIP_PREFIX="/usr/local"
export VIRTUALENVS_HOME=$HOME/virtualenvs
# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true

# history
HISTFILE=$HOME/.zhistory
HISTSIZE=SAVEHIST=5000
setopt incappendhistory
setopt sharehistory
setopt extendedhistory
setopt hashlistall

# HACK to fix pure prompt install
fpath=( "$HOME/.zfunctions" $fpath )

# antigen from brew
# source /usr/local/share/antigen.zsh
source /usr/local/share/antigen/antigen.zsh
# load oh-my-zsh library
antigen use oh-my-zsh
# theme
# author suggests NOT using antigen theme pure
antigen bundle joel-porquet/zsh-dircolors-solarized.git
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
#antigen bundle rvm
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
## do it!
antigen apply

# use ohmyzsh seems to set this, disabling because conflict with LS_COLORS
unset LSCOLORS

# Disable autocorrect guesses. Happens when typing a wrong
unsetopt CORRECT
# Disable autocorrection
DISABLE_CORRECTION="true"

# private environment stuff that should not be synced to github
source $HOME/.bash_private

source /usr/local/bin/finto-helpers.sh

# use bash completions in zsh
autoload bashcompinit
bashcompinit
source $HOME/.bash_completion.d/bamgo

# vi mode has to be set after antigen oh-my-zsh else it gets lost
bindkey -v

