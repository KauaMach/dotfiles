# =============================================================================
# 1. PARÂMETROS DE EXECUÇÃO INICIAL E PROMPT
# =============================================================================

fastfetch

# Habilita o prompt instantâneo do Powerlevel10k (Redução de latência na inicialização).
# Deve permanecer rigorosamente no topo do ~/.zshrc. Operações que exijam I/O bloqueante
# (prompts de senha, confirmações) devem ser declaradas ANTES deste bloco.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# =============================================================================
# 2. DEFINIÇÃO DE CAMINHOS (PATHS) E VARIÁVEIS GLOBAIS
# =============================================================================

# Caso esteja migrando do interpretador bash, pode ser necessário reconfigurar o seu $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path para a instalação do Oh My Zsh.
export ZSH="$HOME/.oh-my-zsh"

# =============================================================================
# 3. CONFIGURAÇÃO DE TEMAS E COMPORTAMENTO DO OH MY ZSH
# =============================================================================

# Define o nome do tema a ser carregado --- se configurado como "random", o interpretador
ZSH_THEME="powerlevel10k/powerlevel10k"

# Define a matriz de temas candidatos para carregamento aleatório.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Descomente a diretiva abaixo para habilitar o autocompletar com distinção de maiúsculas/minúsculas (case-sensitive).
CASE_SENSITIVE="true"

# Habilita a resolução léxica com distinção de caixa (case-sensitive) durante a rotina de autocompletar.
# HYPHEN_INSENSITIVE="true"

# Descomente uma das diretivas abaixo para modificar o comportamento do atualizador automático.
# zstyle ':omz:update' mode disabled  # desabilita atualizações automáticas
# zstyle ':omz:update' mode auto      # atualiza automaticamente sem solicitar confirmação
# zstyle ':omz:update' mode reminder  # notifica quando houver atualizações pendentes

# Descomente a diretiva abaixo para alterar a frequência do atualizador automático (em dias).
# zstyle ':omz:update' frequency 13

# Descomente a diretiva abaixo se a colagem de URLs e outros blocos de texto apresentar anomalias sintáticas.
# DISABLE_MAGIC_FUNCTIONS="true"

# Descomente a diretiva abaixo para desabilitar a colorização no comando ls.
# DISABLE_LS_COLORS="true"

# Descomente a diretiva abaixo para desabilitar a injeção automática de títulos no terminal.
# DISABLE_AUTO_TITLE="true"

# Descomente a diretiva abaixo para habilitar o corretor ortográfico heurístico de comandos.
# ENABLE_CORRECTION="true"

# Habilita a renderização de indicadores de estado (pontos vermelhos) durante a suspensão por latência de I/O no autocompletar.
# Admite a injeção de strings ANSI customizadas (ex: COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f").
# COMPLETION_WAITING_DOTS="true"

# Descomente a diretiva abaixo para desabilitar a sinalização de ficheiros não rastreados (untracked)
# sob o VCS como modificados (dirty). Isto otimiza drasticamente o tempo de resposta em repositórios de grande escala.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Sobrescreve a sintaxe padrão de formatação temporal (timestamp) no registro de I/O (.zsh_history).
# Formatos suportados: "mm/dd/yyyy" | "dd.mm.yyyy" | "yyyy-mm-dd".
# Permite injeção de padrões compatíveis com a API strftime (C standard library).
# HIST_STAMPS="mm/dd/yyyy"

# Deseja alocar as configurações customizadas num diretório divergente de $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder


#=============================================================================
# 4. CARREGAMENTO DE MÓDULOS (PLUGINS) E INJEÇÃO DE AMBIENTE
#=============================================================================

# Os módulos padrão residem em $ZSH/plugins/
# Os módulos customizados devem ser alocados em $ZSH_CUSTOM/plugins/
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

#Injeção em memória das matrizes e funções da biblioteca base do Oh My Zsh.
source $ZSH/oh-my-zsh.sh

#=============================================================================
# 5. VARIÁVEIS DE AMBIENTE GLOBAIS
#=============================================================================

# export MANPATH="/usr/local/man:$MANPATH"

# Pode ser necessária a parametrização manual da variável de ambiente de idioma (Locale).
# export LANG=en_US.UTF-8

# Editor de texto predefinido para manipulação de I/O em sessões locais e remotas.
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Diretivas de compilação da arquitetura (Compiler flags).
# export ARCHFLAGS="-arch $(uname -m)"

#=============================================================================
# 6. RENDERIZAÇÃO DE PROMPT E MAPEAMENTO DE PATH
#=============================================================================

# Avalia e carrega os parâmetros declarativos do motor Powerlevel10k, se o artefato existir em disco.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Injeta os binários do escopo de usuário e a toolchain do Rust na variável PATH do sistema.
export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$PATH"


# Declaração de pseudónimos (aliases) pessoais, sobrepondo as definições fornecidas pelas bibliotecas,
# plugins e temas do Oh My Zsh. Os aliases podem ser injetados neste bloco, embora a arquitetura
# recomendada exija a alocação destes mapeamentos em ficheiros dedicados no
# diretório $ZSH_CUSTOM, com a extensão .zsh. Exemplos:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# Para despejar a tabela de hash completa de aliases ativos, execute `alias`.
#
# Exemplos de mapeamento:
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#=============================================================================
# 7. INICIALIZAÇÃO DE SUBSISTEMAS E BINÁRIOS (RUST TOOLCHAIN)
#=============================================================================

# Substituição do comando 'cd' legado pelo motor heurístico do zoxide
eval "$(zoxide init zsh)"

#A chamada de sistema 'cd' é substituída pelas funções 'z' (navegação) 
#e 'zi' (navegação interativa), instanciadas nativamente pelo motor zoxide.

#=============================================================================
# 8. ALIASES
#=============================================================================


#(ls -> eza)
alias ls='eza --color=always --group-directories-first --icons'
alias ll='eza -la --icons --group-directories-first --git'
alias la='eza -a --icons --group-directories-first'
alias tree='eza --tree --icons'

# (cat -> bat)
alias cat='bat --style=plain --paging=never' # Exibe o conteúdo do arquivo sem numeração de linhas e sem paginação, mantendo a formatação de cores.
alias catn='bat --style=numbers'             # Exibe o conteúdo do arquivo com numeração de linhas, mantendo a formatação de cores.

#Ferramentas de Pesquisa Estrutural
alias find='fd'   # Busca vetorial de ficheiros otimizada (fd-find)
alias grep='rg'   # Parsing de Expressões Regulares paralelizado (ripgrep)

#General
alias ps='procs'  # Monitorização de processos da CPU
alias top='btop'  # Visualizador de hardware em tempo real (Alternativa: btm)
alias du='dust'   # Analisador gráfico de consumo de disco
alias ff='fastfetch' 