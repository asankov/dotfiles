## ALIASES

alias k="kubectl "
alias kap="kubectl apply -f "
alias ktx="kubectx"
alias gimme="gimme-aws-creds"
alias osspi="/Users/asankov/.osspicli/osspi/osspi"
alias vim="nvim"
alias t="terraform"

alias vimrc="vim ~/.vimrc"
alias zshrc="vim ~/.zshrc"

alias python="python3 "

## END ALIASES

export GOPATH=/Users/asankov/go
export GOBIN=/Users/asankov/go/bin
export PATH=$PATH:$GOPATH:$GOBIN
export GONOPROXY=none
export GONOSUMDB=*
export GOPRIVATE=gitlab.bit9.local,carbonblack.com
export GOPROXY=https://artifactory-pub.bit9.local/artifactory/api/go/go

# LOAD COMPDEF FUNCTION
autoload -Uz compinit
compinit

source <(kubectl completion zsh)

# 1PASSWORD AUTOCOMPLETION
eval "$(op completion zsh)"; compdef _op op

export KUBE_EDITOR=nvim

# Path to your oh-my-zsh installation.
export ZSH="/Users/asankov/.oh-my-zsh"

ZSH_THEME="agnoster"

# This is the default user of my laptop
# and this env here prevents the "agnoster" theme for showing me the user name
# when using the default user.
export DEFAULT_USER="asankov"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

HYPHEN_INSENSITIVE="true"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git npm brew zsh-autosuggestions)
plugins=(git npm brew kubectl)

source $ZSH/oh-my-zsh.sh

# User configuration

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Enable zsh syntax highlighting.
# To active it on a new machine install it via brew:
#     brew install zsh-syntax-highlighting
# 
# Full docs: https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


## FUNCTIONS

function aws_profile {
  if [ -z "$AWS_PROFILE" ]
  then
        echo "default"
  else
        echo "$AWS_PROFILE"
  fi
}

## END FUNCTIONS

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/asankov/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/asankov/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/asankov/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/asankov/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
