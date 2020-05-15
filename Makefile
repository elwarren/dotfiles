# makefile helper to install dotfiles
# TODO this should all be replaced by ansible, especially these brew hacks

all: help

help:
	# make                 : show this help
	# make dirs            : create directories
	# make installdots     : copy dotfiles to homedir
	# make installzsh      : hack to fix pure prompt for zsh
	# make installhomebrew : bootstrap homebrew
	# make installbrews    : install packages with brew
	# make installcasks    : install native osx apps with brew cask
	# make installvimplug  : install vim-plug for neovim
	# make installrvm      : bootstrap rvm
	# make installruby     : install rubies with rvm
	# make installpython   : install python and virtualenv
	# make installgpg      : generate gnupg gpg keys if not exist
	# make installssh      : generate ssh keys if not exist
	# make diff            : diff dotfiles against installed
	# make updaterepo      : append brew list to this file
	# make clean           : cleanup
	@true

diff:
	diff home/dot_zshrc  ~/.zshrc  || true
	diff home/dot_bashrc ~/.bashrc || true
	diff home/dot_bash_profile ~/.bash_profile || true
	diff home/dot_inputrc ~/.inputrc || true
	diff home/dot_tmux.conf ~/.tmux.conf || true
	diff home/dot_vimrc  ~/.vimrc  || true
	diff config/nvim/init.vim ~/.config/nvim/init.vim || true

updaterepo:
	cp ~/.zshrc  home/dot_zshrc
	cp ~/.bashrc home/dot_bashrc
	cp ~/.bash_profile home/dot_bash_profile
	cp ~/.inputrc home/dot_inputrc
	cp ~/.tmux.conf home/dot_tmux.conf
	cp ~/.vimrc  home/dot_vimrc  
	cp ~/.config/nvim/init.vim  config/nvim/init.vim

installdots:
	cp ~/.zshrc  ~/.zshrc.make.backup  || true
	cp home/dot_zshrc ~/.zshrc
	touch ~/.zhistory
	cp ~/.bashrc ~/.bashrc.make.backup || true 
	cp home/dot_bashrc ~/.bashrc
	cp ~/.bash_profile ~/.bash_profile.make.backup || true 
	cp home/dot_bash_profile ~/.bash_profile
	cp ~/.inputrc ~/.inputrc.make.backup || true
	cp home/dot_inputrc ~/.inputrc
	cp ~/.tmux.conf ~/.tmux.conf.make.backup || true
	cp home/dot_tmux.conf ~/.tmux.conf
	cp ~/.vimrc  ~/.vimrc.make.backup  || true 
	cp home/dot_vimrc ~/.vimrc
	mkdir -p ~/.config/nvim
	cp ~/.config/nvim/init.vim ~/.config/nvim/init.vim.make.backup || true
	cp config/nvim/init.vim ~/.config/nvim/init.vim 

installpowerline:
	pip install powerline-status
	# TODO powerline available for tmux, neovim, and others. Copy custom config.json here

installvimplug:
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

installsublime2:
	cp ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User/Preferences.sublime-settings       ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User/Preferences.sublime-settings.make.backup && cp home/dot_references.sublime-settings      ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User/Preferences.sublime-settings      
	cp ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User/Package\ Control.sublime-settings  ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User/Package\ Control.sublime-settings.make.backup && cp home/dot_ackage\ Control.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User/Package\ Control.sublime-settings

installsublime3:
	# TODO  ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/*settings
	# Fix ability to type left paren "(" after installing jedi
	cp ~/work/dotfiles/home/dot_ublime_jedi_python_autocompletion_Default.sublime-keymap.json '/Users/wlindsey/Library/Application Support/Sublime Text 3/Packages/Jedi - Python autocompletion/Default.sublime-keymap'

clean:
	# cleanup temporary stuff
	rm -rf ./rvm-installer*
	rm -f /tmp/mybrew

dirs:
	mkdir -p ~/.config
	mkdir -p ~/.local
	mkdir -p ~/.cache
	mkdir -p ~/bin
	mkdir -p ~/Projects
	mkdir -p ~/work
	mkdir -p ~/virtualenvs
	
installzsh:
	# HACK to fix pure theme, must be done after antigen bundle is installed https://github.com/sindresorhus/pure
	mkdir ~/.zfunctions
	ln -sf ~/.antigen/bundles/sindresorhus/pure/async.zsh ~/.zfunctions/async
	ln -sf ~/.antigen/bundles/sindresorhus/pure/pure.zsh ~/.zfunctions/prompt_pure_setup

installgpg: ~/.gnupg
	# setup gpg or skip and install existing files?
	brew install gnupg
	gpg --gen-key

installssh: installgpg ~/.ssh
	# TODO cp ssh keys from some secure location, possibly stored gpg encrypted
	# cp ~/.ssh/config ~/.ssh/config.make.backup
	# cp home/dot_ssh/config ~/.ssh/config
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
	rvm use ruby-2.3.0
	rvm default ruby-2.3.0
	rvm rubygems latest
	gem install bundle

installpython: dirs
	brew install python3
	# brew link python3
	pip install --upgrade pip

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

generatedockerlist:
	docker images | awk '!/^REPOSITORY/ {print "docker pull "$1}' > bin/docker.pull.images

installdockers:
	bin/docker.pull.images
