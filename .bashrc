# To make C-o work, not sure why the terminal driver discards this character
# http://apple.stackexchange.com/questions/3253/ctrl-o-behavior-in-terminal-app
stty discard undef

# TODO: It would be nice I think to have a key stroke which clears the screen
# and runs the previous command. My inspiration is running tests. Although I
# suppose another solution to this problem is better test integration with the
# editor.

# TODO: Configure the prompt to show things like the current branch in git and
# maybe some colors as well.

# So C-xC-e will start vim
export EDITOR=vim
# Ignore duplicate history entries.
export HISTCONTROL=ignoredups

# Restart virtualbox if something is funky
alias restart_vb="sudo /Library/Application\\ Support/VirtualBox/LaunchDaemons/VirtualBoxStartup.sh restart"
# Manage dotfiles in the home directory
alias dotgit='git --git-dir=$HOME/.dotgit/ --work-tree=$HOME'

# Quickly generate a coverage report for the specified package and view it in
# the browser.
cover () {
    t="/tmp/go-cover.$$.tmp"
    go test -covermode=count -coverprofile="$t" "$@" && go tool cover -html="$t" && unlink "$t"
}

export PATH="$HOME/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"
export PATH="$HOME/.rbenv/shims:$PATH"
export PATH="/usr/local/php5/bin:$PATH"

# show my ip address
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"

# show users
alias allusers="cut -d: -f1 /etc/passwd"

# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"
# source <(kubectl completion bash)
