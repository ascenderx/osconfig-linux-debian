#!/usr/bin/env sh

mkdir -p $HOME/.Backups
OLD_IFS=$IFS
IFS=" "

FILES="BashFormat bash_profile bashrc BashUtils dircolors profile vimrc"
for F in $FILES
do
  if [ -e $HOME/.$F ]
  then
    cp -i $HOME/.$F $HOME/.Backups/
  fi
  cp -f $PWD/$F $HOME/.$F
done

SCRIPTDIR="BashScripts"
if [[ -d "$SCRIPTDIR" ]]
then
  rm -rf $SCRIPTDIR
fi
cp -rf $SCRIPTDIR $HOME/.$SCRIPTDIR

IFS=$OLD_IFS
