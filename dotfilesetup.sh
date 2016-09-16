#!/usr/bin/env bash
# -------------------------------------------------------------------------- #
# This script creates symlinks from the home directory to any desired        #
# dotfiles in ~/dotfiles                                                     #
# -------------------------------------------------------------------------- #

# variables
dir=~/dotfiles                  # dotfiles directory
olddir=~/dotfiles_old           # old dotfiles backup directory
files=("vimrc" "vim/colors" "vim/spell") # list of files/folders to symlink in homedir
vundledir=~/.vim/bundle/Vundle.vim # Vundle directory


# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
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
for file in ${files[@]}; do
    # check if the old files are already set links or normal files
    if [ -L ~/.$file ]; then
      echo "$file is a link:"
      read -p "Sure you want to overwrite symlink? " -n 1 -r
      if [[ $REPLY =~ ^[Yy]$ ]]; then
        rm ~/.$file
      else
        echo "Please check your symlinks than rerun the script."
        exit 1
      fi
    elif [ -f ~/.$file ]; then
      echo "$file is a normal file:"
      echo -n "move the file to $olddir ..."
      mv ~/.$file ~/dotfiles_old/$file
      echo "done"
    fi

    echo -en "\nCreating symlink to $file in home directory ..."
    ln -s $dir/$file ~/.$file
    echo "done"
done

# install Vundle plugins declared in vimrc
echo -n "Install plugins with Vundle ..."
vim +PluginInstall +qall
echo "done"
