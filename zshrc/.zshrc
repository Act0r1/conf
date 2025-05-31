source $HOME/.zshenv
export ZSH="$HOME/.oh-my-zsh"
export EDITOR=nvim


ZSH_THEME="robbyrussell"
# bindkey "^[l" clear-screen  # `^[` is ESC, equivalent to Alt
plugins=( fzf-tab git z zsh-syntax-highlighting  direnv)


if [[ -f ~/.zsh_private ]]; then
  source ~/.zsh_private
fi



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
function field() {
    awk -F "${2:- }" "{print \$${1:-1} }"
}
# zvm_after_init_commands+=(my_init)
# zvm_after_init_commands+=(search_forward)
# zvm_after_init_commands+=(search_backward)
# zvm_after_init_commands+=(my_init)
# zvm_after_init_commands+=(fzf_ctrl_r_opts)
# You may need to manually set your language environment
# export LANG=en_US.UTF-8

source $ZSH/oh-my-zsh.sh
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='mvim'
fi
[ -s "/Users/yea8er/.bun/_bun" ] && source "/Users/yea8er/.bun/_bun"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
alias n="nvim"
alias p="python3"
alias nz="nvim ~/.zshrc"
alias sz="exec zsh"
alias b="bat --theme=Dracula"
alias findfn="find -type f -name "
alias pi="pip3 install"
alias bi="brew install"
alias ls="exa --icons"
alias tpr="telepresence"
alias cd3="cd ../../.."
alias cd3="cd ../../../.."
alias rn="rg --no-ignore --hidden"
alias pir="pip3 install -r requirements.txt"
alias hl="rg -i --passthru"
alias conn="ssh -p 4731 -f -N -L 7595:localhost:45577 booga@151.242.69.244 -i ~/.ssh/xui"
alias dcf="docker-compose up --build --force-recreate"
alias dcl="docker compose logs"
alias dcd="docker compose down"
alias vimdiff="nvim -d"
alias lg="lazygit"
alias bws="~/.config/bin/bw.sh"

function fzf_code_open() {
  local file
  file=$(find . -type f | fzf --preview "bat {}")

  if [[ -n "$file" ]]; then
    nvim "$file"
  fi
}
function mi() {
    if [ "$#" -eq 0 ]; then
        echo "Usage: mi <directory_name>" >&2
    fi

    if [ "$#" -eq 1 ]; then
        mkdir -p "$1" && touch "$1/__init__.py"
        echo "Done"
    fi

    if [ "$#" -gt 1 ]; then
        for f in "$@"; do
            mkdir -p "$f" && touch "$f/__init__.py"
        done
        echo "Done"
    fi
}
function de() {
    if [ -e "./.envrc" ]; then
        echo "File .envrc already exists"
    else
      cat > .envrc <<'EOF'
        # .envrc
        # 1) Если есть каталог .venv, активируем его
        if [ -d .venv ]; then
          source .venv/bin/activate

        # 2) Иначе, если есть venv
        elif [ -d venv ]; then
          source venv/bin/activate
        fi
EOF

  direnv allow .
  echo "Created and successfully ✅"
    fi
}
# zle -N fzf_code_open
# bindkey '^o' fzf_code_open


[ -f "/Users/yea8er/.ghcup/env" ] && . "/Users/yea8er/.ghcup/env" # ghcup-env
bindkey "^N" history-beginning-search-forward

bindkey "^P" history-beginning-search-backward
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
eval "$(/opt//homebrew/bin/starship init zsh)"


. "$HOME/.local/bin/env"
export PATH="$HOME/.local/share/solana/install/active_release/bin:$PATH"

# timezsh() {
#   shell=${1-$SHELL}
#   for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
# }
