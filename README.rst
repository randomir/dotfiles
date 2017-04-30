Minimally acceptable dotfiles
-----------------------------

Features:

- colored bash, colored less, colored vim, sensible pager
- 4 spaces, tab (de-)indent in vim, (un-)comment shortcut
- ctrl+del/backspace to kill word in readline, case-insensitive completion
- metric units, utf-8 locale
- python history, tab completion
- few git aliases, meld merge, vim edit, color diff


Setup
-----
Clone this repo from GitHub (or, fork it first) and run ``setup.sh`` to symlink/copy dotfiles.

::

    git clone https://github.com/randomir/dotfiles.git ~/.config/dotfiles
    ~/.config/dotfiles/setup.sh

Setup script usage::

    setup.sh [--no-backup] [--copy|--symlink] [--srcdir=DIR] [--destdir=DIR] [--help]

Copy (or symlink) dotfiles from a specified source directory (defaults
to the script directory), to a specified destination directory (defaults
to user's $HOME).
Before setting dot files in place, backup all user files that would be
overwritten (by default; optionally, backup can be turned off). The
backup is in ``<repo dir>/backup/<iso datetime>``.

The setup summarizes selected options and asks for confirmation before starting.
