# Kiro CLI pre block. Keep at the top of this file.
[[ -f "${HOME}/.local/share/kiro-cli/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/.local/share/kiro-cli/shell/zshrc.pre.zsh"

[[ $- != *i* ]] && return

# Plugins
source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY HIST_IGNORE_DUPS HIST_IGNORE_SPACE

# Completion
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Tools
eval "$(zoxide init zsh)"
function zvm_after_init() { eval "$(starship init zsh)" }

# Environment
export EDITOR="nvim"
export GIT_EDITOR="nvim"
export JAVA_HOME=/usr/lib/jvm/java-26-openjdk
export PATH="${JAVA_HOME}/bin:$HOME/.cargo/bin:$PATH"
export NPM_SIS_REGISTRY="https://infinitecampus.jfrog.io/artifactory/api/npm/npm-snapshot-virtual"
export REPO_URL="ssh://git@repo.infinitecampus.com/~brittany.wimmer/campus-morfeeus.git"
export JIRA_URL="https://issues.infinitecampus.com/jira"
export CONFLUENCE_URL="https://infinitecampus.atlassian.net/wiki"

# Secrets
source ~/.zsh_secrets
export GRADLE_OPTS="-Dgradle.wrapperUser=$ORG_GRADLE_PROJECT_artifactory_user -Dgradle.wrapperPassword=$ORG_GRADLE_PROJECT_artifactory_password"

# Aliases
alias ls="eza"
alias docker=podman
alias docker-compose=podman-compose

# Splash
fastfetch

# Kiro CLI post block. Keep at the bottom of this file.
[[ -f "${HOME}/.local/share/kiro-cli/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/.local/share/kiro-cli/shell/zshrc.post.zsh"
