# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

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
plugins=(git kubectl fzf tmux docker)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
export EDITOR=nvim
export TERMINAL=alacritty
export JAVA_HOME=/usr/lib/jvm/default
export TERM="xterm-256color"
export ANDROID_SDK=$HOME/Android/Sdk
export VOLTA_HOME="$HOME/.volta"
export FZF_DEFAULT_COMMAND='fd --type f'

export PATH=$HOME/.local/share/solana/install/active_release/bin:$HOME/.local/share/JetBrains/Toolbox/scripts:$VOLTA_HOME/bin:$HOME/.yarn/bin:$HOME/.cargo/bin:$ANDROID_SDK/platform-tools:$PATH
alias vim="nvim"


alias ytd="youtube-dl --external-downloader=aria2c --external-downloader-args '--min-split-size=1M --max-connection-per-server=16 --max-concurrent-downloads=16 --split=16'"
alias gdate1="GIT_AUTHOR_DATE='1 day ago' GIT_COMMITTER_DATE='1 day ago' git commit"
alias gdate2='GIT_AUTHOR_DATE=`date -d "2 days ago"` GIT_COMMITTER_DATE=`date -d "2 days ago"` git commit'
alias grbh='git reset $(git merge-base master $(git rev-parse --abbrev-ref HEAD))'
alias grsr='git reset --hard --recurse-submodule'

function swap()         
{
    local TMPFILE=tmp.$$
    mv "$1" $TMPFILE && mv "$2" "$1" && mv $TMPFILE "$2"
}

alias pak="kubectl --kubeconfig $HOME/dev/infra/block-engine/secrets/mainnet/amsterdam/kubeconfig"
alias pah="helm --kubeconfig=$HOME/dev/infra/block-engine/secrets/mainnet/amsterdam/kubeconfig"
alias pfk="kubectl --kubeconfig $HOME/dev/infra/block-engine/secrets/mainnet/frankfurt/kubeconfig"
alias pfh="helm --kubeconfig=$HOME/dev/infra/block-engine/secrets/mainnet/frankfurt/kubeconfig"
alias knt="kubectl --kubeconfig $HOME/dev/infra/block-engine/secrets/testnet/nyc/kubeconfig"
alias hnt="helm --kubeconfig=$HOME/dev/infra/block-engine/secrets/testnet/nyc/kubeconfig"
alias kdt="kubectl --kubeconfig $HOME/dev/infra/block-engine/secrets/testnet/dallas/kubeconfig"
alias hdt="helm --kubeconfig=$HOME/dev/infra/block-engine/secrets/testnet/dallas/kubeconfig"
