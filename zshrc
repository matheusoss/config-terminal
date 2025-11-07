# Suprimir avisos do instant prompt (deve vir ANTES do bloco)
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

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
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  docker
  docker-compose
  npm
  node
  colored-man-pages
  extract
  web-search
  command-not-found
  z
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ========================================
# Detecção automática de linguagem/tecnologia do projeto
# ========================================

# Função para detectar a linguagem/tecnologia do projeto
project_tech_info() {
  local tech=""
  local version=""
  local icons=""
  
  # Node.js
  if [[ -f package.json ]]; then
    tech="Node.js"
    icons="⬢"
    if command -v node &> /dev/null; then
      version=$(node --version 2>/dev/null | sed 's/v//')
    fi
    
    # Detectar gerenciador de pacotes
    if [[ -f pnpm-lock.yaml ]]; then
      icons="${icons} pnpm"
    elif [[ -f yarn.lock ]]; then
      icons="${icons} yarn"
    elif [[ -f package-lock.json ]]; then
      icons="${icons} npm"
    fi
    
    # Detectar TypeScript
    if [[ -f tsconfig.json ]] || grep -q "typescript" package.json 2>/dev/null; then
      icons="${icons} TS"
    fi
  fi
  
  # Python
  if [[ -f requirements.txt ]] || [[ -f pyproject.toml ]] || [[ -f setup.py ]]; then
    [[ -n $tech ]] && tech="${tech}+"
    tech="${tech}Python"
    icons="${icons} 🐍"
    if command -v python3 &> /dev/null; then
      version=$(python3 --version 2>/dev/null | awk '{print $2}')
    fi
  fi
  
  # Go
  if [[ -f go.mod ]]; then
    [[ -n $tech ]] && tech="${tech}+"
    tech="${tech}Go"
    icons="${icons} 🐹"
    if command -v go &> /dev/null; then
      version=$(go version 2>/dev/null | awk '{print $3}' | sed 's/go//')
    fi
  fi
  
  # Rust
  if [[ -f Cargo.toml ]]; then
    [[ -n $tech ]] && tech="${tech}+"
    tech="${tech}Rust"
    icons="${icons} 🦀"
    if command -v rustc &> /dev/null; then
      version=$(rustc --version 2>/dev/null | awk '{print $2}')
    fi
  fi
  
  # Docker
  if [[ -f docker-compose.yaml ]] || [[ -f docker-compose.yml ]] || [[ -f Dockerfile ]]; then
    icons="${icons} 🐳"
  fi
  
  # Ruby
  if [[ -f Gemfile ]]; then
    [[ -n $tech ]] && tech="${tech}+"
    tech="${tech}Ruby"
    icons="${icons} 💎"
    if command -v ruby &> /dev/null; then
      version=$(ruby --version 2>/dev/null | awk '{print $2}')
    fi
  fi
  
  # Java
  if [[ -f pom.xml ]] || [[ -f build.gradle ]] || [[ -f build.gradle.kts ]]; then
    [[ -n $tech ]] && tech="${tech}+"
    tech="${tech}Java"
    icons="${icons} ☕"
    if command -v java &> /dev/null; then
      version=$(java --version 2>/dev/null | head -n1 | awk '{print $2}')
    fi
  fi
  
  # Exibir informações
  if [[ -n $tech ]]; then
    if [[ -n $version ]]; then
      echo "%F{cyan}${icons}%f %F{white}${tech}%f %F{green}${version}%f"
    else
      echo "%F{cyan}${icons}%f %F{white}${tech}%f"
    fi
  fi
}

# Adicionar ao PROMPT (se não estiver usando Powerlevel10k custom)
# Descomente a linha abaixo se quiser adicionar diretamente ao prompt
# PROMPT='$(project_tech_info) '$PROMPT

# Para Powerlevel10k, a função estará disponível para uso manual
# ou você pode configurar via p10k configure


# ========================================
# ALIASES ÚTEIS
# ========================================

# Git aliases (além dos do plugin git)
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git pull'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gd='git diff'
alias glog='git log --oneline --graph --decorate'
alias gundo='git reset --soft HEAD~1'

# Docker aliases
alias dps='docker ps'
alias dpsa='docker ps -a'
alias di='docker images'
alias dcp='docker-compose'
alias dcup='docker-compose up -d'
alias dcdown='docker-compose down'
alias dclogs='docker-compose logs -f'
alias dcrestart='docker-compose restart'

# pnpm aliases
alias pn='pnpm'
alias pni='pnpm install'
alias pnr='pnpm run'
alias pnd='pnpm run dev'
alias pnb='pnpm run build'
alias pnt='pnpm run test'

# npm aliases (caso use npm em algum projeto)
alias ni='npm install'
alias nrd='npm run dev'
alias nrb='npm run build'
alias nrt='npm run test'

# Navegação rápida
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# Listagem melhorada com eza
alias ls='eza --icons --group-directories-first'
alias ll='eza -lh --icons --group-directories-first'
alias la='eza -lah --icons --group-directories-first'
alias lt='eza --tree --level=2 --icons'
alias lta='eza --tree --level=3 --icons'

# Cat melhorado com bat
alias cat='bat --style=auto'
alias catt='/bin/cat'  # cat original se necessário

# Outros utilitários
alias c='clear'
alias h='history'
alias zshconfig='cursor ~/.zshrc'
alias p10kconfig='cursor ~/.p10k.zsh'
alias reload='source ~/.zshrc'

# Sistema
alias ports='lsof -i -P -n | grep LISTEN'
alias myip='curl -s ifconfig.me'
alias speedtest='curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -'

