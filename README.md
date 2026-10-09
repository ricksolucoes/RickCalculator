# RickCalculator

## Visão geral
O **RickCalculator** é um projeto de demonstração de engenharia de software e engenharia de agentes em Delphi.

Seu objetivo é comprovar que uma solicitação curta do usuário pode acionar uma equipe de agentes especializados capaz de produzir uma aplicação Windows funcional, testada, compilada, revisada e validada.

Exemplos:

```text
Crie a calculadora.
```

```text
Crie a calculadora de somar.
```

O projeto não é um framework genérico. Ele existe para construir e demonstrar a equipe que produz o **RickCalculator**.


## Objetivo do projeto

O objetivo deste projeto é criar um agent autonomo para poder criar uma equipe de agents para montar a infraestrutura necessárias para criar o **RickCalculator**.

Não é objetivo deste projeto:

- criar um framework genérico para qualquer aplicação Delphi;
- criar agentes genéricos para qualquer produto;
- ampliar o produto por conveniência técnica;
- introduzir funcionalidades não autorizadas;
- usar as Specs de construção como dependência operacional durante a execução final.

O resultado esperado é demonstrar que uma solicitação curta é suficiente para iniciar todo o processo de engenharia necessário para criar uma aplicação em Delphi.

## Fases

### 1. Construção da equipe

As **Build Specs** definem:

- produto conhecido;
- UI normativa;
- engenharia Delphi;
- processos;
- contratos dos Agents;
- comunicação;
- artefatos e estrutura runtime;
- critérios de prontidão.

As Build Specs são blueprints. Depois de concluídas, elas não são consultadas durante a execução normal da tarefa final.

### 2. Execução da tarefa

A equipe implementada e auditada:

```text
Usuário
  ↓
Product Manager
  ↓
Requirements Analyst
  ↓
Product Designer
  ↓
System Designer
  ↓
TDD Planner
  ↓
Test Developer
  ↓
Production Developer
  ↓
Refactor Specialist
  ↓
Code Reviewer
  ↓
QA Functional
  ↓
UI QA
  ↓
Build & Release Validator
  ↓
Product Acceptance
  ↓
Usuário
```

O `Flow Coordinator` somente roteia estados, gates, blockers e handoffs. Ele não toma decisões técnicas ou de produto.

## Build Specs x Task Specs

```text
BUILD SPECS
→ constroem o sistema de Agents

TASK SPECS
→ são criadas pelos Agents durante uma solicitação real, quando necessárias
```

As Build Specs não são dependência runtime.

Task Specs podem existir para artefatos como:

- `PRODUCT_BRIEF`
- `REQUIREMENTS`
- `ACCEPTANCE_CRITERIA`
- `UI_SPEC`
- `SYSTEM_DESIGN`
- `TDD_PLAN`

## Interface de referência

```text
┌───────────────────────────────┐
│          CALCULADORA          │
├───────────────────────────────┤
│                               │
│                     125,00    │
│                               │
├───────┬───────┬───────┬───────┤
│   7   │   8   │   9   │   /   │
├───────┼───────┼───────┼───────┤
│   4   │   5   │   6   │   ×   │
├───────┼───────┼───────┼───────┤
│   1   │   2   │   3   │   -   │
├───────┼───────┼───────┼───────┤
│   0   │   ,   │   =   │   +   │
└───────┴───────┴───────┴───────┘
```

Essa referência será aplicada pelos Agents de produto e UI segundo as Specs aprovadas.

## Princípios dos Agents

- não assumir;
- não inventar requisito;
- não ampliar escopo;
- encaminhar problema ao especialista correto;
- escalar ao humano quando faltar decisão comprovável;
- TDD real;
- build real;
- testes reais;
- zero erro e zero warning;
- Release validada;
- View sem regra matemática.


## Faixas Numéricas das Build Specs

As faixas numéricas das Build Specs são **intencionais** e funcionam como namespaces por categoria.

| Faixa | Categoria | Finalidade |
|---|---|---|
| `000–005` | Governança | Regras de criação, aprovação, blockers, handoff, no-assumption e Task Specs |
| `010–020` | Produto | Define o RickCalculator, linguagem do cliente e regras funcionais |
| `030–034` | Interface | Define referência visual, estrutura, controles e comportamento da View |
| `040–046` | Engenharia Delphi | Estrutura, naming, interfaces, qualidade, toxicity, build e arquitetura |
| `050–060` | Processo da equipe | Define como PM, Requirements, Design, TDD, QA, Release e Acceptance trabalham |
| `100–113` | Contratos dos Agents | Define individualmente cada mini-agent antes de sua criação física |
| `120–127` | Composição do sistema | Define `AGENTS.md`, Policies, Config, Scripts, estrutura runtime, status, prompt entry e readiness |

### Regra das lacunas numéricas

As lacunas são deliberadas.

```text
SPEC-060
↓
SPEC-100
```

não significa que `SPEC-061` até `SPEC-099` estejam faltando.

A mudança de faixa indica mudança de categoria.

A faixa:

```text
100–113
```

é reservada exclusivamente para os **contratos dos Agents**.

Essas Specs **não são os Agents**.

Elas existem para definir e auditar cada Agent antes de sua criação física.

Exemplo:

```text
SPEC-104_SYSTEM_DESIGNER_AGENT
        ↓
define contrato, autoridade, entradas,
saídas, blockers e proibições
        ↓
depois da Spec concluída
        ↓
agents/SYSTEM_DESIGNER.md
```

Resumo conceitual:

```text
000–005   COMO CONTROLAR O PROJETO
010–020   O QUE É O PRODUTO
030–034   COMO É A TELA
040–046   COMO O DELPHI DEVE SER FEITO
050–060   COMO A EMPRESA TRABALHA
100–113   QUEM SÃO OS ESPECIALISTAS
120–127   COMO A EQUIPE É MONTADA E EXECUTADA
```

## Estado atual

```text
BUILD SPECS CATALOG: COMPLETE
BATCH DOCUMENT AUDIT: PASS
NEXT PHASE: IMPLEMENTAR A EQUIPE E OS ARTEFATOS DEFINIDOS PELAS SPECS
```

O checklist completo está em:

```text
specs/SPEC_MASTER_CHECKLIST.md
```

A auditoria em lote está em:

```text
specs/SPEC_BATCH_AUDIT.md
```
