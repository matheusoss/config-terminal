# 🚀 Guia Completo do Terminal ZSH

> Configuração completa do terminal com Oh My Zsh, Powerlevel10k e ferramentas modernas

**Criado em:** 2025-11-06
**Sistema:** macOS

---

## 📋 Índice

1. [Ferramentas Instaladas](#-ferramentas-instaladas)
2. [Aliases Úteis](#-aliases-úteis)
3. [Funções Personalizadas](#-funções-personalizadas)
4. [Atalhos de Teclado](#-atalhos-de-teclado)
5. [Plugins Oh My Zsh](#-plugins-oh-my-zsh)
6. [Backup do .zshrc](#-backup-do-zshrc)

---

## 🛠️ Ferramentas Instaladas

### Substitutos Modernos de Comandos CLI

| Ferramenta | Substitui | Descrição |
|------------|-----------|-----------|
| `eza` | `ls` | Listagem colorida com ícones |
| `bat` | `cat` | Visualizador com syntax highlighting |
| `fd` | `find` | Busca de arquivos mais rápida |
| `ripgrep` | `grep` | Busca em conteúdo extremamente rápida |
| `fzf` | - | Busca fuzzy interativa |
| `zoxide` | `cd` | Navegação inteligente entre diretórios |
| `git-delta` | - | Diffs do Git coloridos e melhorados |
| `htop` | `top` | Monitor de processos interativo |
| `lazygit` | - | Interface TUI para Git |
| `lazydocker` | - | Interface TUI para Docker |

### Instalação (caso precise reinstalar)

```bash
brew install eza bat fd ripgrep fzf zoxide tldr htop git-delta lazygit lazydocker
```

---

## ⚡ Aliases Úteis

### Git

```bash
gs              # git status
ga              # git add
gc              # git commit
gp              # git push
gl              # git pull
gco             # git checkout
gcb             # git checkout -b (criar nova branch)
gd              # git diff
glog            # git log --oneline --graph --decorate
gundo           # git reset --soft HEAD~1 (desfazer último commit)
```

### Docker

```bash
dps             # docker ps
dpsa            # docker ps -a (todos os containers)
di              # docker images
dcp             # docker-compose
dcup            # docker-compose up -d
dcdown          # docker-compose down
dclogs          # docker-compose logs -f (seguir logs)
dcrestart       # docker-compose restart
```

### pnpm / npm

```bash
# pnpm
pn              # pnpm
pni             # pnpm install
pnr             # pnpm run
pnd             # pnpm run dev
pnb             # pnpm run build
pnt             # pnpm run test

# npm
ni              # npm install
nrd             # npm run dev
nrb             # npm run build
nrt             # npm run test
```

### Navegação

```bash
..              # cd ..
...             # cd ../..
....            # cd ../../..
.....           # cd ../../../..
cd              # agora usa zoxide (navegação inteligente)
```

### Listagem (com eza)

```bash
ls              # listagem com ícones e colorida
ll              # listagem detalhada (-lh)
la              # listagem incluindo ocultos (-lah)
lt              # árvore de diretórios (2 níveis)
lta             # árvore de diretórios (3 níveis)
```

### Visualização

```bash
cat             # agora usa bat (com syntax highlighting)
catt            # cat original do sistema
```

### Utilitários

```bash
c               # clear (limpar tela)
h               # history
zshconfig       # editar ~/.zshrc no VS Code
p10kconfig      # editar ~/.p10k.zsh no VS Code
reload          # recarregar configuração (source ~/.zshrc)
```

### Sistema

```bash
ports           # mostrar portas em uso (LISTEN)
myip            # mostrar IP público
speedtest       # teste de velocidade da internet
```

### Desenvolvimento

```bash
killnode        # matar todos os processos node
killport 3000   # matar processo em porta específica
lg              # abrir lazygit
lzd             # abrir lazydocker
```

---

## 🔧 Funções Personalizadas

### Gerenciamento de Arquivos

```bash
# Criar diretório e entrar nele
mkcd nome-do-diretorio

# Backup de arquivo com timestamp
backup arquivo.js
# Resultado: arquivo.js.backup-20251106-143022

# Extrair qualquer arquivo compactado
extract arquivo.tar.gz
extract arquivo.zip
extract arquivo.7z
# Suporta: .tar.gz, .zip, .rar, .7z, .bz2, etc.

# Ver tamanho dos diretórios (top 20)
dirsize
dirsize /caminho/especifico

# Buscar arquivo por nome
fname index.tsx
# Busca recursivamente arquivos com "index.tsx" no nome
```

### Git

```bash
# Commit rápido (add + commit)
gcm "mensagem do commit"

# Commit e push rápido (add + commit + push)
gcp "mensagem do commit"

# Abrir repositório no GitHub no navegador
ghopen

# Log do Git bonito e colorido
gitlog
gitlog HEAD~20..HEAD  # últimos 20 commits
```

### Node.js / Desenvolvimento

```bash
# Limpar node_modules e reinstalar
# Detecta automaticamente npm/yarn/pnpm
cleaninstall

# Criar projeto Node.js rápido
npminit nome-do-projeto
# Cria: diretório, package.json, .gitignore, README.md, git init

# Contar linhas de código por extensão
countlines js    # arquivos .js
countlines tsx   # arquivos .tsx
countlines py    # arquivos .py
```

### Markdown

```bash
# Criar e abrir arquivo markdown
mdnew nome-do-arquivo
# Cria arquivo com template e abre no VS Code
```

### Processos

```bash
# Buscar processo por nome
psgrep node
psgrep docker
```

---

## ⌨️ Atalhos de Teclado

### FZF (Fuzzy Finder)

| Atalho | Ação |
|--------|------|
| `Ctrl + R` | Buscar no histórico de comandos |
| `Ctrl + T` | Buscar arquivos (com preview) |
| `Alt + C` | Mudar de diretório interativamente |

**Navegação no FZF:**
- `↑↓` ou `Ctrl+J/K` - Navegar pelos resultados
- `Enter` - Selecionar
- `Esc` - Cancelar
- `Tab` - Marcar múltiplos itens
- `Ctrl+U` - Limpar busca

### Zsh Padrão

| Atalho | Ação |
|--------|------|
| `Ctrl + A` | Ir para o início da linha |
| `Ctrl + E` | Ir para o fim da linha |
| `Ctrl + U` | Apagar do cursor até o início |
| `Ctrl + K` | Apagar do cursor até o fim |
| `Ctrl + W` | Apagar palavra anterior |
| `Alt + Backspace` | Apagar palavra anterior |
| `Ctrl + L` | Limpar tela (igual `clear`) |
| `Ctrl + C` | Cancelar comando |
| `Ctrl + Z` | Suspender processo (bg/fg) |

---

## 🔌 Plugins Oh My Zsh

Lista de plugins ativos:

```bash
git                      # Aliases e funções para Git
zsh-autosuggestions     # Sugestões automáticas baseadas no histórico
zsh-syntax-highlighting # Highlight de sintaxe em tempo real
docker                  # Autocomplete para Docker
docker-compose          # Autocomplete para Docker Compose
npm                     # Autocomplete para npm
node                    # Helpers para Node.js
pnpm                    # Autocomplete para pnpm
colored-man-pages       # Man pages coloridas
extract                 # Comando 'extract' para descompactar
web-search              # Buscar no Google/Stack Overflow
command-not-found       # Sugere pacotes quando comando não existe
z                       # Navegação rápida entre diretórios
```

### Exemplos de uso dos plugins

```bash
# web-search
google "react hooks"
stackoverflow "zsh configuration"

# z (pular para diretórios visitados)
z rbac          # vai para ~/Estudos/rbac
z api           # vai para ~/Estudos/rbac/apps/api
```

---

## 🎨 Configurações Especiais

### FZF

- **Preview**: Mostra conteúdo de arquivos com `bat`
- **Tema**: Cores customizadas (dark theme)
- **Busca**: Usa `fd` (ignora .git automaticamente)

### Git Delta

- **Side-by-side**: Diffs lado a lado
- **Line numbers**: Números de linha
- **Syntax highlight**: Cores por linguagem
- **Navigate**: Navegação entre hunks

```bash
# Ver diff bonito
git diff
git log -p
```

### Histórico

- **50.000 comandos** salvos
- **Sem duplicatas**
- **Compartilhado** entre sessões
- **Timestamps** salvos

---

## 📦 Backup do .zshrc

<details>
<summary><strong>Clique para ver o conteúdo completo do .zshrc</strong></summary>

```bash
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
  pnpm
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
alias zshconfig='code ~/.zshrc'
alias p10kconfig='code ~/.p10k.zsh'
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
  code "$filename"
}

# Git commit rápido
gcm() {
  git add .
  git commit -m "$1"
}

# Git commit e push rápido
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
```

</details>

---

## 🔄 Restaurar Configuração

Para restaurar esta configuração em outro Mac:

```bash
# 1. Instalar Homebrew (se não tiver)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 2. Instalar Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# 3. Instalar Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# 4. Instalar plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# 5. Instalar ferramentas
brew install eza bat fd ripgrep fzf zoxide htop git-delta lazygit lazydocker

# 6. Configurar FZF
/opt/homebrew/opt/fzf/install

# 7. Copiar conteúdo do .zshrc deste documento para ~/.zshrc

# 8. Recarregar
source ~/.zshrc
```

---

## 📚 Referências

- [Oh My Zsh](https://ohmyz.sh/)
- [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
- [FZF](https://github.com/junegunn/fzf)
- [Zoxide](https://github.com/ajeetdsouza/zoxide)
- [Eza](https://github.com/eza-community/eza)
- [Bat](https://github.com/sharkdp/bat)
- [Lazygit](https://github.com/jesseduffield/lazygit)
- [Lazydocker](https://github.com/jesseduffield/lazydocker)

---

## 💡 Dicas Rápidas

1. **Buscar comando no histórico**: `Ctrl + R` e comece a digitar
2. **Buscar arquivos**: `Ctrl + T` e comece a digitar o nome
3. **Mudar de diretório rapidamente**: Use `z nome-do-dir` (zoxide)
4. **Ver diff bonito**: `git diff` (usa delta automaticamente)
5. **Gerenciar Git visualmente**: Digite `lg` para abrir lazygit
6. **Gerenciar Docker visualmente**: Digite `lzd` para abrir lazydocker
7. **Ver conteúdo de arquivo**: `cat arquivo.js` (usa bat com syntax highlighting)
8. **Listar com ícones**: `ls` ou `ll` (usa eza)
9. **Commit rápido**: `gcm "mensagem"` (add + commit)
10. **Push rápido**: `gcp "mensagem"` (add + commit + push)

---

**Última atualização:** 2025-11-06
**Autor:** Configuração personalizada
