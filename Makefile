all: help

help:
	# make                 : show this help
	# make dirs            : create directories
	# make installdots     : copy dotfiles to homedir
	# make installzsh      : hack to fix pure prompt for zsh
	# make installhomebrew : bootstrap homebrew
	# make installbrews    : install packages with brew
	# make installcasks    : install native osx apps with brew cask
	# make installrvm      : bootstrap rvm
	# make installruby     : install rubies with rvm
	# make installpython   : install python and virtualenv
	# make installgpg      : generate gnupg gpg keys if not exist
	# make installssh      : generate ssh keys if not exist
	# make diff            : diff dotfiles against installed
	# make updaterepo      : append brew list to this file
	# make clean           : cleanup
	true

diff:
	diff home/.zshrc  ~/.zshrc  || true
	diff home/.bashrc ~/.bashrc || true
	diff home/.vimrc  ~/.vimrc  || true

updaterepo:
	cp ~/.zshrc  home/.zshrc
	cp ~/.bashrc home/.bashrc
	cp ~/.vimrc  home/.vimrc  
	cp ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User/Preferences.sublime-settings      home/
	cp ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User/Package\ Control.sublime-settings home/

installdots:
	cp ~/.zshrc  ~/.zshrc.make.backup  && cp home/.zshrc ~/.zshrc
	cp ~/.bashrc ~/.bashrc.make.backup && cp home/.bashrc ~/.bashrc
	cp ~/.vimrc  ~/.vimrc.make.backup  && cp home/.vimrc ~/.vimrc
	cp ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User/Preferences.sublime-settings       ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User/Preferences.sublime-settings.make.backup && cp home/Preferences.sublime-settings      ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User/Preferences.sublime-settings      
	cp ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User/Package\ Control.sublime-settings  ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User/Package\ Control.sublime-settings.make.backup && cp home/Package\ Control.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User/Package\ Control.sublime-settings
	touch ~/.zhistory

clean:
	# cleanup temporary stuff
	rm -rf ./rvm-installer*
	rm -f /tmp/mybrew

dirs:
	mkdir ~/bin         || true
	mkdir ~/Projects    || true
	mkdir ~/work        || true
	mkdir ~/virtualenvs || true
	
installzsh:
	# HACK to fix pure theme, must be done after antigen bundle is installed https://github.com/sindresorhus/pure
	mkdir ~/.zfunctions
	ln -sf ~/.antigen/repos/https-COLON--SLASH--SLASH-github.com-SLASH-sindresorhus-SLASH-pure.git/async.zsh ~/.zfunctions/async
	ln -sf ~/.antigen/repos/https-COLON--SLASH--SLASH-github.com-SLASH-sindresorhus-SLASH-pure.git/pure.zsh ~/.zfunctions/prompt_pure_setup

installgpg: ~/.gnupg
	# setup gpg or skip and install existing files?
	brew install gnupg
	gpg --gen-key

installssh: installgpg ~/.ssh
	# TODO cp ssh keys from some secure location, possibly stored gpg encrypted
	# cp ~/.ssh/config ~/.ssh/config.make.backup
	# cp home/.ssh/config ~/.ssh/config
	# cp ~/.ssh/id_rsa ~/.ssh/id_rsa.make.backup
	# cp ~/.ssh/id_rsa.pub ~/.ssh/id_rsa.pub.make.backup
	ssh-keygen -t rsa -f ~/.ssh/id_rsa

installrvm:
	# needs gpg so run after brew completes
	# http://rvm.io/rvm/security
	# Install mpapis public key (might need `gpg2` and or `sudo`)
	gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
	#
	# Download the installer
	\curl -O https://raw.githubusercontent.com/rvm/rvm/master/binscripts/rvm-installer
	\curl -O https://raw.githubusercontent.com/rvm/rvm/master/binscripts/rvm-installer.asc
	#
	# Verify the installer signature (might need `gpg2`), and if it validates...
	gpg --verify rvm-installer.asc
	#
	# Run the installer
	bash rvm-installer stable

installruby: installrvm
	# use latest ruby-2.3.0
	rvm install ruby
	rvm use ruby
	rvm rubygems latest

installpython: dirs
	# python using ~/virtualenvs
	brew install python3
	brew install python
	brew linkapps python
	pip install --upgrade pip
	pip install virtualenv

installxcode:
	# TODO how to do this?
	# curl xcode maybe
	# after install this acccepts license
	xcode-select --install

installhomebrew:
	# download and run brew installer from http://brew.sh via github
	curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install > /tmp/mybrew
	/usr/bin/ruby /tmp/mybrew && rm -f /tmp/mybrew

generatecasklist:
	brew cask list | awk '{print "\tbrew cask list --versions "$$1}'

generatecaskinstall:
	brew cask list | awk '{print "\tbrew install "$$1}' > bin/homebrew.install.casks
	chmod +x bin/homebrew.install.casks

generatecaskupgrade:
	brew cask list | awk '{print "\tbrew upgrade "$$1}'

installcasks:
	bin/homebrew.install.casks

generatebrewlist:
	brew list | awk '{print "\tbrew list --versions "$$1}'

generatebrewinstall:
	brew list | awk '{print "\tbrew install "$$1}' > bin/homebrew.install.brews
	chmod +x bin/homebrew.install.brews

generatebrewupgrade:
	brew list | awk '{print "\tbrew upgrade "$$1}'

installbrews:
	bin/homebrew.install.brews
