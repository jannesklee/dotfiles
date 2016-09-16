#!/bin/bash
# -------------------------------------------------------------------------- #
# .make.sh                                                                   #
# This script creates symlinks from the home directory to any desired        #
# dotfiles in ~/dotfiles                                                     #
# -------------------------------------------------------------------------- #

# variables
dir=~/dotfiles                  # dotfiles directory
olddir=~/dotfiles_old           # old dotfiles backup directory
files="vimrc"                   # list of files/folders to symlink in homedir
vundledir=~/.vim/bundle/Vundle.vim # Vundle directory



# create dotfiles_old in homedir echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"
# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# Clone Vundle for vi
echo -n "Clone Vundle if it is not already installed ..."
if [ ! -d "$vundledir" ]; then
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  echo " Vundle cloned"
else
  echo " Vundle is already installed. Nothing to do."
fi

# move any existing dotfiles in homedir to dotfiles_old directory,
# then create symlinks from the homedir to any files in the ~/dotfiles
# directory specified in $files
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

# install Vundle plugins declared in vimrc
echo -n "Install plugins with Vundle ..."
vim +PluginInstall +qall
echo "done"
