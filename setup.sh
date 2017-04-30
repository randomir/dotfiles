#!/bin/bash

usage() {
    echo "Install dotfiles in user's HOME."
    echo
    echo "Usage:"
    echo "    setup.sh [--no-backup] [--copy|--symlink] [--srcdir=DIR] [--destdir=DIR] [--help]"
    echo
    echo "Source & docs:"
    echo "    https://github.com/randomir/dotfiles"
    echo
    exit 255
}

# Defaults: symlink dotfiles from the directory that contains `setup.sh`
# to user's home, backup here under `backup` dir.
basedir=$(readlink -e "$(dirname "$0")")
srcdir="$basedir/src/"
backupdir="$basedir/backup/$(date -Is)"
destdir="$HOME"
backup=1
method=symlink

while (( $# )); do
    case "$1" in
        --srcdir=*)
            srcdir="${1##--srcdir=}"
            shift;;
        --destdir=*)
            destdir="${1##--destdir=}"
            shift;;
        --no-backup)
            backup=0
            shift;;
        --copy)
            method=copy
            shift;;
        --symlink)
            method=symlink
            shift;;
        -h|--help)
            usage;;
        *)
            echo "Unrecognized param '$1'."
            usage;;
    esac
done

if [ ! -d "$srcdir" ]; then
    echo "Source directory not found: $srcdir"
    exit 1
else
    srcdir=$(readlink -f "$srcdir")
fi

if [ ! -d "$destdir" ]; then
    echo "Destination directory not found: $destdir"
    exit 1
else
    destdir=$(readlink -f "$destdir")
fi

# Display config and prompt user to proceed
echo "Installing dotfiles:"
echo " - from: $srcdir"
echo " - to: $destdir"
echo " - method: $method"
if (( backup )); then
    echo " - backup original files to: $backupdir"
else
    echo " - don't backup original files"
fi
echo
read -p "Proceed [Y/n]? " ans
case "${ans:-y}" in
    Y|y);;
    *) exit 2
esac

(( backup )) && { mkdir -p "$backupdir" || exit 3; }
for dotfile in $(find "$srcdir" -maxdepth 1 -type f -name '.*'); do
    echo "Processing: $dotfile"
    filename=$(basename "$dotfile")
    usrfile="$destdir/$filename"
    if (( backup )) && [ -f "$usrfile" ]; then
        cp -aL "$usrfile" "$backupdir"
    fi
    if [ "$method" == "copy" ]; then
        cp -af "$dotfile" "$destdir"
    elif [ "$method" == "symlink" ]; then
        ln -sf -t "$destdir" $(readlink -f "$dotfile")
    fi
done
echo "Done."
