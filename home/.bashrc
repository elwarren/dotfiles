
# my bin
export PATH="$HOME/bin:$PATH"

# add go to path
export PATH=$PATH:/usr/local/opt/go/libexec/bin

# private environment stuff that should not be synced to github
source $HOME/.bash_private

source /usr/local/bin/finto-helpers.sh
source $HOME/.bash_completion.d/bamgo
complete -C aws_completer aws

if [ -f /usr/local/etc/bash_completion ]; then
  . /usr/local/etc/bash_completion
fi

# setup ruby env with rbenv
eval "$(rbenv init -)"

