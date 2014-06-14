#!/usr/bin/env bash

##
# Install script copied from @jonotrujillo
# Modified to my needs
##

SKIP_ALL=false
OVERWRITE_ALL=false

LINKABLES=$(find * -name "*.symlink")

for linkable in $LINKABLES; do
  SKIP=false
  OVERWRITE=false

  LINKABLE_NAME="${linkable##*/}"
  TARGET_NAME="${LINKABLE_NAME%.symlink}"

  if [[ $LINKABLE_NAME =~ ".zsh." ]]; then
    TARGET="$HOME/.oh-my-zsh/custom/$TARGET_NAME"
  elif [[ $LINKABLE_NAME =~ ".zsh-theme." ]]; then
    TARGET="$HOME/.oh-my-zsh/custom/$TARGET_NAME"
  else
    TARGET_NAME=".${LINKABLE_NAME%.symlink}"
    TARGET="$HOME/$TARGET_NAME"
  fi

  if [ -e "$TARGET" ] && ! $OVERWRITE_ALL && ! $SKIP_ALL; then
    until $SKIP || $SKIP_ALL || $OVERWRITE || $OVERWRITE_ALL; do
      echo "File already exists: $TARGET. What do you want to do? [s]kip, [S]kip all, [o]verwrite, [O]verwrite all"
      read action
      case $action in
        "s" ) SKIP=true;;
        "S" ) SKIP_ALL=true;;
        "o" ) OVERWRITE=true;;
        "O" ) OVERWRITE_ALL=true;;
        *   ) echo "'$action' is not a valid option. Please try again.";;
      esac
    done
  fi

  if [ -e "$TARGET" ] && ( $OVERWRITE || $OVERWRITE_ALL ); then
    rm -r "$TARGET"
  fi

  if [ ! -e "$TARGET" ]; then
    echo "Symlinking $linkable..."
    ln -s "$PWD/$linkable" "$TARGET"
  fi
done
