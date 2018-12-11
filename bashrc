set bell-style none

### color-diff
if [[ -x `which colordiff` ]]; then
  alias diff='colordiff -u'
else
  alias diff='diff -u'
fi

alias du='du -h'
alias mv='mv -i'
alias ll='ls -alh'
alias grep='grep --color'
alias du='du -h'
alias df='df -h -x tmpfs'
alias pwd='pwd -P'
alias cp='cp -i'
alias rm='rm -i'
alias mv='mv -i'
alias em='emacs -nw'
alias lsd='ls -l | grep ^d'
alias lsf='ls -l | grep -v ^d'
alias lld='ls -al | grep ^d'
alias llf='ls -al | grep -v ^d'

alias man='env LANG=ja_JP.UTF-8 LANGUAGE=ja_JP LC_ALL=ja_JP.UTF-8 man'
alias chrome='google-chrome'
alias os_version='lsb_release -a'
alias open='xdg-open'
alias global_ip='curl inet-ip.info'
## Editor: emacs
alias emacs='emacsclient -c -a ""'
alias killemacs='emacsclient -e "(kill-emacs)"'

alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'

alias upgrade='sudo apt update && sudo apt upgrade'
alias bashconf='source ~/.bashrc'


export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'
## Japanese Environment
# export LANG='ja_JP.UTF-8'
# export LC_ALL='ja_JP.UTF-8'
# export LC_MESSAGES='ja_JP.UTF-8'
export HISTCONTROL=ignoredups
export HISTIGNORE="history*:ll"
export HISTSIZE=10000
export PATH=$HOME/bin:$PATH
export PATH=~/ctf/bin:$PATH                 # for CTF
export MANPATH=$MANPATH:/usr/share/man/ja/

### /opt
export PATH=/opt/firefox:$PATH
export PATH=/opt/wkhtmltox/bin:$PATH
export PATH=/opt/wine-staging/bin:$PATH
## texlive 2018
export INFOPATH=/usr/local/texlive/2018/texmf-dist/doc/info:$INFOPATH
export MANPATH=/usr/local/texlive/2018/texmf-dist/doc/man:$MANPATH
export PATH=/usr/local/texlive/2018/bin/x86_64-linux:$PATH

## android development
droidSdk=~/Android/Sdk
export PATH=$droidSdk/emulator:$droidSdk/tools:$droidSdk/platform-tools:$PATH  # for AOSP
export PATH=/opt/android-studio/bin:$PATH
export PATH=$droidSdk/ndk-bundle:$PATH
export USE_CCACHE=1
export CCACHE_DIR=~/aosp/.ccache

## toolchains
export PATH=$PATH:/home/kazuya/bin/gcc-linaro-5.5.0-2017.10-x86_64_aarch64-linux-gnu/bin

## python
# バイトコードを作成しない
export PYTHONDONTWRITEBYTECODE=1
## http://qiita.com/y__sama/items/5b62d31cb7e6ed50f02c
export PYENV_ROOT="$HOME/.pyenv"
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"


## OP-TEE
export PATH="$HOME/devel/optee-qemuv8/toolchains/bin":$PATH

# Opencv3
export LD_LIBRARY_PATH=/usr/local/lib

# CGIでゴミ箱を使う
function trashbox(){
    # 引数を指定させる
    if [ "$#" = 0 ]; then
        echo "Enter more than one argument."
    else
        mv $@ ~/.local/share/Trash/files/
    fi
}

# l: ファイルにはless、ディレクトリにはlsを実行
l() {
    # if the argument is a single file or stdin is pipe
    if [[ ($# -eq 1 && -f "$1") || (-p /dev/stdin) ]]; then
        ${PAGER:-less -R} "$@"
    else
        ls -lF --color=auto "$@"
    fi
}
# p: プロセスリストをgrep
p() {
    if [[ $# -gt 0 ]]; then
        ps auxww | grep "$@"
    else
        ps aux
    fi
}
# h: コマンドヒストリをgrepする
h() {
    if [[ $# -gt 0 ]]; then
        history | tac | sort -k2 -u | sort | grep "$@"
    else # 引数がないときは、直近50件のみを表示
        history 50
    fi
}


## CUDA and cuDNN paths
#export PATH=/usr/local/cuda-9.2/bin:${PATH}
#export LD_LIBRARY_PATH=/usr/local/cuda-9.2/lib64:${LD_LIBRARY_PATH}
#export DYLD_LIBRARY_PATH=/usr/loca/cuda-9.2/lib64:${DYLD_LIBRARY_PATH}

#eval "$(ntfy shell-integration)"

# Color List
Color_Off='\e[0m'       # Text Reset
# Regular Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White
# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

PS1='\[\e[1;32m\]\u@\h:\[\e[1;36m\]\w \[\e[m\]$ '