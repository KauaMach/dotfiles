# 🐚 Z Shell (Zsh) + ⚡ Powerlevel10k

## Arquitetura do Subsistema
 Interpretador de comandos **Z Shell (Zsh)**, orquestrado pelo *framework* **Oh My Zsh** e parametrizado pelo motor de renderização vetorial **Powerlevel10k**. Adicionalmente, consolida a substituição de utilitários POSIX/GNU legados por binários de alta performance compilados nativamente em Rust.

## 0. Documentação Oficial
* **[Oh My Zsh](https://ohmyz.sh/)**
* **[Powerlevel10k - Repositório Base](https://github.com/romkatv/powerlevel10k)**
* **[Ecossistema CLI em Rust (Referência Arquitetural)](https://zaiste.net/posts/shell-commands-rust/)**

---

## 1. Instalar Zsh

Provisionamento dos binários no ecossistema Fedora e definição do Zsh como o interpretador primário para novas alocações de PTY.

```bash
sudo dnf upgrade --refresh
sudo dnf install zsh git wget curl util-linux-user
```

---

## 2. Integração do Framework Oh My Zsh

O Oh My Zsh atua como a infraestrutura de orquestração do ambiente, abstraindo a complexidade da gestão de caminhos (*paths*), variáveis globais e carregamento assíncrono de dependências.

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## 3. Instalação do Motor Powerlevel10k

O Powerlevel10k é um motor de renderização de *prompt* altamente otimizado que minimiza a latência de I/O através da compilação interna (em C++) dos seus ciclos de execução e paralelização de requisições ao Git.

```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Injeção automatizada da variável de tema no manifesto de configuração via editor de fluxo (sed)
sed -i 's/^ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc

```

### 3.1. Compilação e Assistente de Configuração Interativa

```bash
source ~/.zshrc
p10k configure

```

> 📌 **Matriz de Respostas Calibradas (Referência Rápida):**
> Para replicar a topologia visual padronizada da infraestrutura, forneça a seguinte cadeia de *inputs* ao assistente:
> `1 > 1 > 1 > 2 > 2 > 2 > 1 > 3 > 1 > 2 > 2`

---

## 4. plugins

Expansão da capacidade analítica do interpretador através da clonagem de submódulos de terceiros para a árvore customizada do *framework*.

```bash
# 1. zsh-autosuggestions: Predição baseada em heurística de histórico (~/.zsh_history)
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# 2. zsh-syntax-highlighting: Análise léxica estática e colorização (Validação de binários)
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

```

Após o provisionamento em disco, é mandatório instanciar os referidos módulos na matriz `plugins` dentro do arquivo manifesto `~/.zshrc`:

```zsh
# Fragmento do arquivo ~/.zshrc
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)
```

---

## 5. Instalação da Toolchain e Utilitários Rust


### 5.1. Provisionamento do Compilador Primário (rustup)

O *script* de inicialização abaixo instancia o orquestrador `rustup` e o gestor de pacotes e dependências `cargo`.

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

echo 'export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$PATH"' >> ~/.zshrc

source "$HOME/.cargo/env"
```

### 5.2. Instalação das Ferramentas

- **Via DNF**
```bash
sudo dnf install bat eza fd-find fzf htop ripgrep tokei starship tealdeer zoxide git-delta
```

- **Via Cargo**
```bash
cargo install procs sd du-dust hyperfine bandwhich grex rmesg
```