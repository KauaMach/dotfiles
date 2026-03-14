# 🐟 Fish Shell + 🚀 Starship

O Fish (*Friendly Interactive Shell*) atua como uma arquitetura alternativa e independente ao Zsh. O interpretador fornece colorização léxica, predição de histórico e algoritmos de autocompletar de forma nativa (*out-of-the-box*), mitigando inteiramente a necessidade de alocação de *frameworks* de terceiros ou gerenciadores assíncronos de *plugins*.

O processamento do *prompt* visual é estritamente delegado ao **Starship**, um motor de renderização agnóstico, assíncrono e de latência ultrabaixa, compilado nativamente em Rust.

## 0. Documentação Oficial
* **[Fish Shell](https://fishshell.com/)**

## 1. Instalação
```bash
sudo dnf upgrade --refresh
sudo dnf install fish git wget curl util-linux-user
```

## 2. Instanciação do Diretório de Configuração:
```bash
mkdir -p ~/.config/fish
touch ~/.config/fish/config.fish

#Injeção da rotina de bootstrap do Starship no escopo do Fish
echo 'starship init fish | source' >> ~/.config/fish/config.fish
```

## 3. Instalação de Utilitários Rust

A transição de utilitários POSIX legados para alternativas contemporâneas implementadas na linguagem Rust assegura segurança intrínseca na alocação de memória (*memory safety*), paralelismo algorítmico e uma mitigação substancial na latência de operações de I/O em repositórios de grande escala.

### 3.1. Provisionamento do Compilador Primário (rustup)

O script abaixo instala o rustup e o gestor de pacotes cargo.

```bash
curl --proto '=https' --tlsv1.2 -sSf [https://sh.rustup.rs](https://sh.rustup.rs) | sh

echo 'fish_add_path ~/.local/bin ~/.cargo/bin' >> ~/.config/fish/config.fish

source "$HOME/.cargo/env"
```

### 3.2 Instalação das Ferramentas
- **Via DNF**
```bash
sudo dnf install bat eza fd-find fzf htop ripgrep tokei starship tealdeer zoxide git-delta
```
- **Via Cargo**
```bash
cargo install procs sd du-dust hyperfine bandwhich grex rmesg
```