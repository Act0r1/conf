# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export EDITOR=nvim

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"


# Функция для активации venv или .venv, если она существует и ещё не активирована
# Функция для активации venv или .venv, если она существует и ещё не активирована
activate_venv_if_exists() {
    current_dir=$(pwd)

    # Проверяем, находится ли текущая директория внутри tmp или Developers
    if [[ "$current_dir" != */tmp/* && "$current_dir" != */Developers/* ]]; then
        # Если текущая директория не внутри tmp или Developers, ничего не делаем
        return
    fi
    # Проверяем, активировано ли уже виртуальное окружение
    if [[ -z "$VIRTUAL_ENV" ]]; then
        deactivate 2>/dev/null  # Деактивируем текущее виртуальное окружение, если оно активировано
    fi
    if [ -d "venv" ]; then
        source venv/bin/activate
        echo "Активировано виртуальное окружение 'venv'"
    elif [ -d ".venv" ]; then
        source .venv/bin/activate
        echo "Активировано виртуальное окружение '.venv'"
    fi
}

# Переопределяем команду cd, чтобы она вызывала активацию окружения при смене директории
cd() {
    builtin cd "$@"  # Выполняем стандартную команду cd
    activate_venv_if_exists  # После смены директории вызываем активацию venv
}

# Используем команду `PROMPT_COMMAND`, чтобы автоматически проверять при каждом переходе в директорию
# export PROMPT_COMMAND=activate_venv_if_exists
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
# export MANPATH="/usr/local/man:$MANPATH"

# Add wisely, as too many plugins slow down shell startup.
plugins=(git z zsh-syntax-highlighting zsh-vi-mode)

alias n="nvim"
alias p="python3"
alias nz="nvim ~/.zshrc"
alias sz="source ~/.zshrc"
alias b="bat"
alias findfn="find -type f -name "
alias pi="pip3 install"

function search_forward() {
  bindkey "^N" history-beginning-search-forward
}

function search_backward() {
  bindkey "^P" history-beginning-search-backward
}

function fzf_ctrl_r_opts () {
    export FZF_CTRL_R_OPTS="
      --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
      --color header:italic
      --header 'Press CTRL-Y to copy command into clipboard'"
    export FZF_ALT_C_OPTS="
      --walker-skip .git,node_modules,target
      --preview 'tree -C {}'"
    
}

function my_init() {
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
}
zvm_after_init_commands+=(my_init)
zvm_after_init_commands+=(search_forward)
zvm_after_init_commands+=(search_backward)
zvm_after_init_commands+=(my_init)
zvm_after_init_commands+=(fzf_ctrl_r_opts)
# You may need to manually set your language environment
# export LANG=en_US.UTF-8

source $ZSH/oh-my-zsh.sh
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
# Add Visual Studio Code (code)
# export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
# bun completions
[ -s "/Users/yea8er/.bun/_bun" ] && source "/Users/yea8er/.bun/_bun"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
# export PATH="/Users/yea8er/Library/Python/3.9/bin:$PATH"
alias ls="exa --icons" 
alias tpr="telepresence"
alias cd3="cd ../../.."
alias cd3="cd ../../../.."
alias rn="rg --no-ignore --hidden"
# Function to search for files using fzf with preview and open the selected file in VS Code
fzf_code_open() {
  local file
  file=$(find . -type f | fzf --preview "bat {}")
  
  if [[ -n "$file" ]]; then
    nvim "$file"
  fi
}

zle -N fzf_code_open
bindkey '^N' fzf_code_open

