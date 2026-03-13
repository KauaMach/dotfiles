# =============================================================================
# 1. PARÂMETROS GERAIS E AMBIENTE (FISH SHELL)
# =============================================================================

# Suprime a mensagem de saudação (Welcome message) padronizada do interpretador
set -g fish_greeting ""

# Injeção de binários do escopo de utilizador e Rust toolchain no vetor $PATH.
# A função 'fish_add_path' é idempotente: garante a alocação sem duplicação na memória.
fish_add_path ~/.local/bin ~/.cargo/bin

# =============================================================================
# 2. INICIALIZAÇÃO DE SUBSISTEMAS E DAEMONS (RUST TOOLCHAIN)
# =============================================================================

# Inicializa o motor heurístico de navegação de diretórios (Zoxide substitui 'cd')
zoxide init fish | source

# Inicializa o motor de renderização visual cross-shell (Starship Prompt)
starship init fish | source

# =============================================================================
# 3. MAPEAMENTO LÉXICO (ALIASES) PARA BINÁRIOS DE ALTA PERFORMANCE
# =============================================================================

# Motores de Listagem (ls -> eza)
alias ls="eza --color=always --group-directories-first --icons"
alias ll="eza -la --icons --group-directories-first --git"
alias la="eza -a --icons --group-directories-first"
alias tree="eza --tree --icons"

# Motores de Leitura de I/O (cat -> bat)
alias cat="bat --style=plain --paging=never"
alias catn="bat --style=numbers"

# Ferramentas de Pesquisa Estrutural
alias find="fd"
alias grep="rg"

# Telemetria e Monitorização Geral
alias ps="procs"
alias top="btop"
alias du="dust"

# Utilitários Adicionais
alias ff="fastfetch"

# =============================================================================
# 4. EXECUÇÃO DE INICIALIZAÇÃO VISUAL (FIM DO PIPELINE)
# =============================================================================

# Renderiza a telemetria do hardware e sistema após o carregamento integral da sessão
fastfetch