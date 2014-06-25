#!/bin/sh
## This Script is for auto fetch the git repo
## Date: 2013-05-23
## Author: HenryCao
## Version: 1.0
## The origin funtion for the script
## Version :2.0
## update this script with git_push.sh V2.0

#define the variable
TAG=
METHODNUM=$2
REPOCHOOSE=$1
REPODIR=$3

# git command for choose tags for update to certain version
git_variable(){
        echo "Please enter the tag you've already pushed"
        read TAG
}

git_release_certain_version(){
        cd $REPODIR
        git_variable
        git reset --hard
        git fetch
        git reset --merge $TAG
        git log -1
}

# git command for update to the latest version
git_release_latest(){
        cd $REPODIR
        git reset --hard
        git pull
        git log -1
}

#choose the method for deployment
git_choose_method_print(){
        echo "Please choose the method for deployment"
        echo "the choose repo is ${REPO[$REPONUM]}"
        echo "1) auto update to the latest version"
        echo "2) update by tag for the certain version"
        echo "0) cancel the update"
        read METHODNUM
        git_method
}

git_method(){
        case $METHODNUM in
                1)
                        git_release_latest
                        ;;
                2)
                        git_release_certain_version
                        ;;
                0)
                        exit 0
                        ;;
                *)
                        git_choose_method_print
                        ;;
        esac
}

main (){
        git_method
}


main


