#! /bin/zsh
# ~/.zshrc file for zsh non-login shells.
# see /usr/share/doc/zsh/examples/zshrc for examples
setopt autocd              # change directory just by typing its name
#setopt correct            # auto correct mistakes
setopt interactivecomments # allow comments in interactive mode
setopt ksharrays           # arrays start at 0
setopt magicequalsubst     # enable filename expansion for arguments of the form ‘anything=expression’
setopt nonomatch           # hide error message if there is no match for the pattern
setopt notify              # report the status of background jobs immediately
setopt numericglobsort     # sort filenames numerically when it makes sense
setopt promptsubst         # enable command substitution in prompt
WORDCHARS=${WORDCHARS//\/} # Don't consider certain characters part of the word
# hide EOL sign ('%')
export PROMPT_EOL_MARK=""
# configure key keybindings
bindkey -e                                        # emacs key bindings
bindkey ' ' magic-space                           # do history expansion on space
bindkey '^[[3;5~' kill-word                       # ctrl + Supr
bindkey '^[[1;5C' forward-word                    # ctrl + ->
bindkey '^[[C' forward-word                       # ctrl + ->
bindkey '^[[1;5D' backward-word                   # ctrl + <-
bindkey '^[[D' backward-word                      # ctrl + <-
bindkey '^[[5~' beginning-of-buffer-or-history    # page up
bindkey '^[[6~' end-of-buffer-or-history          # page down
bindkey '^[[Z' undo                               # shift + tab undo last action
# enable completion features
autoload -Uz compinit
compinit -d ~/.cache/zcompdump
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # case insensitive tab completion
# History configurations
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=2000
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
#setopt share_history         # share command history data
# force zsh to show the complete history
alias history="history 0"
# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi
# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac
# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi
if [ "$color_prompt" = yes ]; then
    PROMPT=$'%F{%(#.blue.green)}┌──${debian_chroot:+($debian_chroot)──}(%B%F{%(#.red.blue)}%n%(#.ð.㉿)%m%b%F{%(#.blue.green)})-[%B%F{reset}%(6~.%-1~/…/%4~.%5~)%b%F{%(#.blue.green)}]\n└─%B%(#.%F{red}#.%F{blue}$)%b%F{reset} '
    RPROMPT=$'%(?.. %? %F{red}%B⨯%b%F{reset})%(1j. %j %F{yellow}%B⚙%b%F{reset}.)'
    # enable syntax-highlighting
    if [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && [ "$color_prompt" = yes ]; then
	# ksharrays breaks the plugin. This is fixed now but let's disable it in the
	# meantime.
	# https://github.com/zsh-users/zsh-syntax-highlighting/pull/689
	unsetopt ksharrays
	. /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
	ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
	ZSH_HIGHLIGHT_STYLES[default]=none
	ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=red,bold
	ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=cyan,bold
	ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=green,underline
	ZSH_HIGHLIGHT_STYLES[global-alias]=fg=magenta
	ZSH_HIGHLIGHT_STYLES[precommand]=fg=green,underline
	ZSH_HIGHLIGHT_STYLES[commandseparator]=fg=blue,bold
	ZSH_HIGHLIGHT_STYLES[autodirectory]=fg=green,underline
	ZSH_HIGHLIGHT_STYLES[path]=underline
	ZSH_HIGHLIGHT_STYLES[path_pathseparator]=
	ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]=
	ZSH_HIGHLIGHT_STYLES[globbing]=fg=blue,bold
	ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=blue,bold
	ZSH_HIGHLIGHT_STYLES[command-substitution]=none
	ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]=fg=magenta
	ZSH_HIGHLIGHT_STYLES[process-substitution]=none
	ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]=fg=magenta
	ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=magenta
	ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=magenta
	ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
	ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]=fg=blue,bold
	ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=yellow
	ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=yellow
	ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]=fg=yellow
	ZSH_HIGHLIGHT_STYLES[rc-quote]=fg=magenta
	ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=magenta
	ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=magenta
	ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]=fg=magenta
	ZSH_HIGHLIGHT_STYLES[assign]=none
	ZSH_HIGHLIGHT_STYLES[redirection]=fg=blue,bold
	ZSH_HIGHLIGHT_STYLES[comment]=fg=black,bold
	ZSH_HIGHLIGHT_STYLES[named-fd]=none
	ZSH_HIGHLIGHT_STYLES[numeric-fd]=none
	ZSH_HIGHLIGHT_STYLES[arg0]=fg=green
	ZSH_HIGHLIGHT_STYLES[bracket-error]=fg=red,bold
	ZSH_HIGHLIGHT_STYLES[bracket-level-1]=fg=blue,bold
	ZSH_HIGHLIGHT_STYLES[bracket-level-2]=fg=green,bold
	ZSH_HIGHLIGHT_STYLES[bracket-level-3]=fg=magenta,bold
	ZSH_HIGHLIGHT_STYLES[bracket-level-4]=fg=yellow,bold
	ZSH_HIGHLIGHT_STYLES[bracket-level-5]=fg=cyan,bold
	ZSH_HIGHLIGHT_STYLES[cursor-matchingbracket]=standout
    fi
