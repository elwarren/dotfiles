#!/bin/bash

echo "Creating $HOME/.local/share/fonts"

mkdir -p $HOME/.local/share/fonts

git clone https://github.com/shaunsingh/SFMono-Nerd-Font-Ligaturized.git

mv LigaSFMonoNerdFont-* $HOME/.local/share/fonts/

echo 'install nerdfonts https://github.com/ryanoasis/nerd-fonts'
