
# my bin
export PATH="$HOME/bin:$PATH"

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

