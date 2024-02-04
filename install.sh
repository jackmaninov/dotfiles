#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="bashrc zshrc alias.zsh tmux.conf config/nvim/lua/custom "    # list of files/folders to symlink in homedir

git submodule init
git submodule update

# set up vimified in case no neovim
cd vimified
mkdir bundle
mkdir -p tmp/backup tmp/swap tmp/undo
git clone https://github.com/gmarik/vundle.git bundle/vundle
ln -s ../local.vimrc .
ln -s ../extra.vimrc .
cd ..
vim +BundleInstall +qall
chmod -R 755 antigen

# Install NvChad
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
# Install powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git antigen/bundles/robbyrussell/oh-my-zsh/custom/themes/powerlevel10k
##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done
