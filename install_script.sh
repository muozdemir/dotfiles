#!/usr/bin/env bash

# machine setup script
echo "Setting up daito's :/ machine..."

echo "Step 1/8: Installing Homebrew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update

echo "Step 2/8: Installing mac apps"
brew cask install iterm2 visual-studio-code karabiner-elements spotify evernote synergy

echo "Step 3/8: Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "Step 4/8: Installing terminal apps"
brew install ranger highlight bash-completion tmux

echo "Step 5/8: Cloning zsh-autosuggestions and zsh-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

echo "Step 6/8: Setting up symlinks"
# this'll likely already be cloned to get a hold of this script anyway
# git clone git@github.com:danielharbor/dotfiles.git ~/github
ln -s ~/github/dotfiles/aliases.zsh ~/.oh-my-zsh/custom/aliases.zsh
ln -s ~/github/dotfiles/tmux.conf ~/.tmux.conf

echo "Step 7/8: Cloning vim dotfiles"
git clone git@github.com:danielharbor/vim_dotfiles.git

echo "Step 8/8: Cloning TPM (Tmux Plugin Manager)"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "Setup complete!!! 💪"
echo "Don't forget to add zsh-autosuggestions and zsh-syntax-highlighting to plugins in ~/.zshrc, i.e. plugins=(git zsh-autosuggestions zsh-syntax-highlighting)"
echo "Oh also... launch tmux and install tmux plugins - Ctrl + a I"
