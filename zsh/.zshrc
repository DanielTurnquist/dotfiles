
# Kiro CLI pre block. Keep at the top of this file.
[[ -f "${HOME}/.local/share/kiro-cli/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/.local/share/kiro-cli/shell/zshrc.pre.zsh"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS

# Completion
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
setopt COMPLETE_IN_WORD

# Plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Zoxide
eval "$(zoxide init zsh)"

# aliases
alias ls="eza"

# Prompt with git branch
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats ' (%b)'
setopt PROMPT_SUBST
PS1='%F{green}%n@%m%f %F{blue}%1~%f%F{yellow}${vcs_info_msg_0_}%f %# '

# Environment variables
export EDITOR="nvim"
export VISUAL="nvim"
export NPM_SIS_REGISTRY="https://infinitecampus.jfrog.io/artifactory/api/npm/npm-snapshot-virtual"

# Secrets (tokens, passwords, keys)
source ~/.zsh_secrets

export GRADLE_OPTS="-Dgradle.wrapperUser=$ORG_GRADLE_PROJECT_artifactory_user -Dgradle.wrapperPassword=$ORG_GRADLE_PROJECT_artifactory_password"

# Cargo 
export PATH="$HOME/.cargo/bin:$PATH"

# ICAS Java
export JAVA_HOME=/usr/lib/jvm/java-26-openjdk
export PATH="${JAVA_HOME}/bin:${PATH}"

# Arch btw
fastfetch

# Campus devcontainer repository URL
export REPO_URL="ssh://git@repo.infinitecampus.com/~brittany.wimmer/campus-morfeeus.git"



# Atlassian MCP
export JIRA_URL="https://issues.infinitecampus.com/jira"
export CONFLUENCE_URL="https://infinitecampus.atlassian.net/wiki"

export EDITOR="nvim"
export GIT_EDITOR="nvim"


# Kiro CLI post block. Keep at the bottom of this file.
[[ -f "${HOME}/.local/share/kiro-cli/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/.local/share/kiro-cli/shell/zshrc.post.zsh"

# Podman as Docker replacement
alias docker=podman
alias docker-compose=podman-compose