.. image:: https://img.shields.io/badge/platform-GNU/Linux,%20BSD,%20macOS/Darwin-red.svg
    :target: https://pypi.python.org/pypi/envie

.. image:: https://img.shields.io/badge/shell-sh,bash-blue.svg
    :target: https://pypi.python.org/pypi/envie


Minimally acceptable dotfiles
-----------------------------

Features:

- colored bash, colored less, colored vim, sensible pager
- 4 spaces, tab (de-)indent in vim, (un-)comment shortcuts
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


Personalize / private settings
------------------------------
To add private settings, I find convenient to keep "thin" local versions of personalized files and base them on public dotfiles.

This works well for scripts like ``.bashrc`` and ``.vimrc``, for example::

    # load public bashrc base
    source ~/.config/dotfiles/src/.bashrc
    
    # add private stuff
    SECRET_TOKEN=XXX
