function proml {
  local        BLUE="\[\033[0;34m\]"
  local  LIGHT_BLUE="\[\033[1;34m\]"
  local         RED="\[\033[1;31m\]"
  local   LIGHT_RED="\[\033[1;33m\]"
  local       GREEN="\[\033[0;32m\]"
  local LIGHT_GREEN="\[\033[1;32m\]"
  local       WHITE="\[\033[1;37m\]"
  local  LIGHT_GRAY="\[\033[0;37m\]"
  local      PURPLE="\[\033[0;35m\]"
  local      CYAN="\[\033[0;36m\]"

  case $TERM in
    xterm*)
    TITLEBAR='\[\033]0;AlexRussellSaw:\w\007\]'
    ;;
    *)
    TITLEBAR=""
    ;;
  esac

#PS1="${TITLEBAR} \033[46m ALEX\033[0;00m${CYAN}▶"

PS1="${TITLEBAR}\
$LIGHT_BLUE╔[${CYAN}AlexRussellSaw$LIGHT_BLUE]═[$CYAN\t$LIGHT_BLUE]
$LIGHT_BLUE╚═[${LIGHT_RED}Switch06\w$LIGHT_BLUE//:\[\033[0;00m\] "
PS2='> '
PS4='+ '
}

proml

if [ -f .switchalias ] ; then
    . .switchalias
fi
PATH=$PATH:/usr/bin/sublime

alias leaderboard='cat people_to_kill.txt | sort | uniq -c | sort -n |tac'
alias please='sudo'
alias fucking='sudo'
alias vim='sudo vim'
alias sshunmount='fusermount -u servers/'
alias raspberrypi='ssh pi@192.168.1.89'
alias cdpbd='cd /var/www/pbd/'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -lF'
alias ls='ls --color=auto'
alias m='ssh -t monitor tmux attach -t alex'
alias s='ssh -t salient tmux attach -t alex'
alias intellij='bash /home/alex/idea-IC-123.169/bin/idea.sh'
alias :q!='sl -e' 
alias cowtime='while true; do date | cowsay | toilet -t --gay ; sleep 1 ; clear ; done'
alias ZZ='alert "you moron."'
alias screenlandscape='sudo xrandr --output HDMI-0 --mode 1920x1080 --rotate normal --pos 1920x600'
alias screenportrait='sudo xrandr --output HDMI-0 --mode 1920x1080 --rotate left --pos 1920x-600'
alias screenz='xrandr --output VGA-0 --mode 1920x1080 --left-of HDMI-0 ; xrandr --output HDMI-0 --mode 1920x1080 --right-of VGA-0; xrandr --dpi 70'
alias testawconfig='Xephyr -ac -br -noreset -screen 800x600 :1 & sleep 2 ; DISPLAY=:1.0 awesome -c rc.lua'
alias awesomerc='sudo vim /etc/xdg/awesome/rc.lua'
alias awesometheme='sudo vim /usr/share/awesome/themes/default/theme.lua'
alias keyboarduk='setxkbmap -layout gb'
alias keyboardus='setxkbmap -layout us'
alias image='eog'

export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64
