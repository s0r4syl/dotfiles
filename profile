# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# Environment Variable
export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'
export HISTCONTROL=ignoredups
#export HISTIGNORE="history*:ls*:ll"
export HISTSIZE=10000
export PATH=/opt/firefox:$PATH

## ctf
export PATH=~/ctf/tools/bin:$PATH

## android
export PATH=/opt/android-studio/bin:$PATH
AndroidSdk=~/Android/Sdk
export PATH=$AndroidSdk/emulator:$AndroidSdk/platform-tools:$PATH

## python
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
#eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"

## OP_TEE
export PATH="$HOME/devel/optee-rsp3/toolchains/aarch64/bin":$PATH



# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    export PATH="$HOME/bin:$PATH"
fi
