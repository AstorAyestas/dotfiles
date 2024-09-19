# My dotfiles

This directory contains the dotfiles for my system

## Requirements

Ensure you have the following installed on your system

### Git
```sh
brew install git
```

### cheatsh
```sh
curl -s https://cht.sh/:cht.sh | sudo tee /usr/local/bin/cht.sh && sudo chmod +x /usr/local/bin/cht.sh
```
### Lazygit
```sh
brew install jesseduffield/lazygit/lazygit
```
### Gum
```sh
brew install gum
```
### Stow
```sh
brew install stow
```

## Installation

First, check out the dotfiles repo in your $HOME directory using git
```sh
$ git clone git@github.com/astorayestas/dotfiles.git
$ cd dotfiles
```
Then use GNU stow to create the symlinks
```sh
$ stow .
```
