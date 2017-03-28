alias untar='tar -xzf '

# vim in less mode with vless
alias vless='vim -u /usr/share/vim/vim74/macros/less.vim'

alias wcl='wc -l'
alias pp='python -m json.tool'

alias nmapsafe='sudo nmap -A -v -p- --script=safe'
alias nmapdef='sudo nmap -A -v -p- --script=safe,default,discovery,external,auth'

alias sshsocks='ssh -D 58080'
alias sshproxy='~/bin/sshuttle 0/0 --dns -v -r'

alias apt_recurse_only_deps='apt-cache --recurse --no-pre-depends --no-suggests --no-recommends  --no-conflicts --no-breaks --no-replaces --no-enhances'
alias apt-depends='apt_recurse_only_deps depends'
alias apt-rdepends='apt_recurse_only_deps rdepends'

alias sum='paste -sd+ | bc'
alias product='paste -sd* | bc'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Set primary X selection.
# Use it like ``pwd | xcopy``, then paste with ``Shift+Ins`` (or middle click).
alias xcopy='tr -d "\n" | xclip -selection primary'

# Copy to X clipboard
# Use it like ``pwd | copy``, paste with ``Ctrl+Shift+V`` in terminal, or ``Ctrl+V`` in GUI.
alias ccopy='tr -d "\n" | xclip -selection clipboard'

# Set to primary X selection AND copy to clipboard
alias copy='tr -d "\n" | xclip -sel p && xclip -sel p -o | xclip -sel clip'
