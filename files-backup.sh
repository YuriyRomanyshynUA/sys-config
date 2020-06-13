#!/bin/bash


if [ ! -d ~/Dropbox ]
then
    mkdir ~/Dropbox;
    if [ ! -d ~/Dropbox/backup]
    then
	mkdir ~/Dropbox;
    fi
fi


if [ -d ~/Documents/org ]
then
    tar -cf ~/Documents/org-backup.tar ~/Documents/org/*;
    gzip ~/Documents/org-backup.tar;
    rm -rf ~/Dropbox/backups/org-backup.tar.gz;
    mv ~/Documents/org-backup.tar.gz ~/Dropbox/backup/;
else
    mkdir ~/Documents/org;
fi


if [ -d ~/Documents/books ]
then
    tar -cf ~/Documents/books-backup.tar ~/Documents/books/*;
    gzip ~/Documents/books-backup.tar;
    rm -rf ~/Dropbox/backups/books-backup.tar.gz;
    mv ~/Documents/books-backup.tar.gz ~/Dropbox/backup/;
else
    mkdir ~/Documents/books;
fi


# if [ -d ~/Downloads/os-iso ]
# then
#     tar -cf ~/Downloads/os-iso.tar ~/Downloads/os-iso/*;
#     gzip ~/Downloads/os-iso.tar;
#     rm -rf ~/Dropbox/backups/os-iso.tar;
#     mv ~/Downloads/os-iso.tar.gz ~/Dropbox/backup/;
# fi


# DROPBOX_RUNNING=$(dropbox running);

if dropbox running;
then
    echo "Starting dropbox ...";
    dropbox start -i;
fi



