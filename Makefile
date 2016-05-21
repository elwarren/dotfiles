all: install

help:
	# make all
	# make install
	# make installbrew
	# make installzsh
	# make diff
	true

diff:
	diff home/.zshrc  ~/.zshrc  || true
	diff home/.bashrc ~/.bashrc || true
	diff home/.vimrc  ~/.vimrc  || true

update:
	diff ~/.zshrc  home/.zshrc  || true
	diff ~/.bashrc home/.bashrc || true
	diff ~/.vimrc  home/.vimrc  || true

install: installbrew 
	cp home/.zshrc ~/.zshrc
	cp home/.bashrc ~/.bashrc
	cp home/.vimrc ~/.vimrc
	touch ~/.zhistory

installzsh:
	# HACK to fix pure theme, must be done after antigen bundle is installed https://github.com/sindresorhus/pure
	mkdir ~/.zfunctions
	ln -sf ~/.antigen/repos/https-COLON--SLASH--SLASH-github.com-SLASH-sindresorhus-SLASH-pure.git/async.zsh ~/.zfunctions/async
	ln -sf ~/.antigen/repos/https-COLON--SLASH--SLASH-github.com-SLASH-sindresorhus-SLASH-pure.git/pure.zsh ~/.zfunctions/prompt_pure_setup