else
    PROMPT='${debian_chroot:+($debian_chroot)}%n@%m:%~%# '
fi
unset color_prompt force_color_prompt
# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    TERM_TITLE='\e]0;${debian_chroot:+($debian_chroot)}%n@%m: %~\a'
    ;;
*)
    ;;
esac
new_line_before_prompt=yes
precmd() {
    # Print the previously configured title
    print -Pn "$TERM_TITLE"
    # Print a new line before the prompt, but only if it is not the first line
    if [ "$new_line_before_prompt" = yes ]; then
	if [ -z "$_NEW_LINE_BEFORE_PROMPT" ]; then
	    _NEW_LINE_BEFORE_PROMPT=1
	else
	    print ""
	fi
    fi
}
# enable color support of ls, less and man, and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias diff='diff --color=auto'
    alias ip='ip --color=auto'
    export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
    export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
    export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
    export LESS_TERMCAP_so=$'\E[01;33m'    # begin reverse video
    export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
    export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
    export LESS_TERMCAP_ue=$'\E[0m'        # reset underline
    # Take advantage of $LS_COLORS for completion as well
    zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
fi
# some more ls aliases
alias ls='ls -h --color=auto'
alias ll='ls -al'
alias la='ls -A'
alias l='ls -CF'
# enable auto-suggestions based on the history
if [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    . /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    # change suggestion color
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#999'
fi

:<<EOF
export ZSH="/home/kali/.oh-my-zsh"
export ZSH_THEME="ys"
fpath=(/usr/share/zsh-completions/src $fpath)
source $ZSH/oh-my-zsh.sh

plugins=(git msfvenom zsh-autosuggestions zsh-completions zsh-syntax-highlighting)
EOF




################## Alias ####################
alias tg="Telegram"
alias telegram="Telegram"
alias py="echo python3 is default python version in py command which created by alias;echo;python3"
alias python="echo python3 is default python version in python command which created by alias;echo;python3"
alias py3="python3 "
alias py2="python2 "
alias mv="mv -i "
alias nmap='sudo nmap '
alias rustscan="sudo rustscan --ulimit 5000 "
alias apt="sudo apt "
alias netdiscover="sudo netdiscover"
alias unexport="unset"
alias unport="unset"
alias rm="rm -i -r"
alias md="mkdir"
alias arpspoof="sudo arpspoof"
alias wireshark="sudo wireshark"
alias arp-scan="sudo arp-scan"
alias vim="nvim"
alias vi="nvim"
alias burp=' export userCurrent=`pwd` ; cd /home/kali/burp/ ; /usr/lib/jvm/java-11-openjdk-amd64/bin/java --illegal-access=permit -Dfile.encoding=utf-8 -javaagent:BurpSuiteLoader.jar -noverify -jar burpsuite_pro.jar ; cd $userCurrent'
alias phpstorm='/home/kali/PHPstorm/bin/phpstorm.sh'
alias rubymine="/home/kali/RubyMine/bin/rubymine.sh"
alias webstorm="/home/kali/WebStorm/bin/webstorm.sh"
alias msf="msfconsole"
alias msfp="msfvenom -l payload"
alias greponly="grep -o --color=auto" 
alias chrome="chromium"
alias docker="sudo docker"
alias cs="cd ~/CobaltStrike ;/bin/zsh ~/CobaltStrike/start.sh ; cd ~"
alias ida="cd ~/ida_pro ;wine ida.exe ;cd ~"
alias ida64="cd ~/ida_pro ;wine64 ida64.exe ;cd ~ "
alias openvpn="sudo openvpn"
alias desk="cd ~/Desktop/"
alias home="cd ~"
alias storage="cd ~/Storage"
alias something="cd ~/SomethingsTrashBin"
alias historyTop10="history|awk '{print \$2}'|sort | uniq -c |sort -nr |head -n 10"
alias tmpnote="vim"
alias explorer="dolphin"
alias waf="wafw00f"


################ Function ###############


git-tool(){
	git add .
	git commit -m "$1"
	git push
}


diskspace(){
	df -h
}

backup_zshrc(){
        cp .zshrc zshrc_backup && echo "update profile complete"
}

recover_zshrc(){
        cp ~/zshrc_backup ~/.zshrc && echo "recover profile complete"
}

export clash="192.168.31.25"
export portOfClash=7890
export portOfClash1=7891

proxys(){
        case "$1" in
		h)
			echo "                                    "
			echo "==============usage================="
			echo "proxys [command] [params]"
			echo "=============command================"
			echo "proxy proxy_ip	import ip temply"
			echo "loc		import localhost "
			echo "on		open the cli proxy"
			echo "off		close the proxy"
			echo "*			show proxy & help"
			echo "h/help		show help"
			echo "===================================="
			;;
		proxy)
			export clash="$2"
			$0 on
			;;
		loc)
			export clash="127.0.0.1"
			$0 on
			;;
                on)
			export https_proxy=http://$clash:$portOfClash http_proxy=http://$clash:$portOfClash all_proxy=socks5://$clash:$portOfClash1 && echo 'export clash complete' && $0 show
                        ;;
                off)
			unset https_proxy http_proxy all_proxy && echo 'unset clash complete'
                        ;;
		help)
			proxys h
			;;
                *)
			export|grep proxy
                        ;;
        esac
}

