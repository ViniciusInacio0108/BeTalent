# betalent

## Sobre o projeto

Essa aplicação é referente ao processo seletivo da BeTalent. Basicamente é uma tela com uma lista de empregados e que pode ter a possibilidade de pesquisa por algumas características.

#### OBS: O arquivo .env contendo as variáveis foram enviadas para o git apenas para poder rodar a aplicação no teste. Em um caso real, isso jamais seria disponibilizado no Git.

Esse projeto foi implementado utilizando Flutter apenas para Android e iOS.

A arquitetura utilizada foi a Clean Architecture e junto ao design pattern MVVM com algumas recomendações de arquitetura feitas pelo próprio time Flutter em sua documentação. Também utilizei Provider para gerenciamento do estado das páginas (ViewModels) além do próprio "setState" do StatefuleWidget em componentes específicos.

Utilizei também o DDD para desenvolvimento da aplicação, ou seja, criando todo o projeto a partir do domain, das regras internas e de seus modelos. Com isso, os dados vindo do mundo exterior (json-server no caso) são adaptados independente da fonte ou formatação para o que o app internamente espera.

## Estrutura do projeto

A estrutura de pastas principais está a seguinte:

- raíz
    - assets (assets)
    - lib (código flutter)
        - core (arquivos auxiliares)
        - features (funcionalidades)
            - featureA (pasta da funcionalidade)
                - data (tudo que envolva o mundo externo ao app)
                - domain (regras e models internos da funcionalidade)
                - ui (ui da funcionalidade e controle de estado)

## Pré requisitos

Alguns requisitos necessários para rodar e também para melhorar a experiência de uso da aplicação.

### Obrigatórios:

    1. Dart
    2. Flutter
    3. Android Studio
    4. XCode for iOS
    5. Git
    6. Arquivo .env (contendo as enviroments variables)
    7. Emulador ou aparelho físico
    8. Node

### Recomendados:

    1. Makefile
    2. FVM
    3. VSCode

## Instruções de uso

### 1. Baixar os requisitos obrigatórios

### 2. Clonar o repositório do projeto em: https://github.com/ViniciusInacio0108/BeTalent.git

### 3. Preparar projeto
    3.1 Rode no terminal: "flutter pub get"

    3.2 Confira se o arquivo .env está na raíz do projeto

    3.3 Caso esteja utilizando o json-server para mockar, rode no terminal: "json-server --watch database_mock/database.json"

    3.4 Rode a aplicação utilizando os seguintes:
        3.4.1 Makefile: "make run_app"
        3.4.2 Terminal: "flutter run --dart-define-from-file=.env"

## Melhorias possíveis

### 1. Criar testes unitários e de widgets (por falta de tempo não consegui entregar)

### 2. Melhorar pesquisa com um debouncer (timer) para poder melhorar performance em grandes listas de empregados e não levar em consideração qualquer tipo de interação do usuário com o searchBar.

### 3. Criar exceptions customizados e um error handling mais preciso para casos de exceções em APIs ou outros.