installbrew:
	# ❯ brew list | awk '{print "\tbrew list --versions "$1" || brew install "$1" || brew upgrade "$1}' >> Makefile
	brew list --versions antigen || brew install antigen || brew upgrade antigen
	brew list --versions apache-drill || brew install apache-drill || brew upgrade apache-drill
	brew list --versions autoconf || brew install autoconf || brew upgrade autoconf
	brew list --versions automake || brew install automake || brew upgrade automake
	brew list --versions awscli || brew install awscli || brew upgrade awscli
	brew list --versions bash-completion || brew install bash-completion || brew upgrade bash-completion
	brew list --versions bats || brew install bats || brew upgrade bats
	brew list --versions bfgminer || brew install bfgminer || brew upgrade bfgminer
	brew list --versions boost || brew install boost || brew upgrade boost
	brew list --versions brew-cask || brew install brew-cask || brew upgrade brew-cask
	brew list --versions c-ares || brew install c-ares || brew upgrade c-ares
	brew list --versions cgal || brew install cgal || brew upgrade cgal
	brew list --versions cloog018 || brew install cloog018 || brew upgrade cloog018
	brew list --versions coreutils || brew install coreutils || brew upgrade coreutils
	brew list --versions cscope || brew install cscope || brew upgrade cscope
	brew list --versions curl || brew install curl || brew upgrade curl
	brew list --versions daemonize || brew install daemonize || brew upgrade daemonize
	brew list --versions freetype || brew install freetype || brew upgrade freetype
	brew list --versions freexl || brew install freexl || brew upgrade freexl
	brew list --versions gcc49 || brew install gcc49 || brew upgrade gcc49
	brew list --versions gdal || brew install gdal || brew upgrade gdal
	brew list --versions gdbm || brew install gdbm || brew upgrade gdbm
	brew list --versions geos || brew install geos || brew upgrade geos
	brew list --versions gettext || brew install gettext || brew upgrade gettext
	brew list --versions giflib || brew install giflib || brew upgrade giflib
	brew list --versions git || brew install git || brew upgrade git
	brew list --versions git-extras || brew install git-extras || brew upgrade git-extras
	brew list --versions glib || brew install glib || brew upgrade glib
	brew list --versions gmp || brew install gmp || brew upgrade gmp
	brew list --versions gmp4 || brew install gmp4 || brew upgrade gmp4
	brew list --versions gnupg || brew install gnupg || brew upgrade gnupg
	brew list --versions go || brew install go || brew upgrade go
	brew list --versions graphicsmagick || brew install graphicsmagick || brew upgrade graphicsmagick
	brew list --versions graphviz || brew install graphviz || brew upgrade graphviz
	brew list --versions hidapi || brew install hidapi || brew upgrade hidapi
	brew list --versions highlight || brew install highlight || brew upgrade highlight
	brew list --versions htop || brew install htop || brew upgrade htop
	brew list --versions htop-osx || brew install htop-osx || brew upgrade htop-osx
	brew list --versions irssi || brew install irssi || brew upgrade irssi
	brew list --versions isl011 || brew install isl011 || brew upgrade isl011
	brew list --versions jansson || brew install jansson || brew upgrade jansson
	brew list --versions jpeg || brew install jpeg || brew upgrade jpeg
	brew list --versions jq || brew install jq || brew upgrade jq
	brew list --versions json-c || brew install json-c || brew upgrade json-c
	brew list --versions jsonpp || brew install jsonpp || brew upgrade jsonpp
	brew list --versions libevent || brew install libevent || brew upgrade libevent
	brew list --versions libffi || brew install libffi || brew upgrade libffi
	brew list --versions libgeotiff || brew install libgeotiff || brew upgrade libgeotiff
	brew list --versions libgpg-error || brew install libgpg-error || brew upgrade libgpg-error
	brew list --versions libksba || brew install libksba || brew upgrade libksba
	brew list --versions liblwgeom || brew install liblwgeom || brew upgrade liblwgeom
	brew list --versions libmicrohttpd || brew install libmicrohttpd || brew upgrade libmicrohttpd
	brew list --versions libmpc08 || brew install libmpc08 || brew upgrade libmpc08
	brew list --versions libpng || brew install libpng || brew upgrade libpng
	brew list --versions libspatialite || brew install libspatialite || brew upgrade libspatialite
	brew list --versions libtiff || brew install libtiff || brew upgrade libtiff
	brew list --versions libtool || brew install libtool || brew upgrade libtool
	brew list --versions libusb || brew install libusb || brew upgrade libusb
	brew list --versions libwebsockets || brew install libwebsockets || brew upgrade libwebsockets
	brew list --versions libxml2 || brew install libxml2 || brew upgrade libxml2
	brew list --versions libyaml || brew install libyaml || brew upgrade libyaml
	brew list --versions logstash || brew install logstash || brew upgrade logstash
	brew list --versions lua || brew install lua || brew upgrade lua
	brew list --versions lzlib || brew install lzlib || brew upgrade lzlib
	brew list --versions macvim || brew install macvim || brew upgrade macvim
	brew list --versions mosquitto || brew install mosquitto || brew upgrade mosquitto
	brew list --versions mpfr || brew install mpfr || brew upgrade mpfr
	brew list --versions mpfr2 || brew install mpfr2 || brew upgrade mpfr2
	brew list --versions nmap || brew install nmap || brew upgrade nmap
	brew list --versions node || brew install node || brew upgrade node
	brew list --versions oniguruma || brew install oniguruma || brew upgrade oniguruma
	brew list --versions openssl || brew install openssl || brew upgrade openssl
	brew list --versions p7zip || brew install p7zip || brew upgrade p7zip
	brew list --versions parallel || brew install parallel || brew upgrade parallel
	brew list --versions pcre || brew install pcre || brew upgrade pcre
	brew list --versions pkg-config || brew install pkg-config || brew upgrade pkg-config
	brew list --versions postgis || brew install postgis || brew upgrade postgis
	brew list --versions postgresql || brew install postgresql || brew upgrade postgresql
	brew list --versions proj || brew install proj || brew upgrade proj
	brew list --versions python || brew install python || brew upgrade python
	brew list --versions python3 || brew install python3 || brew upgrade python3
	brew list --versions readline || brew install readline || brew upgrade readline
	brew list --versions reattach-to-user-namespace || brew install reattach-to-user-namespace || brew upgrade reattach-to-user-namespace
	brew list --versions redis || brew install redis || brew upgrade redis
	brew list --versions sfcgal || brew install sfcgal || brew upgrade sfcgal
	brew list --versions sqlite || brew install sqlite || brew upgrade sqlite
	brew list --versions tmux || brew install tmux || brew upgrade tmux
	brew list --versions watch || brew install watch || brew upgrade watch
	brew list --versions wget || brew install wget || brew upgrade wget
	brew list --versions xz || brew install xz || brew upgrade xz
	brew list --versions zeromq || brew install zeromq || brew upgrade zeromq
