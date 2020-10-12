# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

## add various brew "non-g" binaries to the head of the path
#for lib in $( ls -1 /usr/local/opt ); do
#  export PATH="/usr/local/opt/$lib/libexec/gnubin:$PATH"
#done
#export PATH="/usr/local/bin:$PATH"

# man page paths
export MANPATH="/usr/local/share/man:$MANPATH"

## update path completions paths before oh-my-zsh inits
fpath=(
	/usr/share/zsh/site-functions
	/usr/share/zsh-completions
	$fpath
)

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

###############################################################################
## Use PowerLevel10k theme
ZSH_THEME="powerlevel10k/powerlevel10k"

## view colors
# getColorCode background
# getColorCode foreground

## Use "Nerd Font" -- install FiraCode (explicitly not the 'mono' version)
# from https://nerdfonts.com/
# $ brew tap homebrew/cask-fonts
# $ brew cask install font-firacode-nerd-font
#POWERLEVEL9K_MODE='nerdfont-complete'

## left/right status segments
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(custom_proxy_icon root_indicator dir_writable dir vcs kubecontext newline context)
#POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs history time)
#POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

## time config
#POWERLEVEL9K_TIME_FORMAT="%D{%H:%M:%S}"
#POWERLEVEL9K_TIME_12HR=false

## git config (remove extra space from branch icon)
#POWERLEVEL9K_VCS_BRANCH_ICON=$'\uF126'

## dir config
#POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='deepskyblue1'
#POWERLEVEL9K_DIR_HOME_BACKGROUND='deepskyblue1'
#POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='deepskyblue1'
#POWERLEVEL9K_DIR_ETC_BACKGROUND='deepskyblue1'

###############################################################################

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
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
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
	mvn
	node
	npm
	nvm
	osx
	rsync
)

## syntax hilighting
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

## run oh-my-zsh
source $ZSH/oh-my-zsh.sh

## source fuzzy-search init if present
if [[ -f ~/.fzf.zsh ]]; then
	source ~/.fzf.zsh
fi

## use vim
export EDITOR=vim

# aliases
alias vi=vim

unalias ls
alias ls='ls --color=auto -CF'
alias ll='ls --color=auto -CFlh'

## Run extension files in the following dirs:
##  $HOME/.zsh.d
##  $HOME/.zsh.d.$USER
##  $HOME/.zsh.d/$(hostname -s)
##
## Run things in alphabetic order by filename
for dir in $HOME/.zsh.d $HOME/.zsh.d.$USER $HOME/.zsh.d.$(hostname -s); do
	if [[ -d $dir ]]; then
		for file in $(find $dir -name \*.sh | sort); do
			#echo "Init: $file"
			source "$file"
		done
	fi
done

## EOF

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
