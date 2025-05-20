#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# DUMB CAMERAAAAAA!!!!!!!!
# echo 1 | sudo -S tee /sys/bus/usb/devices/1-0:1.0/usb1-port3/disable

alias ls='ls --color=auto'
alias grep='grep --color=auto'
export PS1="\[\e[38;5;196m\]\u\[\e[38;5;202m\]@\[\e[38;5;208m\]\h \[\e[38;5;220m\]\w \[\033[0m\]$ "

export PATH=/home/notforest/.local/bin:$PATH
export PATH=/home/notforest/intelFPGA_lite/20.1/quartus/bin:$PATH
export PATH="$PATH:$HOME/esp/xtensa-esp32-elf/bin"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/esp/esp-idf/tools:$PATH"

[[ -r /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion

export QSYS_ROOTDIR="/home/notforest/intelFPGA_lite/20.1/quartus/sopc_builder/bin"

eval "$(starship init bash)"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH=/opt/tcl9.0/bin:$PATH
eval "$(pyenv init --path)"
