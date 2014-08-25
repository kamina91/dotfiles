#!/bin/sh

# current dir
cd $(dirname $0)

# download neobundle files
if [ -e ~/dotfiles/vimfiles/bundle/neobundle.vim ]; then
    echo "neobundle found"
else
    echo "install neobundle"
    git clone git://github.com/Shougo/neobundle.vim ~/dotfiles/vimfiles/bundle/neobundle.vim
fi

# make symlink
for dotfiles in .?*; do
    case $dotfiles in 
        ..)
            continue;;
        .git)
            continue;;
        *)
            ln -Fis "$PWD/$dotfiles" $HOME;;
    esac
done
ln -Fis ~/dotfiles/vimfiles ~/.vim

# update vim plugins
git submodule init
git submodule foreach 'git pull origin master'

