#!/bin/sh

# Install mac things that I always use.

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install caskroom/cask/brew-cask

brew install watch wget irssi rbenv ruby-build gpg-agent mutt tmux pwgen elinks hub macvim pass ag rust nodejs elixir nmap duck htop hub libxml2 fortune

brew install kore go exercism

brew cask install virtualbox google-chrome vagrant chefdk iterm2 sublime-text

brew install docker docker-machine docker-compose

brew tap homebrew/binary && brew install packer

# Install mac AWS CLI tools
brew install python
pip install awscli powerline-status cryptography
