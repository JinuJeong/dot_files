set_prompts() {
    local black=""
    local blue=""
    local bold=""
    local cyan=""
    local green=""
    local orange=""
    local purple=""
    local red=""
    local reset=""
    local white=""
    local yellow=""
    local violet=""

    local hostStyle=""
    local userStyle=""

    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        tput sgr0 # reset colors

        bold=$(tput bold)
        reset=$(tput sgr0)

        # Solarized colors
        # (https://github.com/altercation/solarized/tree/master/iterm2-colors-solarized#the-values)
        black=$(tput setaf 0)
        blue=$(tput setaf 33)
        cyan=$(tput setaf 37)
        green=$(tput setaf 64)
        orange=$(tput setaf 166)
        purple=$(tput setaf 125)
        red=$(tput setaf 124)
        white=$(tput setaf 15)
        violet=$(tput setaf 61)
        yellow=$(tput setaf 136)
    else
        bold=""
        reset="\e[0m"

        black="\e[1;30m"
        blue="\e[1;34m"
        cyan="\e[1;36m"
        green="\e[1;32m"
        orange="\e[1;33m"
        purple="\e[1;35m"
        red="\e[1;31m"
        violet="\e[1;35m"
        white="\e[1;37m"
        yellow="\e[1;33m"
    fi

    # build the prompt

    # logged in as root
    if [[ "$USER" == "root" ]]; then
        userStyle="\[$bold$blue\]"
    else
        userStyle="$blue"
    fi

    # connected via ssh
    if [[ "$SSH_TTY" ]]; then
        hostStyle="$cyan"
    else
        hostStyle="$cyan"
    fi

    # set the terminal title to the current working directory
    PS1="\[\033]0;\w\007\]"
    PS1+="\n" # newline
    PS1+="\[${userStyle}\]\u"; # username
    PS1+="\[${white}\]@";
    PS1+="\[${hostStyle}\]\h"; # host
    PS1+="\[${violet}\] [\t] ";
    PS1+="\[$green\]\w" # working directory
    PS1+="\n"
	PS1+="\[$reset$white\]\$ \[$reset\]" # $ (and reset color)

    export PS1
}

export CLICOLOR=1
alias ls='ls --color="auto"'

source ~/.cuda_set.sh

set_prompts
unset set_prompts

#alias pip='python -m pip'
export TEST_TMPDIR=/tmp/bazel

alias python_ctags="ctags -R --fields=+l --languages=python --python-kinds=-iv -f tags ./"
alias cpp_ctags="ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ ./"


#echo 'GOVERNOR="performance"' | sudo tee /etc/default/cpufrequtils
#sudo systemctl disable ondemand