clash(){
	case "$1" in
		h)
			echo "                                    "
			echo "===================================="
			echo "clash [command] [params]"
			echo "===================================="
			echo "on	open clash services"
			echo "off	close clash services"
			echo "gui	open clash dashbroad"
			echo "update	get online profile"
			echo "h/help	get help"
			echo "ctl	export clash cli proxy"
			echo "*		show status "
			echo "===================================="
			echo ""
			;;
		help)
			clash h
			;;
		on)
			systemctl start clash@kali
			;;
		off)
			systemctl stop clash@kali
			;;
		gui)
			chromium clash.razord.top
			;;
		ctl)
			proxys proxy 127.0.0.1
			;;
		update)
			wget -O /home/kali/clash/config.yaml "https://sub.ppbox.xyz/link/pk0ELrJnWve0Ipz4?clash=1"
			;;
		*)
			systemctl status clash@kali
			;;
		esac
}


export PAGERS="most"
export burp_proxy="127.0.0.1:8080"

export GOROOT=/usr/local/go
export PATH=$PATH:$GOROOT/bin
export GOMODCACHE="$HOME/go/pkg/mod"
export GOBIN="$GOROOT/bin"

:<<EOF_GOENV
GO111MODULE=""
GOARCH="amd64"
GOBIN=""
GOCACHE="/home/kali/.cache/go-build"
GOENV="/home/kali/.config/go/env"
GOEXE=""
GOEXPERIMENT=""
GOFLAGS=""
GOHOSTARCH="amd64"
GOHOSTOS="linux"
GOINSECURE=""
GOMODCACHE="/home/kali/go/pkg/mod"
GONOPROXY=""
GONOSUMDB=""
GOOS="linux"
GOPATH="/home/kali/go"
GOPRIVATE=""
GOPROXY="https://goproxy.cn,direct"
GOROOT="/usr/local/go"
GOSUMDB="sum.golang.org"
GOTMPDIR=""
GOTOOLDIR="/usr/local/go/pkg/tool/linux_amd64"
GOVCS=""
GOVERSION="go1.17.1"
GCCGO="gccgo"
AR="ar"
CC="gcc"
CXX="g++"
CGO_ENABLED="1"
GOMOD="/dev/null"
CGO_CFLAGS="-g -O2"
CGO_CPPFLAGS=""
CGO_CXXFLAGS="-g -O2"
CGO_FFLAGS="-g -O2"
CGO_LDFLAGS="-g -O2"
PKG_CONFIG="pkg-config"
GOGCCFLAGS="-fPIC -m64 -pthread -fmessage-length=0 -fdebug-prefix-map=/tmp/go-build2845414439=/tmp/go-build -gno-record-gcc-switches"
EOF_GOENV



export store="$HOME/Storage/"
export something="$HOME/SomethingsTrashBin"
export desk="$HOME/Desktop"

export PATH="$PATH:/home/kali/.local/bin"
export PATH="$PATH:/home/kali/burp"
export PATH="$PATH:/home/kali/Telegram"
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:/home/kali/.rvm/"
export PATH="$PATH:$HOME/Storage"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
[ -f ~/.rvm ] && source "$HOME/.rvm/scripts/rvm"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"


# enable command-not-found if installed
if [ -f /etc/zsh_command_not_found ]; then
    . /etc/zsh_command_not_found
fi

COMMAND_NOT_FOUND_INSTALL_PROMPT=1

# powerline shell 
function powerline_precmd() {
    PS1="$(powerline-shell --shell zsh $?)"
}
function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}
function powerlineON() {
	if [ "$TERM" != "linux" ]; then
    		install_powerline_precmd
	fi
}
function vimode() {
	export EDITOR="vim"
	bindkey -v #set up my zsh vim mode
}
function unvi(){
	set -o emacs
}
vimode

function c(){
	if [ -z "$1" ]; then
		clear
	else
		if [ -f "$1" ] ; then	# file?
			\cat "$1"
		elif [ -d "$1" ] ; then	# dir?
			\cd "$1"
		else 			# not file and not dir ?
			echo "\033[1m	$1\033[0m is error name to file or dir"
		fi
	fi
}

function msftip(){
	\cat ~/.msfTip|grep "$1"
}


function systemupdate(){
	echo "===================="
	echo "|SYSTEM UPDATE FUNC|"
	echo "===================="
	echo "date: `date`"
	echo "now apt update and apt upgrade now !"
	echo "apt update && apt upgrade"
	echo ""
	apt update&&apt upgrade
}



rvm use system
