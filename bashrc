# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# EXPORT
    # Add .NET Core SDK tools
    export PATH="$PATH:~/.dotnet/tools"

# ALIASES
    # Dual monirot settings
    # alias dms='nwg-displays-apply -p dms'
    alias dms='~/.screenlayout/dms.sh'
    # Pls VS Code don't lag
    alias code='code --disable-gpu --ozone-platform=x11'
    # Neovim profile
    alias vip='NVIM_APPNAME=nvim-personal nvim'
    # Better ls
    alias ls='ls -lh --color=auto'
    # Better grep
    alias grep='grep --color=auto'

# PROMPT CONFIG
    BLACK="\[$(tput setaf 0)\]"
    RED="\[$(tput setaf 1)\]"
    GREEN="\[$(tput setaf 2)\]"
    YELLOW="\[$(tput setaf 3)\]"
    BLUE="\[$(tput setaf 4)\]"
    MAGENTA="\[$(tput setaf 5)\]"
    CYAN="\[$(tput setaf 6)\]"
    WHITE="\[$(tput setaf 7)\]"
    RESET="\[$(tput sgr0)\]"

    PS1="${GREEN}\u${RESET}${CYAN}@${RESET}${MAGENTA}\H${RESET} ${YELLOW}\w${RESET} ${WHITE}\$${RESET} "
