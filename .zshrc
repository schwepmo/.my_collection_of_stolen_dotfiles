# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# append
path+=('/opt/homebrew/bin')
path+=('/Library/Frameworks/EclipseSUMO.framework/Versions/Current/EclipseSUMO/bin')
export PATH="$PATH:/Users/scc/Library/Application Support/JetBrains/Toolbox/scripts"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH="$PATH:/Users/scc/Development/hugo_extended_0.75.1_macOS-64bit"

export SUMO_HOME="/Library/Frameworks/EclipseSUMO.framework/Versions/1.24.0/EclipseSUMO/share/sumo"

export PATH

# Created by `pipx` on 2025-05-07 11:38:34
export PATH="$PATH:/Users/scc/.local/bin"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/scc/.rd/bin:$PATH"

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# autosuggest config
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=60'
bindkey '^[[Z' autosuggest-accept
ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(buffer-empty bracketed-paste accept-line push-line-or-edit)
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_USE_ASYNC=true

# history setup
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# completion using arrow keys (based on history)
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward

# eza configuration
# alias ls="eza --icons=always --git"
EZA_THRESHOLD=25

unalias ls 2>/dev/null
ls() {
    local threshold=${EZA_THRESHOLD:-10}
    # Find the directory argument
    target_dir="."
    for arg in "$@"; do
        if [[ "$arg" != -* ]] && [[ -d "$arg" ]]; then
            target_dir="$arg"
            break
        fi
    done

    local count=$(eza -1a "$target_dir" 2>/dev/null | wc -l)

    if [[ $count -le $threshold ]]; then
        eza -la --icons --git --group-directories-first --time-style=relative "$@"
    else
        eza -G --icons --group-directories-first "$@"
    fi
}

# ---- Zoxide (better cd) ----
eval "$(zoxide init zsh)"

alias cd="z"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ] && [ "${TERM_PROGRAM:-}" != "vscode" ] && [ "${INTELLIJ_ENVIRONMENT_READER:-}" != "true" ]; then
 exec tmux
fi
