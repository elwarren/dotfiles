# dotfiles

dotfiles and handy `~/bin` stuff for clean -osx- installs

## Overview

Migrating my daily driver from MacOS to Linux means making this more crossplatform.

https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html


- App Data `~/.local/share`
- App Config `~/.config`
- App Cache `~/.cache`


## Install

Trying to keep it simple starting with a Makefile, then installing brew, vimrc, zsh and bash dotfiles, a prompt, and finally some misc apps.

```
make help
```

## Apps

### Sessions

- zsh
- bash
- tmux
- iterm profiles

### Editors & Code

- neovim
- vim
- sublimetext
- vscode

### Calendars and Contacts

- khal
- vdirsyncer

## TODO

Migrate this Makefile to Ansible eventually.

