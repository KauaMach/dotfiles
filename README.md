

# dotfiles

### Repositório com configurações de terminal. A gestão de *links* simbólicos é realizada através do **GNU Stow**.

## 🛠️ Tecnologias e Ferramentas
- **Terminal**: Alacritty , Kitty
- **Multiplexador**: Tmux (Persistência de sessão)

- **Shells**:
  - Zsh + Oh My Zsh (Ambiente principal)
  - Fish Shell (Ambiente interativo secundário)

- **Prompts**: Powerlevel10k (Zsh) & Starship (Fish)

- **CLI Tools (Rust)**: `eza`, `bat`, `fd`, `ripgrep`, `zoxide`, `btm`, `dust`

## 📂 Estrutura de Diretórios

A estrutura do repositório espelha a hierarquia do `$HOME` para garantir a compatibilidade com o GNU Stow:

```text
.
├── alacritty/   # Configuração do Alacritty (Temas e Fontes)
├── kitty/       # Configuração do Kitty (Temas: Oxocarbon, Eldritch, Decay)
├── fish/        # Configuração do Fish Shell e variáveis universais
├── starship/    # Configuração do Starship Prompt (TOML)
├── tmux/        # Configuração do Tmux e plugins (TPM)
└── zsh/         # Configuração do .zshrc e Powerlevel10k

```

## 🚀 Instalação e Restauração

Para replicar esta configuração num novo ambiente Fedora/Linux:

### 1. Pré-requisitos

Instale o motor de links simbólicos:

```bash
sudo dnf install stow

```

### 2. Clonagem e Implementação

Clone o repositório e utilize o `stow` para projetar as configurações:

```bash
git clone https://github.com/kauamach/dotfiles.git ~/dotfiles
cd ~/dotfiles

# Projeta cada pacote individualmente
stow alacritty
stow kitty
stow fish
stow starship
stow tmux
stow zsh

```
