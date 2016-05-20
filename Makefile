install: installbrew installzsh
	cp home/.zshrc ~/.zshrc
	cp home/.bashrc ~/.bashrc
	cp home/.vimrc ~/.vimrc
	touch ~/.zhistory

installbrew:
	# ❯ brew list | awk '{print "brew install "$1}'
	brew install antigen
	brew install autoconf
	brew install automake
	brew install awscli
	brew install bash-completion
	brew install bats
	brew install c-ares
	brew install cloog018
	brew install cscope
	brew install curl
	brew install daemonize
	brew install freetype
	brew install gcc49
	brew install gdbm
	brew install gettext
	brew install git
	brew install git-extras
	brew install glib
	brew install gmp4
	brew install gnupg
	brew install graphicsmagick
	brew install graphviz
	brew install htop
	brew install irssi
	brew install isl011
	brew install jpeg
	brew install jq
	brew install jsonpp
	brew install libevent
	brew install libffi
	brew install libgpg-error
	brew install libksba
	brew install libmpc08
	brew install libpng
	brew install libtiff
	brew install libtool
	brew install libwebsockets
	brew install libyaml
	brew install logstash
	brew install macvim
	brew install mosquitto
	brew install mpfr2
	brew install nmap
	brew install node
	brew install oniguruma
	brew install openssl
	brew install parallel
	brew install pkg-config
	brew install python
	brew install readline
	brew install reattach-to-user-namespace
	brew install redis
	brew install sqlite
	brew install tmux
	brew install wget
	brew install zeromq

installzsh:
	antigen bundle git
	antigen bundle git-extras
	antigen bundle pip
	antigen bundle npm
	antigen bundle rvm
	antigen bundle osx
	antigen bundle sindresorhus/pure
	antigen bundle brew
	antigen bundle zsh-users/zsh-syntax-highlighting
	antigen bundle zsh-users/zsh-autosuggestions

