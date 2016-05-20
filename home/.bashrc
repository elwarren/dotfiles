
# add go to path
export PATH=$PATH:/usr/local/opt/go/libexec/bin

# private environment stuff that should not be synced to github
source ~/.bash_private

source ~/bin/finto-helpers.sh
source ~/.bash_completion.d/bamgo
complete -C aws_completer aws

if [ -f /usr/local/etc/bash_completion ]; then
  . /usr/local/etc/bash_completion
fi

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
