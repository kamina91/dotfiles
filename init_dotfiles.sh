#!/bin/sh

# current dir
cd $(dirname $0)

# download neobundle files
if [ -e ~/dotfiles/vimfiles/bundle/neobundle.vim ]; then
    echo "neobundle found"
    is_existed=true
else
    echo "install neobundle"
    mkdir -p ~/dotfiles/vimfiles/bundle/
    git clone https://github.com/Shougo/neobundle.vim ~/dotfiles/vimfiles/bundle/neobundle.vim

    is_existed=false
    # update vim plugins
    # git submodule init
    # git submodule foreach 'git pull origin master'
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

if [ -e ~/.vim ]; then
    echo ".vim found. rename .vim dir"
else
    ln -vFis ~/dotfiles/vimfiles ~/.vim;
fi

if [ "${is_existed}" == true ]; then
    echo "running NeoBundleUpdate...\n"
    vim -u ~/.vimrc -i NONE -c "try | NeoBundleUpdate! | finally | q! | endtry" -e -s -V1
else
    echo "running NeoBundleInstall...\n"
    vim -u ~/.vimrc -i NONE -c "try | NeoBundleInstall! | finally | q! | endtry" -e -s -V1
fi
echo "\ncompleted!"

# 2-factor authentication
case "${OSTYPE}" in
    darwin*)
        echo "change origin url to https"
        git remote set-url origin https://github.com/kamina91/dotfiles.git
        ;;
    linux*)
        echo "change origin url to git protocol"
        git remote set-url origin git@github.com:kamina91/dotfiles.git
        ;;
esac
