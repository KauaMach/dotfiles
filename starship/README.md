# 🚀 Starship

O **Starship** mantém-se completamente agnóstico em relação ao *shell* hospedeiro, centralizando todas as diretrizes de renderização visual de forma isolada num ficheiro de configuração **TOML** . 

Nesse modelo, o processamento do *prompt* visual é integralmente delegado ao próprio **Starship**, que atua como um motor de renderização independente, assíncrono e de latência ultrabaixa, compilado nativamente em **Rust**, garantindo desempenho elevado e portabilidade entre diferentes ambientes de *shell*.

## 0. Documentação Oficial
* **[Starship - Documentação](https://starship.rs)**
* **[Starship - Presets Oficiais](https://starship.rs/pt-BR/presets/)**

## 1. Instalação
```bash
curl -sS https://starship.rs/install.sh | sh
touch ~/.config/starship.toml
```