# Desenvolvimento
alias killnode='killall node'
alias killport='function _killport(){ lsof -ti:$1 | xargs kill -9; }; _killport'

# Ferramentas úteis
alias lg='lazygit'
alias lzd='lazydocker'


# ========================================
# FUNÇÕES PERSONALIZADAS
# ========================================

# Criar diretório e entrar nele
mkcd() {
  mkdir -p "$1" && cd "$1"
}

# Buscar processo por nome
psgrep() {
  ps aux | grep -v grep | grep -i -e VSZ -e "$1"
}

# Extrair arquivos compactados (função melhorada)
extract() {
  if [ -f "$1" ]; then
    case "$1" in
      *.tar.bz2)   tar xjf "$1"     ;;
      *.tar.gz)    tar xzf "$1"     ;;
      *.bz2)       bunzip2 "$1"     ;;
      *.rar)       unrar x "$1"     ;;
      *.gz)        gunzip "$1"      ;;
      *.tar)       tar xf "$1"      ;;
      *.tbz2)      tar xjf "$1"     ;;
      *.tgz)       tar xzf "$1"     ;;
      *.zip)       unzip "$1"       ;;
      *.Z)         uncompress "$1"  ;;
      *.7z)        7z x "$1"        ;;
      *)           echo "'$1' não pode ser extraído via extract()" ;;
    esac
  else
    echo "'$1' não é um arquivo válido"
  fi
}

# Backup rápido de arquivo
backup() {
  cp "$1"{,.backup-$(date +%Y%m%d-%H%M%S)}
}

# Criar e abrir arquivo markdown
mdnew() {
  local filename="${1:-note}.md"
  echo "# ${1:-Note}" > "$filename"
  echo "" >> "$filename"
  echo "Created: $(date +%Y-%m-%d)" >> "$filename"
  echo "" >> "$filename"
  cursor "$filename"
}

# Git commit rápido (unalias primeiro caso exista)
unalias gcm 2>/dev/null
gcm() {
  git add .
  git commit -m "$1"
}

# Git commit e push rápido (unalias primeiro caso exista)
unalias gcp 2>/dev/null
gcp() {
  git add .
  git commit -m "$1"
  git push
}

# Abrir repositório no GitHub
ghopen() {
  local url=$(git config --get remote.origin.url)
  if [[ $url == git@github.com:* ]]; then
    url=$(echo $url | sed 's/git@github.com:/https:\/\/github.com\//' | sed 's/\.git$//')
  elif [[ $url == https://github.com/* ]]; then
    url=$(echo $url | sed 's/\.git$//')
  fi
  open "$url"
}

# Limpar node_modules e reinstalar dependências
cleaninstall() {
  echo "Limpando node_modules..."
  rm -rf node_modules
  
  if [ -f "pnpm-lock.yaml" ]; then
    echo "Instalando com pnpm..."
    pnpm install
  elif [ -f "yarn.lock" ]; then
    echo "Instalando com yarn..."
    yarn install
  else
    echo "Instalando com npm..."
    npm install
  fi
}

# Mostrar tamanho de diretórios
dirsize() {
  du -sh "${1:-.}"/* | sort -rh | head -n 20
}

# Buscar arquivo por nome
fname() {
  find . -iname "*$1*"
}

# Criar projeto Node.js rápido
npminit() {
  local project_name="${1:-my-project}"
  mkdir -p "$project_name"
  cd "$project_name"
  npm init -y
  echo "node_modules/" > .gitignore
  echo ".env" >> .gitignore
  git init
  echo "# $project_name" > README.md
  echo "Projeto criado: $project_name"
}

# Ver histórico Git de forma bonita
gitlog() {
  git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative "${@:-HEAD~10..HEAD}"
}

# Contador de linhas de código
countlines() {
  find . -type f -name "*.$1" -exec wc -l {} + | sort -rn | head -20
}


# ========================================
# INTEGRAÇÕES DE FERRAMENTAS
# ========================================

# FZF - Fuzzy Finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS="
  --height 40%
  --layout=reverse
  --border
  --inline-info
  --preview 'bat --style=numbers --color=always --line-range :500 {}'
  --color=fg:#d0d0d0,bg:#121212,hl:#5f87af
  --color=fg+:#d0d0d0,bg+:#262626,hl+:#5fd7ff
  --color=info:#afaf87,prompt:#d7005f,pointer:#af5fff
  --color=marker:#87ff00,spinner:#af5fff,header:#87afaf
"

# FZF - Keybindings úteis
# Ctrl+R - histórico de comandos
# Ctrl+T - buscar arquivos
# Alt+C - mudar de diretório

# Zoxide - navegação inteligente (substitui cd)
if command -v zoxide &> /dev/null; then
  eval "$(zoxide init zsh)"
  alias cd='z'
fi

# BAT - tema e configurações
export BAT_THEME="Monokai Extended"
export BAT_STYLE="numbers,changes,header"

# Configuração de histórico melhorada
HISTSIZE=50000
SAVEHIST=50000
HISTFILE=~/.zsh_history
setopt EXTENDED_HISTORY          # grava timestamp dos comandos
setopt HIST_EXPIRE_DUPS_FIRST    # deleta duplicatas primeiro
setopt HIST_IGNORE_DUPS          # não grava comandos duplicados
setopt HIST_IGNORE_ALL_DUPS      # remove duplicatas antigas
setopt HIST_IGNORE_SPACE         # ignora comandos que começam com espaço
setopt HIST_FIND_NO_DUPS         # não mostra duplicatas na busca
setopt HIST_SAVE_NO_DUPS         # não salva duplicatas
setopt SHARE_HISTORY             # compartilha histórico entre sessões

