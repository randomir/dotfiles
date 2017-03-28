# virtualenv helpers
# install with ``sudo pip install --upgrade envie && envie config``

# grep w/ output line length limited (think minimized css/js)
# use: grepl "pattern" len
function grepl() {
    q="$1"
    len="${2:-100}"
    grep -iR "$q" . | expand -t4 | cut -c-$len | grep --color=always "$q"
}

# ip spam status check
# usage: echo "x.x.x.x" | spamhaus-status
function revip { awk -F. '{print $4 "." $3 "." $2 "." $1}'; }
function spamhaus-status {
    local ip
    read ip
    if [ "$(host "$(echo "$ip" | revip).zen.spamhaus.org" | grep 'has address')" ]; then 
        echo "IP $ip is BLOCKED by spamhaus."
    else
        echo "IP $ip is NOT blocked by spamhaus."
    fi
}

# add numbers from stdin, one integer per line
alias sum='paste -sd+ | bc'

# multiply numbers from stdin, one integer per line
alias product='paste -sd* | bc'
