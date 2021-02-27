#!/bin/bash

alias ls='ls -lhgF --color=auto --group-directories-first'
alias ll='ls -vlAhgF'

alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'

alias mkdir='mkdir -pv'
alias cp='cp -rv'
alias mv='mv -v'

alias cls='clear'

alias path='echo -e ${PATH//:/\\n}'
alias nowt='date +"%T"'
alias nowd='date +"%d-%m-%Y"'
alias nowdt='date +"%d-%m-%Y %T"'

alias df='df -H --total'

alias ports='netstat -tulanp'

alias ipt='sudo /sbin/iptables'
alias iptlist='sudo /sbin/iptables -L -n -v --line-numbers'
alias iptlistin='sudo /sbin/iptables -L INPUT -n -v --line-numbers'
alias iptlistout='sudo /sbin/iptables -L OUTPUT -n -v --line-numbers'
alias iptlistfw='sudo /sbin/iptables -L FORWARD -n -v --line-numbers'

alias meminfo='free -m -l -t'
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'
alias cpuinfo='lscpu'

alias sysd='sudo systemctl'
alias reload='sudo systemctl reload'
alias restart='sudo systemctl restart'
alias status='sudo systemctl status'

alias reboot='sudo reboot'
