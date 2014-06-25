#!/bin/sh
## Author:HenryCao
## Version 1.0
## Date:2014-04-10
## migrate from HuNan

# include /data/scripts/git_update.sh on git client server

#define the variables
REPOBASE=/data/deployment
REPODIR=
DESTBASE=/opt/wwwroot
#the first parameter here is to define the path
#the second parameter here is to check whether need to run a script after deployment
REPO[1]="domain_1 1"
REPO[2]="domain_2 1"

REALREPO=
UPDATEUNM=
IDCMNGTSERVER=
IDCMNGTSERVERPORT=22
REPONUM=
GITPUSH=
REPOLEN=${#REPO[@]}

#define the web host
HOST[1]=server ip
HOST[2]=server ip
HOST[3]=server ip
HOST[4]=server ip
HOST[5]=server ip
HOST[6]=server ip

#define the host groups by the second parameters of ${REPO[$i]}

##configure list
configure_1(){
        WEB[1]=${HOST[1]}
        WEB[2]=${HOST[2]}
        WEB[3]=${HOST[3]}
        WEB[4]=${HOST[4]}
        WEB[5]=${HOST[5]}
        WEB[6]=${HOST[6]}
        DESTDIR=$DESTBASE/$REALREPO
        PRECOMMAND=
        POSTCOMMAND="chown -R nginx:nginx $DESTDIR"
}

get_configure(){
        case $GETCONFIGURENUM in
                1)
                        configure_1
                        ;;
                *)
                        echo "get configure error"
        esac
}

METHODNUM=

#choose the git repo you want to push
choose_repo_print(){
        echo -e "\nPlease choose the repo you want to push\n"
        for i in $(seq $REPOLEN)
                do
                echo $i\) `echo ${REPO[$i]} | awk -F " " '{print $1}'`
        done
        echo -e "exit) exit the program\n"
        read REPONUM
        choose_repo_choice
}

choose_repo_choice(){
        REALREPO=`echo ${REPO[$REPONUM]} | awk -F " " '{print $1}'`
        case $REPONUM in
                [1-9])
                        REPODIR=$REPOBASE/$REALREPO
                        echo "Your git repo is @ $REPODIR"
                        ;;
                [1-9][0-9])
                        REPODIR=$REPOBASE/$REALREPO
                        echo "Your git repo is @ $REPODIR"
                        ;;
                exit)
                        exit 0
                        ;;
                *)
                        choose_repo_print
                        ;;
        esac
}

#use git to commit, tag & push to the git server
git_push_print(){
        echo -e "\nWould you like to skip the git commit stage? It's used for roll back or quick deployment\n"
        echo "1) Yes,I need to commit the repo"
        echo "2) No, I want to have a quick release"
        echo "3) I want to exit the program"
        read GITPUSH
        git_push
}


git_push(){
        case $GITPUSH in
                1)
                        git_command
                        choose_update_print
                        ;;
                2)
                        choose_update_print
                        ;;
                3)
                        exit 0
                        ;;
                *)
                        git_push_print
                        ;;
        esac
}

check_empty_folder(){
        for i in `find $REPODIR/* -type d -empty`
                do
                echo $i
                touch $i/index.html
        done
}

git_command(){
        check_empty_folder
        if [ -d "$REPODIR" ]
                then
                git_commit
        else
                echo -e "\nthe program has met a problem, please check the git repo directory @ $REPODIR \n"
        fi
}

git_commit(){
        cd $REPODIR
        git status
        git add .
        echo -e "\nPlease input the comment like update for XXX activie"
        read COMMIT
        git commit -am "$COMMIT"
        echo -e "\nPlease input the tag like admin_gamegg_2012_10_11"
        read TAG
        git tag $TAG
        git push origin master --tags
}

#choose whether you want to update the production immediately
choose_update_print(){
        echo -e "What do you want to do the following\n"
        echo "1) update the production immediately"
        echo "2) I'll update the production lately"
        echo "0) exit the program"
        read UPDATENUM
        choose_update
}

git_choose_method_print(){
        echo "Please choose the method for deployment"
        echo "the choose repo is $REALREPO"
        echo "1) auto update to the latest version"
        echo "2) update by tag for the certain version"
        echo "0) cancel the update"
        read METHODNUM
}

deployment(){
        GETCONFIGURENUM=`echo ${REPO[$REPONUM]} | awk -F " " '{print $2}'`
        get_configure
        WEBLEN=${#WEB[@]}
        for i in $(seq $WEBLEN)
                do
                echo -e "\ndeploying on ${WEB[$i]} now\n"
                if [[ -z $PRECOMMAND ]]
                        then
                        echo -e "\n no such pre command\n"
                else
                        echo -e "\nrunning pre command now\n"
                        ssh -l root ${WEB[$i]} "$PRECOMMAND"
                fi
                ssh -l root ${WEB[$i]} "sh /data/scripts/git_update.sh $REALREPO $METHODNUM $DESTDIR"
                if [[ -z $POSTCOMMAND ]]
                        then
                        echo -e "\nno such post command\n"
                else
                        echo -e "\nrunning post command now"
                        ssh -l root ${WEB[$i]} "$POSTCOMMAND"
                fi
        done
}

choose_update(){
        case $UPDATENUM in
                1)
                        git_choose_method_print
                        deployment
                        ;;
                2)
                        echo -e "\nyou've finished the program, please update the production later\n"
                        ;;
                0)
                        exit 0
                        ;;
                *)
                        choose_update_print
                        ;;
        esac
}


main(){
        echo -e "\nWelcome to use this tool\n"
        echo "This tool is for auto push the repos to the repo server"
        echo -e "Please ensure you have already merge the repo mannully\n"
        choose_repo_print
        git_push_print
}

main

