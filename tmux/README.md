# 🪟 Tmux (Terminal Multiplexer)

## Arquitetura do Subsistema
O **Tmux** atua como um multiplexador de pseudoterminais (PTYs), habilitando a persistência de sessões (desacoplando processos do ciclo de vida do emulador de terminal hospedeiro) e permitindo a segmentação espacial da interface de linha de comando através de matrizes de janelas (*windows*) e painéis (*panes*).

## 0. Documentação Oficial e Dependências
* **[Tmux - Wiki Oficial](https://github.com/tmux/tmux/wiki)**
* **[Tmux Plugin Manager (TPM) - Repositório Base](https://github.com/tmux-plugins/tpm)**
* **[Catppuccin para Tmux - Integração Visual](https://github.com/catppuccin/tmux)**

---

## 1. Instalação TMUX
```bash
sudo dnf5 install tmux
```
---

## 2. Operações de CLI (Gerenciamento de Daemons)

A interação com a API do Tmux fora de um ambiente multiplexado é realizada através de subcomandos passados ao binário raiz.

```bash
# Instanciar um novo servidor e alocar a primeira sessão
tmux 

# Forçar a recompilação da matriz de configuração na sessão vigente (Hot-reload)
tmux source ~/.tmux.conf  

# Despejar a árvore de processos de sessões ativas na memória
tmux list-sessions 

# Transmitir sinal SIGKILL ao servidor, ceifando todas as sessões e processos filhos
tmux kill-server 

# Transmitir sinal de encerramento para instâncias específicas via Identificador (ID)
tmux kill-session -t 0   # Encerra a sessão de ID 0
tmux kill-session -t 1   # Encerra a sessão de ID 1

```

---

## 3. Orquestração de Módulos (TPM)

A topologia atual delega a resolução de dependências de terceiros ao **Tmux Plugin Manager (TPM)**. O manifesto central reside em `~/.tmux.conf`, enquanto os submódulos clonados são injetados na árvore XDG em `~/.config/tmux/plugins/`.

> ⚠️ **Invocação de Sinais do TPM:** > A execução destas rotinas exige uma sessão ativa. Acione a tecla de estado/Prefixo (`Ctrl + a`), libere o barramento do teclado e pressione o comando subsequente.

| Comando (Pós-Prefixo) | Ação Operacional (Ciclo de Vida) |
| --- | --- |
| `I` *(Maiúsculo)* | **Provisionar:** Clona e injeta os repositórios declarados no `.tmux.conf`. |
| `U` *(Maiúsculo)* | **Sincronizar:** Executa rotina de *pull* (*upstream*) em todos os submódulos instalados. |
| `Alt + u` | **Expurgar:** Destrói os diretórios físicos de *plugins* omitidos do manifesto atual. |

---

## 4. Matriz de Mapeamento de I/O (Keybindings)

> 💡 **Nota Arquitetural Crítica:** > Em conformidade com a customização da infraestrutura, o registrador de estado (Prefixo) padrão (`Ctrl + b`) foi sobrescrito para **`Ctrl + a`**. Salvo indicação contrária (comandos externos), todos os mapeamentos abaixo assumem a injeção prévia deste prefixo.

### 🗄️ Gerenciamento de Sessões (Daemons)

| Mapeamento / CLI | Ação Operacional |
| --- | --- |
| `tmux new` | Instanciar nova sessão via interpretador padrão. |
| `tmux new-session -A -s <nome>` | Instanciar ou anexar-se (*attach*) a uma sessão parametrizada. |
| `tmux ls` | Inspecionar a tabela de sessões em execução. |
| `tmux attach` | Transferir o controle do PTY para a última sessão alocada. |
| `Ctrl + a`, `d` | **Desanexar (*Detach*):** Suspender a renderização local, mantendo o processo em *background*. |
| `Ctrl + a`, `$` | Renomear o *buffer* da sessão atual. |
| `Ctrl + a`, `(` | Transitar o foco da renderização para a sessão iterativa anterior. |
| `Ctrl + a`, `)` | Transitar o foco da renderização para a sessão iterativa seguinte. |

### 🗂️ Gerenciamento de Janelas (Windows)

| Mapeamento | Ação Operacional |
| --- | --- |
| `Ctrl + a`, `c` | Alocar novo *buffer* de janela (*Create*). |
| `Ctrl + a`, `,` | Renomear o rótulo da janela atual via prompt interativo. |
| `Ctrl + a`, `&` | **Destruir:** Ceifar a janela e todos os descritores de processos filhos. |
| `Ctrl + a`, `w` | Invocar visualizador de árvore estrutural (Sessões/Janelas). |
| `Ctrl + a`, `s` | Invocar visualizador filtrado exclusivamente para Sessões. |
| `Ctrl + a`, `p` / `n` | Alternar foco para janela Anterior (*Previous*) ou Sequente (*Next*). |
| `Ctrl + a`, `l` | Retornar o foco para o último *buffer* de janela acessado (*Last*). |
| `Ctrl + a`, `[0-9]` | Translação absoluta de foco via índice numérico. |

### 🔳 Topologia de Painéis (Panes)

**Segmentação e Foco:**
| Mapeamento | Ação Operacional |
| :--- | :--- |
| `Ctrl + a`, `"` | Bisectar a matriz horizontalmente (instancia painel no eixo Y inferior). |
| `Ctrl + a`, `%` | Bisectar a matriz verticalmente (instancia painel no eixo X direito). |
| `Ctrl + a`, `h/j/k/l` | Translação espacial de foco (Esquerda / Baixo / Cima / Direita). |
| `Ctrl + a`, `o` | Translação iterativa sequencial de foco. |
| `Ctrl + a`, `q` | Exibir *overlay* de telemetria geométrica (índices numéricos). |

**Manipulação Estrutural e Vetorial:**
| Mapeamento | Ação Operacional |
| :--- | :--- |
| `Ctrl + a`, `Space` | Ciclar estocasticamente entre algoritmos de *layout* predefinidos. |
| `Ctrl + a`, `x` | **Ceifar:** Destruir o painel em foco. |
| `Ctrl + a`, `z` | **Zoom:** Intercalar a maximização do painel (sobreposição total da janela). |
| `Ctrl + a`, `a` | **Sincronização de E/S:** Multiplexar o *input* de teclado para todos os painéis vizinhos. |
| `Ctrl + a`, `Ctrl + h/j/k/l` | Translação do vetor de borda ativa para calibração geométrica (*Resize*). |

### 📋 Manipulação de Memória (Copy Mode)

| Mapeamento | Ação Operacional |
| --- | --- |
| `Ctrl + a`, `[` | Congelar a renderização de fluxo e habilitar rotina de *buffer* retroativo (Vi Mode). |
| `h/j/k/l` | Translação do cursor sobre o mapeamento de I/O fossilizado. |
| `Space` | Estabelecer âncora inicial para cópia de *string* (Seleção). |
| `Enter` | Despejar a seleção na memória volátil interna do Tmux e restaurar o fluxo. |
| `Ctrl + a`, `]` | Injetar (*Paste*) o conteúdo armazenado no *prompt* ativo. |
| `q` | Abortar seleção estática e forçar retomada do fluxo padrão (SIGCONT). |