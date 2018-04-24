#!/bin/bash
#set -x

# Design based on
# 1. https://stackoverflow.com/questions/1064636/showing-perforce-changelists-submitted-since-last-sync
# 2. https://stackoverflow.com/questions/47007/determining-the-last-changelist-synced-to-in-perforce
# 3. https://stackoverflow.com/questions/29642102/how-to-make-awk-ignore-the-field-delimiter-inside-double-quotes
# 4. https://unix.stackexchange.com/questions/124407/what-color-codes-can-i-use-in-my-ps1-prompt

function usage {
    cat <<EOM
Usage: $(basename "$0") [OPTION]...

  -l          Show change summary
  -h          display help
EOM
    exit 2
}

while getopts "lh" argv
do
    case $argv in
        l)
            show_sumry="-l"
            ;;
        h)
            usage
            exit
            ;;
    esac
done

# Get the client root
p4root=`p4 client -o | grep Root: | awk -F ' ' '{print $2}'`

# Get last synced CL
localcl=`p4 cstat ${p4root}/...#have | grep change | awk '$3 > x { x = $3 };END { print x }'`

# Call p4 changes and post process output
p4 changes ${show_sumry} ${p4root}/... | awk -F ' ' -v localcl="${localcl}" \
'{
    line=$0
    # Consume valid fields and put results in b array
    while(match($0,/('\''[^'\'']+'\''|[^ ]+)/,a))
    {
        $0=substr($0,RSTART+RLENGTH);b[++x]=a[0]
    }
    # If the line is summary, print it in git style
    if(b[1] == "Change")
    {
        cll=b[2]; date=b[4]; author=b[6]; mesg=b[7];
        if(cll == localcl) {marker="\033[33m (Current)\033[0m"}
        print "\033[0;31m" cll "\033[0m" " - "  mesg "\033[0;32m" "(" date ")" "\033[0;34m" " <" author ">" marker "\033[0m"
        marker=""
    } else {
        print line
    }
    delete b
    x=0
 }
'
