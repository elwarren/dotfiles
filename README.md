# dotfiles

dotfiles and handy ~/bin stuff for clean osx installs

## Makefile

Trying to keep it simple starting with a Makefile, then installing brew, vimrc, zsh and bash dotfiles, a prompt, and finally some misc apps.

#### help

Show list of make targets.

#### diff

Diff repo dotfiles against installed dotfiles.

#### updaterepo

Copy current ~ dotfiles into repo.

#### install

Copy repo dotfiles into ~.

#### clean

Remove install leftovers.

#### dirs

Create basic dirs if they don't exist:

* ~/bin
* ~/work
* ~/Projects
* ~/virtualenv

#### installzsh

One time symlink hack to fix pure prompt install after antigen bundle.

#### installhomebrew

Bootstrap homebrew from brew.sh

#### installbrews

Install tools.

#### installcasks

Install native osx apps when possible.

#### generatebrewinstall

Generate script to install brews matching current system.

#### generatecaskinstall

Generate script to install casks matching current system.

#### installgpg

Bootstrap gnupg if it doesn't exist.  For rvm and yum.

Should eventually copy files from some secured encrypted storage like github or owncloud.

#### installssh

Bootstrap ssh key if it doesn't exist.  For new machines.

Should eventually copy files from some secured encrypted storage like github or owncloud.

#### installrvm

Bootstrap rvm from rvm.io

#### installruby

Use rvm to install some ruby.

#### installpython

Bootstrap python 2.7, python 3, and virtualenv.

#### installxcode

TODO Xcode is a prereq but not sure how to automate this install.

