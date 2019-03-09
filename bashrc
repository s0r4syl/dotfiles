set bell-style none
## エイリアス設定
alias ls='ls --color=auto'
alias ll='ls -alh'
alias grep='grep --color'
alias rm='rm -i'
### diff
if [[ -x `which colordiff` ]]; then
  alias diff='colordiff -u'
else
  alias diff='diff -u'
fi
alias du='du -h'
alias mv='mv -i'
alias lsd='ls -l | grep ^d'
alias lsf='ls -l | grep -v ^d'
alias lld='ls -al | grep ^d'
alias llf='ls -al | grep -v ^d'
# manページは日本語で
alias man='env LANG=ja_JP.UTF-8 LANGUAGE=ja_JP LC_ALL=ja_JP.UTF-8 man'
alias global_ip='curl inet-ip.info'
## Editor: emacs
alias emacs='emacsclient -c -a ""'
alias killemacs='emacsclient -e "(kill-emacs)"'

##
export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'
## Japanese Environment
# export LANG='ja_JP.UTF-8'
# export LC_ALL='ja_JP.UTF-8'
# export LC_MESSAGES='ja_JP.UTF-8'
export HISTCONTROL=ignoredups
export HISTIGNORE="history*:ll"
export HISTSIZE=10000
if [[ -e $HOME/bin ]]; then
    export PATH=$HOME/bin:$PATH
fi
## texlive 2018
#export INFOPATH=/usr/local/texlive/2018/texmf-dist/doc/info:$INFOPATH
#export MANPATH=/usr/local/texlive/2018/texmf-dist/doc/man:$MANPATH
#export PATH=/usr/local/texlive/2018/bin/x86_64-linux:$PATH

## android development
#droidSdk=~/Android/Sdk
#export PATH=$droidSdk/emulator:$droidSdk/tools:$droidSdk/platform-tools:$PATH  # for AOSP
#export PATH=/opt/android-studio/bin:$PATH
#export PATH=$droidSdk/ndk-bundle:$PATH
#export USE_CCACHE=1
#export CCACHE_DIR=~/aosp/.ccache


## python
# バイトコードを作成しない
export PYTHONDONTWRITEBYTECODE=1
## http://qiita.com/y__sama/items/5b62d31cb7e6ed50f02c
export PYENV_ROOT="$HOME/.pyenv"
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

PS1='\[\e[1;32m\]\u@\h:\[\e[1;36m\]\w \[\e[m\]$ '

# Opencv3
#export LD_LIBRARY_PATH=/usr/local/lib

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
