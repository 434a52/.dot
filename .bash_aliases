#!/bin/bash

alias mi='micro'

alias ls='ls -lhgF --color=auto --group-directories-first'
alias ll='ls -vlAhgF'
alias lf='ls -pv | grep -v /'
alias ld='\ls --color=auto -vhld -- */'

alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias /='cd /'
alias ~='cd ~'

alias md='mkdir -pv'
alias cp='cp -rv'
alias mv='mv -v'

alias cls='clear'

alias path='echo -e ${PATH//:/\\n}'
alias nowt='date +"%T"'
alias nowd='date +"%d-%m-%Y"'
alias nowdt='date +"%d-%m-%Y %T"'

alias df='df -H --total'

alias ports='netstat -tulanp'

alias follow='tail -fn +1'

alias meminfo='free -mlt'
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
