# 🧮 RickCalculator

[English](README.md) | **Português (Brasil)**

![Delphi](https://img.shields.io/badge/Delphi-10.x%2B-red?style=flat-square)
![Validated](https://img.shields.io/badge/validated-Delphi%2010.3%20%7C%2010.4%20%7C%2012-red?style=flat-square)
![Claude Code](https://img.shields.io/badge/Claude%20Code-supported-blueviolet?style=flat-square)
![OpenAI Codex](https://img.shields.io/badge/OpenAI%20Codex-supported-111111?style=flat-square)
![TDD](https://img.shields.io/badge/TDD-required-success?style=flat-square)
![Architecture](https://img.shields.io/badge/architecture-multi--agent-blue?style=flat-square)

## 📑 Sumário

- [🧭 Visão geral](#-visão-geral)
- [🧠 O que o projeto demonstra](#-o-que-o-projeto-demonstra)
- [🤖 Plataformas suportadas](#-plataformas-suportadas)
- [🧩 Arquitetura multi-agent](#-arquitetura-multi-agent)
- [👥 Agentes oficiais](#-agentes-oficiais)
- [🗂️ Estrutura do projeto](#️-estrutura-do-projeto)
- [⚙️ Requisitos do ambiente](#️-requisitos-do-ambiente)
- [🛠️ Delphi](#️-delphi)
- [💻 Visual Studio Code](#-visual-studio-code)
- [🟣 Instalação do Claude Code](#-instalação-do-claude-code-no-visual-studio-code)
- [⚫ Instalação do OpenAI Codex](#-instalação-do-openai-codex-no-visual-studio-code)
- [▶️ Execução rápida](#️-execução-rápida)
- [💾 Runtime e persistência de estado](#-runtime-e-persistência-de-estado)
- [✅ Prontidão da equipe](#-prontidão-da-equipe)
- [🔄 Nova tarefa e retomada](#-nova-tarefa-e-retomada)
- [🧱 Build Specs x Task Specs](#-build-specs-x-task-specs)
- [🧪 TDD](#-tdd)
- [📌 Evidências](#-evidências)
- [🚧 Blockers](#-blockers)
- [📜 Scripts](#-scripts)
- [🔐 PowerShell e política de execução](#-powershell-e-política-de-execução)
- [📐 Princípios dos agentes](#-princípios-dos-agentes)
- [🖥️ Interface de referência](#️-interface-de-referência)
- [🧭 Faixas numéricas das Build Specs](#-faixas-numéricas-das-build-specs)
- [🔀 Por que duas integrações?](#-por-que-duas-integrações)
- [📚 Glossário](#-glossário)
- [📄 Licença](#-licença)



## 🧭 Visão geral

O **RickCalculator** demonstra, na prática, a aplicação conjunta de **Engenharia de Software, Engenharia de Prompt e Engenharia de Agentes Autônomos no desenvolvimento Delphi**.

A partir de uma solicitação curta, o projeto coordena agentes especializados em **Product Management, Requirements Analysis, Product Design, System Design, TDD, Development, Refactoring, Code Review, QA, Release Validation e Product Acceptance**. O objetivo é conduzir todo o ciclo de engenharia até a entrega de uma aplicação Delphi funcional, testada, compilada, revisada e validada.

O foco não é apenas gerar código com IA. O repositório implementa um processo de desenvolvimento orientado por agentes, com responsabilidades bem definidas, limites de autoridade, contratos entre etapas, rastreabilidade, TDD, validações independentes e evidências verificáveis.

Entre os mecanismos adotados estão:

- especialização de responsabilidades;
- contratos explícitos entre agentes;
- limites de autoridade;
- TDD;
- handoffs;
- blockers;
- rastreabilidade;
- persistência de estado;
- revisão independente;
- QA funcional e de interface;
- build automatizado;
- validação de release;
- aceite final do produto.

A mesma arquitetura pode ser executada por:

- **Claude Code**, da Anthropic;
- **OpenAI Codex**, no ecossistema OpenAI / ChatGPT.

Uma solicitação curta, como:

```text
Crie uma calculadora.
```

ou:

```text
Crie a calculadora de somar.
```

é suficiente para iniciar o fluxo.

Também pode ser usada qualquer instrução equivalente que deixe claro que o objetivo é criar uma calculadora.

O usuário não precisa selecionar, chamar ou coordenar os agentes manualmente.



## 🧠 O que o projeto demonstra

O RickCalculator reúne três disciplinas complementares.

### Engenharia de Software

O projeto aplica práticas de engenharia ao ciclo completo de desenvolvimento:

- análise de requisitos;
- separação de responsabilidades;
- arquitetura;
- contratos;
- TDD;
- refatoração;
- revisão de código;
- QA;
- automação de build;
- validação de release;
- rastreabilidade entre requisito, implementação e evidência.

### Engenharia de Prompt

Os prompts fazem parte da arquitetura operacional do projeto e não são tratados como instruções isoladas.

Eles definem:

- contexto;
- autoridade por função;
- entradas e saídas esperadas;
- critérios de aprovação;
- restrições e proibições;
- mecanismos de handoff;
- regras de blocker;
- persistência de estado;
- separação entre instruções de construção e instruções de runtime.

### Engenharia de Agentes Autônomos

O projeto implementa uma equipe multi-agent na qual cada agente possui responsabilidade, autoridade e limites próprios.

A coordenação ocorre pelo runtime. O usuário fornece a intenção funcional e o fluxo é encaminhado para o especialista adequado em cada etapa.

O estado persistido permite retomar a execução depois de interrupções ou em uma nova sessão, sem depender exclusivamente do histórico de conversa do modelo.

### Resultado esperado

```text
UM ÚNICO PROMPT
        ↓
ORQUESTRAÇÃO MULTI-AGENT
        ↓
ENGENHARIA DE PRODUTO E SOFTWARE
        ↓
TDD + IMPLEMENTAÇÃO + REVISÃO + QA
        ↓
BUILD + RELEASE VALIDATION
        ↓
APLICAÇÃO DELPHI VALIDADA
```

O RickCalculator não pretende ser um framework genérico para qualquer aplicação Delphi. Ele implementa, de forma concreta e auditável, uma equipe especializada para produzir o próprio **RickCalculator**.



## 🤖 Plataformas suportadas

### Claude Code

O Claude Code utiliza:

```text
CLAUDE.md
```

como ponto de entrada específico da plataforma.

Esse arquivo orienta o Claude Code a:

- reconhecer o runtime;
- consultar o estado persistido;
- identificar o agente responsável pelo estágio atual;
- carregar o contrato correspondente em `agents/`;
- respeitar Policies e Config;
- preservar blockers e handoffs;
- não substituir o workflow multi-agent por uma implementação direta.

Documentação oficial:

- Visão geral — Português (Brasil): https://code.claude.com/docs/pt/overview
- Overview — English: https://code.claude.com/docs/en/overview
- Extensão oficial para VS Code: https://marketplace.visualstudio.com/items?itemName=anthropic.claude-code

### OpenAI Codex / ChatGPT

O OpenAI Codex utiliza:

```text
AGENTS.md
```

como ponto de entrada operacional do repositório.

O arquivo define:

- entrada do fluxo;
- agentes oficiais;
- ordem de execução;
- Task Specs;
- Status Registry;
- Policies;
- Config;
- scripts;
- regras de blocker;
- critérios de prontidão.

O Codex utiliza arquivos `AGENTS.md` como instruções do repositório.

Documentação oficial:

- Codex: https://developers.openai.com/codex/
- Extensão oficial para VS Code: https://marketplace.visualstudio.com/items?itemName=OpenAI.chatgpt

> Neste documento, **OpenAI Codex / ChatGPT** refere-se ao coding agent Codex da OpenAI utilizado no ecossistema OpenAI / ChatGPT.

### Arquivos de entrada por plataforma

| Plataforma | Arquivo de entrada | Responsabilidade |
|---|---|---|
| Claude Code | `CLAUDE.md` | Bootstrap e adaptação da execução para Claude Code |
| OpenAI Codex | `AGENTS.md` | Entrada operacional do runtime para Codex |
| Ambas | `agents/*.md` | Contratos dos agentes especializados |
| Ambas | `policies/*.md` | Regras técnicas compartilhadas |
| Ambas | `config/*` | Configuração do ambiente |
| Ambas | `runtime/status/*` | Estado e prontidão do runtime |
| Ambas | `runtime/tasks/<TASK-ID>/` | Task Specs, logs e evidências |

A plataforma muda; a arquitetura de engenharia permanece a mesma.



## 🧩 Arquitetura multi-agent

Toda nova solicitação funcional entra por:

```text
FLOW_COORDINATOR
```

O fluxo oficial é:

```text
Usuário
  ↓
FLOW_COORDINATOR
  ↓
PRODUCT_MANAGER
  ↓
REQUIREMENTS_ANALYST
  ↓
PRODUCT_DESIGNER
  ↓
SYSTEM_DESIGNER
  ↓
TDD_PLANNER
  ↓
TEST_DEVELOPER
  ↓
PRODUCTION_DEVELOPER
  ↓
REFACTOR_SPECIALIST
  ↓
CODE_REVIEWER
  ↓
QA_FUNCTIONAL
  ↓
UI_QA
  ↓
BUILD_RELEASE_VALIDATOR
  ↓
PRODUCT_ACCEPTANCE
  ↓
FLOW_COORDINATOR
  ↓
TASK COMPLETE
```

O ciclo abaixo pode se repetir conforme o `TDD_PLAN`:

```text
TEST_DEVELOPER
  ↓
PRODUCTION_DEVELOPER
  ↓
REFACTOR_SPECIALIST
```

O `FLOW_COORDINATOR` não toma decisões técnicas nem de produto. Sua função é coordenar estados, gates, blockers, handoffs, retomadas e conclusão de tarefas.



## 👥 Agentes oficiais

O runtime possui **14 agentes especializados**.

| Agent | Responsabilidade principal |
|---|---|
| `FLOW_COORDINATOR` | Coordena estados, gates, blockers e handoffs |
| `PRODUCT_MANAGER` | Interpreta a solicitação como necessidade de produto |
| `REQUIREMENTS_ANALYST` | Formaliza requisitos e critérios verificáveis |
| `PRODUCT_DESIGNER` | Define experiência e especificação visual |
| `SYSTEM_DESIGNER` | Define arquitetura e desenho técnico |
| `TDD_PLANNER` | Planeja os ciclos de TDD |
| `TEST_DEVELOPER` | Implementa e executa testes |
| `PRODUCTION_DEVELOPER` | Implementa o código de produção |
| `REFACTOR_SPECIALIST` | Refatora preservando o comportamento validado |
| `CODE_REVIEWER` | Executa revisão técnica independente |
| `QA_FUNCTIONAL` | Valida o comportamento funcional |
| `UI_QA` | Valida comportamento e apresentação da interface |
| `BUILD_RELEASE_VALIDATOR` | Valida build e preparação de release |
| `PRODUCT_ACCEPTANCE` | Executa o aceite final do produto |

Os contratos ficam em:

```text
agents/
```

Cada arquivo define papel, autoridade, entradas, saídas, blockers e ações proibidas para o agente correspondente.



## 🗂️ Estrutura do projeto

```text
RickCalculator/
│
├── AGENTS.md
├── CLAUDE.md
├── README.md
├── readme_PTBr.md
├── LICENSE
│
├── agents/
│   ├── FLOW_COORDINATOR.md
│   ├── PRODUCT_MANAGER.md
│   ├── REQUIREMENTS_ANALYST.md
│   ├── PRODUCT_DESIGNER.md
│   ├── SYSTEM_DESIGNER.md
│   ├── TDD_PLANNER.md
│   ├── TEST_DEVELOPER.md
│   ├── PRODUCTION_DEVELOPER.md
│   ├── REFACTOR_SPECIALIST.md
│   ├── CODE_REVIEWER.md
│   ├── QA_FUNCTIONAL.md
│   ├── UI_QA.md
│   ├── BUILD_RELEASE_VALIDATOR.md
│   └── PRODUCT_ACCEPTANCE.md
│
├── policies/
│   ├── DELPHI_CODING_STANDARD.md
│   ├── DELPHI_INTERFACE_PATTERN.md
│   ├── DELPHI_PROJECT_STRUCTURE.md
│   └── POLICY_MAPPING.md
│
├── config/
│   ├── delphi.env.cmd
│   └── RUNTIME_CONFIG_CONTRACT.md
│
├── scripts/
│   ├── env.cmd
│   ├── delphi-shell.cmd
│   ├── build-project.cmd
│   ├── runtime-init.ps1
│   ├── runtime-status.ps1
│   ├── runtime-set-stage.ps1
│   ├── runtime-blocker.ps1
│   ├── assert-zero-warnings.ps1
│   └── SCRIPT_CLASSIFICATION.md
│
├── runtime/
│   ├── PROMPT_ENTRY.md
│   ├── config/
│   │   └── runtime.json
│   ├── status/
│   │   ├── status.json
│   │   ├── team-readiness.json
│   │   └── README.md
│   └── tasks/
│       └── <TASK-ID>/
│           ├── specs/
│           ├── evidence/
│           └── logs/
│
└── specs/
    └── ...
```



## ⚙️ Requisitos do ambiente

### Sistema operacional

O runtime e o projeto Delphi foram preparados para Windows.

Recomendado:

```text
Windows 10
ou
Windows 11
```



## 🛠️ Delphi

O RickCalculator foi projetado para **Delphi 10.x ou superior**, em edições comerciais compatíveis com o workflow automatizado do projeto.

### Compatibilidade

O runtime foi validado com:

| Versão | BDS / Studio | Status |
|---|---:|---|
| Delphi 10.3 Rio | `20.0` | ✅ Validado |
| Delphi 10.4 Sydney | `21.0` | ✅ Validado |
| Delphi 12 Athens | `23.0` | ✅ Validado |

Outras versões **Delphi 10.x ou superiores** das edições Professional, Enterprise e Architect são compatíveis com a arquitetura do projeto, desde que forneçam o toolchain esperado pelo runtime.

> Nem todas as versões compatíveis foram validadas individualmente. Em um novo ambiente, execute a configuração, o build, os testes e as validações do runtime antes de considerar a instalação homologada.

### Edições suportadas

| Edição | Suporte no RickCalculator |
|---|---|
| Delphi Professional | ✅ Suportada |
| Delphi Enterprise | ✅ Suportada |
| Delphi Architect | ✅ Suportada |
| Delphi Community Edition | ❌ Não suportada |

A **Delphi Community Edition não faz parte da matriz de suporte deste projeto**. O runtime depende de automação de build e acesso ao toolchain Delphi por linha de comando. O RickCalculator foi projetado e validado para esse fluxo em edições comerciais compatíveis.

### Configuração padrão

O repositório está configurado por padrão para:

```text
Delphi 10.3 Rio
BDS 20.0
```

A configuração central fica em:

```text
config/delphi.env.cmd
```

Caminho padrão:

```text
C:\Program Files (x86)\Embarcadero\Studio\20.0
```

### Como usar outra instalação do Delphi

Há duas formas.

#### Opção 1 — Sobrescrever o caminho temporariamente

Defina `RickCalculator_DELPHI_HOME` antes de iniciar o runtime.

Delphi 10.4 Sydney:

```bat
set "RickCalculator_DELPHI_HOME=C:\Program Files (x86)\Embarcadero\Studio\21.0"
```

Delphi 12 Athens:

```bat
set "RickCalculator_DELPHI_HOME=C:\Program Files (x86)\Embarcadero\Studio\23.0"
```

Em seguida, carregue o ambiente:

```bat
scripts\env.cmd
```

O script deve localizar, entre outros:

```text
rsvars.bat
dcc32.exe
msbuild.exe
```

#### Opção 2 — Alterar a versão padrão do projeto

Para tornar outra versão o padrão do workspace, edite:

```text
config/delphi.env.cmd
```

Delphi 10.4 Sydney:

```bat
set "RickCalculator_DELPHI_VERSION=21.0"
set "RickCalculator_DELPHI_PRODUCT=Delphi 10.4 Sydney"
set "RickCalculator_DELPHI_HOME=C:\Program Files (x86)\Embarcadero\Studio\21.0"
```

Delphi 12 Athens:

```bat
set "RickCalculator_DELPHI_VERSION=23.0"
set "RickCalculator_DELPHI_PRODUCT=Delphi 12 Athens"
set "RickCalculator_DELPHI_HOME=C:\Program Files (x86)\Embarcadero\Studio\23.0"
```

Se a detecção automática continuar baseada no BDS, ajuste também a referência ao diretório `Studio\<versão>` usada na validação do ambiente.

Após qualquer mudança de versão, execute:

```bat
scripts\env.cmd
```

e confirme que o toolchain foi localizado corretamente antes de iniciar uma tarefa real.



## 💻 Visual Studio Code

Abra o projeto pela **pasta raiz `RickCalculator`**. Não abra apenas arquivos isolados.

No Visual Studio Code:

```text
File
→ Open Folder...
→ RickCalculator
```

Ou pelo terminal:

```bat
cd D:\Projetos\RickCalculator
code .
```

A raiz do workspace deve conter, entre outros:

```text
RickCalculator/
├── AGENTS.md
├── CLAUDE.md
├── agents/
├── policies/
├── config/
├── runtime/
└── scripts/
```

Claude Code e OpenAI Codex precisam acessar os arquivos de instrução e os artefatos do runtime a partir da raiz do repositório.



## 🟣 Instalação do Claude Code no Visual Studio Code

### 1. Abra Extensions

No Visual Studio Code:

```text
Ctrl + Shift + X
```

### 2. Instale a extensão oficial

Pesquise por:

```text
Claude Code
```

Instale:

```text
Claude Code for VS Code
```

Confirme o publisher:

```text
Anthropic
```

Identificador oficial no Visual Studio Marketplace:

```text
anthropic.claude-code
```

Marketplace:

https://marketplace.visualstudio.com/items?itemName=anthropic.claude-code

Evite extensões de terceiros com nomes semelhantes.

### 3. Abra o Claude Code

Após a instalação:

```text
Ctrl + Shift + P
```

Pesquise por:

```text
Claude Code
```

e selecione o comando para abrir o Claude Code em uma nova aba.

### 4. Autentique sua conta

No primeiro uso, conclua o fluxo de autenticação apresentado pelo Claude Code.

### 5. Abra a raiz do RickCalculator

```bat
cd D:\Projetos\RickCalculator
code .
```

Confirme que o workspace contém:

```text
RickCalculator/
├── CLAUDE.md
├── agents/
├── policies/
├── config/
├── runtime/
└── scripts/
```

O `CLAUDE.md` deve permanecer na raiz do repositório.

### 6. Inicie a tarefa

Abra uma nova sessão do Claude Code e envie apenas a solicitação funcional.

Exemplos:

```text
Crie uma calculadora.
```

ou:

```text
Crie a calculadora de somar.
```

Também pode ser usada outra instrução equivalente que deixe claro que o objetivo é criar uma calculadora.

Não é necessário chamar manualmente:

```text
FLOW_COORDINATOR
PRODUCT_MANAGER
SYSTEM_DESIGNER
TDD_PLANNER
...
```

O runtime identifica a intenção da solicitação e coordena o fluxo entre os agentes.

Fluxo esperado:

```text
Prompt do usuário
        ↓
CLAUDE.md
        ↓
FLOW_COORDINATOR
        ↓
PRODUCT_MANAGER
        ↓
...
        ↓
PRODUCT_ACCEPTANCE
        ↓
TASK COMPLETE
```

### Documentação oficial do Claude Code

Português (Brasil):

https://code.claude.com/docs/pt/overview

English:

https://code.claude.com/docs/en/overview

Extensão oficial para Visual Studio Code:

https://marketplace.visualstudio.com/items?itemName=anthropic.claude-code



## ⚫ Instalação do OpenAI Codex no Visual Studio Code

### 1. Abra Extensions

No Visual Studio Code:

```text
Ctrl + Shift + X
```

### 2. Instale a extensão oficial

Pesquise por:

```text
Codex
```

Instale:

```text
Codex – OpenAI's coding agent
```

Confirme o publisher:

```text
OpenAI
```

Marketplace:

https://marketplace.visualstudio.com/items?itemName=OpenAI.chatgpt

Evite extensões de terceiros com nomes semelhantes.

### 3. Autentique sua conta

Abra o painel do Codex e conclua o fluxo de autenticação oferecido pela extensão oficial.

### 4. Abra a raiz do RickCalculator

Confirme que o workspace contém:

```text
AGENTS.md
agents/
policies/
config/
runtime/
scripts/
```

O `AGENTS.md` já faz parte do projeto e não deve ser substituído por outro arquivo de instruções.

### 5. Inicie a tarefa

Envie uma solicitação funcional, por exemplo:

```text
Crie uma calculadora.
```

ou:

```text
Crie a calculadora de somar.
```

Também pode ser usada outra instrução equivalente que deixe claro que o objetivo é criar uma calculadora.

Fluxo esperado:

```text
Prompt do usuário
        ↓
AGENTS.md
        ↓
FLOW_COORDINATOR
        ↓
PRODUCT_MANAGER
        ↓
...
        ↓
PRODUCT_ACCEPTANCE
        ↓
TASK COMPLETE
```



## ▶️ Execução rápida

### Claude Code

```text
1. Instale o Visual Studio Code.
2. Instale a extensão oficial Claude Code, da Anthropic.
3. Abra a pasta raiz RickCalculator.
4. Autentique sua conta.
5. Abra uma sessão do Claude Code.
6. Envie uma solicitação curta, por exemplo:

   Crie uma calculadora.

   ou

   Crie a calculadora de somar.

   Também pode ser usada outra instrução equivalente que deixe claro
   que o objetivo é criar uma calculadora.

7. Acompanhe o runtime, os logs e as evidências geradas.
```

### OpenAI Codex

```text
1. Instale o Visual Studio Code.
2. Instale "Codex – OpenAI's coding agent", da OpenAI.
3. Abra a pasta raiz RickCalculator.
4. Autentique sua conta.
5. Abra uma sessão do Codex.
6. Envie uma solicitação curta, por exemplo:

   Crie uma calculadora.

   ou

   Crie a calculadora de somar.

   Também pode ser usada outra instrução equivalente que deixe claro
   que o objetivo é criar uma calculadora.

7. Acompanhe o runtime, os logs e as evidências geradas.
```



## 💾 Runtime e persistência de estado

O estado operacional é persistido em:

```text
runtime/status/status.json
```

O arquivo registra, entre outros:

```text
task_id
task_status
current_stage
current_agent
current_gate
open_blockers
approved_artifacts
last_handoff
```

Isso evita que a continuidade da execução dependa apenas do histórico de conversa do modelo.

Quando uma sessão é encerrada e posteriormente retomada, o runtime consulta o estado persistido para determinar de onde continuar.



## ✅ Prontidão da equipe

A prontidão do sistema é registrada em:

```text
runtime/status/team-readiness.json
```

O prompt funcional só deve ser executado quando o runtime indicar:

```text
TEAM READY: YES
```

Conceitualmente:

```text
TEAM READY: NO
→ prompt funcional ainda não autorizado

TEAM READY: YES
→ runtime autorizado a receber a solicitação funcional
```

O estado persistido é a fonte operacional de verdade. O README não substitui esse registro.



## 🔄 Nova tarefa e retomada

### Nova tarefa

Uma nova solicitação segue este fluxo:

```text
user request
↓
runtime bootstrap
↓
runtime/status/status.json
↓
FLOW_COORDINATOR
↓
PRODUCT_MANAGER
```

Os mecanismos de bootstrap ficam em:

```text
scripts/
```

### Retomada

Quando existe uma tarefa ativa, o runtime consulta:

```text
runtime/status/status.json
```

e continua a partir do estágio registrado.

Fluxo conceitual:

```text
existing status
↓
FLOW_COORDINATOR
↓
current_stage
↓
current_agent
```

Uma tarefa ativa não deve ser reiniciada silenciosamente.



## 🧱 Build Specs x Task Specs

O projeto separa dois tipos de especificação.

```text
BUILD SPECS
→ constroem o sistema de Agents

TASK SPECS
→ são produzidas pelos Agents durante uma tarefa real
```

### Build Specs

As Build Specs definem a construção da equipe e do runtime:

- escopo conhecido do produto;
- UI normativa;
- regras de engenharia Delphi;
- processos;
- contratos dos Agents;
- comunicação;
- artefatos;
- estrutura runtime;
- critérios de prontidão.

Depois que o sistema de Agents está construído, as Build Specs deixam de ser dependências operacionais da tarefa final.

Durante o runtime:

```text
NÃO CONSULTAR BUILD SPECS
```

### Task Specs

As Task Specs são produzidas durante a execução de uma tarefa real.

Os artefatos padrão incluem:

```text
PRODUCT_BRIEF
REQUIREMENTS
ACCEPTANCE_CRITERIA
UI_SPEC
SYSTEM_DESIGN
TDD_PLAN
```

Cada Task Spec pertence ao agente responsável por sua criação e funciona como contrato entre etapas do fluxo.



## 🧪 TDD

O fluxo de desenvolvimento aplica:

```text
TDD_PLANNER
↓
TEST_DEVELOPER
↓
PRODUCTION_DEVELOPER
↓
REFACTOR_SPECIALIST
```

Cada ciclo pode produzir evidências distintas para:

```text
RED
GREEN
REFACTOR
```

O objetivo é registrar a execução real do TDD, e não apenas uma declaração textual do modelo.



## 📌 Evidências

Cada tarefa pode manter:

```text
runtime/tasks/<TASK-ID>/
├── specs/
├── evidence/
└── logs/
```

As evidências podem incluir:

- resultados de build;
- execução de testes;
- ciclos RED / GREEN / REFACTOR;
- regressão;
- relatórios de Code Review;
- QA funcional;
- UI QA;
- capturas de validação visual;
- validação de release;
- blockers;
- handoffs.

Uma declaração do modelo não substitui a evidência exigida pelo processo.



## 🚧 Blockers

Nenhum agente pode:

- avançar com blocker aberto;
- assumir responsabilidade de outro agente;
- inventar uma decisão apenas para manter o fluxo em andamento;
- declarar sucesso sem evidência;
- saltar diretamente para release.

Fluxo conceitual:

```text
Agent
↓
detecta um problema
↓
registra um blocker
↓
runtime/status/status.json
↓
fluxo é interrompido
↓
responsável resolve o problema
↓
evidência é registrada
↓
fluxo retorna ao estágio correto
```



## 📜 Scripts

Os scripts são mecanismos técnicos.

Eles podem:

- preparar o ambiente;
- localizar o Delphi;
- executar build;
- consultar ou atualizar o estado;
- registrar blockers;
- validar warnings;
- inicializar o runtime.

Scripts não tomam decisões que pertencem aos agentes.

Eles não devem:

- decidir requisitos;
- escolher UI;
- definir arquitetura;
- alterar o resultado esperado;
- escolher o próximo agente com base em decisão de produto;
- aprovar QA;
- aprovar release.



## 🔐 PowerShell e política de execução

Parte do runtime utiliza scripts PowerShell.

Se a política do Windows impedir a execução de arquivos `.ps1`, a situação deve ser tratada como uma restrição real do ambiente.

O agente não deve:

- alterar silenciosamente a política de segurança;
- mascarar o problema;
- declarar que o bootstrap foi executado quando não foi;
- continuar com blocker aberto.

A solução deve respeitar as permissões e as políticas de segurança da máquina.



## 📐 Princípios dos agentes

Os agentes seguem princípios como:

- não assumir informações ausentes;
- não inventar requisitos;
- não ampliar o escopo por conveniência;
- respeitar ownership;
- encaminhar problemas ao especialista correto;
- escalar ao usuário quando faltar uma decisão comprovável;
- manter rastreabilidade;
- executar TDD real;
- executar build real;
- executar testes reais;
- exigir zero erro;
- exigir zero warning quando definido pela Policy;
- validar release;
- manter regra matemática fora da View;
- preservar compatibilidade com a versão Delphi configurada.



## 🖥️ Interface de referência

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

A referência é aplicada pelos agentes de produto e UI de acordo com as Specs aprovadas.



## 🧭 Faixas numéricas das Build Specs

As faixas numéricas são intencionais e funcionam como namespaces por categoria.

| Faixa | Categoria | Finalidade |
|---|---|---|
| `000–005` | Governança | Criação, aprovação, blockers, handoffs, no-assumption e Task Specs |
| `010–020` | Produto | Definição do produto, linguagem do usuário e regras funcionais |
| `030–034` | Interface | Referência visual, estrutura, controles e comportamento da View |
| `040–046` | Engenharia Delphi | Estrutura, naming, interfaces, qualidade, toxicity, build e arquitetura |
| `050–060` | Processo da equipe | PM, Requirements, Design, TDD, QA, Release e Acceptance |
| `100–113` | Contratos dos Agents | Define cada agente antes de sua implementação física |
| `120–127` | Composição do sistema | Define `AGENTS.md`, Policies, Config, Scripts, runtime, status, prompt entry e readiness |

### Lacunas numéricas

As lacunas são deliberadas.

```text
SPEC-060
↓
SPEC-100
```

não significa que:

```text
SPEC-061 ... SPEC-099
```

estejam ausentes.

A mudança de faixa indica mudança de categoria.

A faixa:

```text
100–113
```

é reservada aos contratos dos Agents.

Essas Specs não são os arquivos físicos dos agentes.

Exemplo:

```text
SPEC-104_SYSTEM_DESIGNER_AGENT
        ↓
define contrato, autoridade,
entradas, saídas, blockers
e ações proibidas
        ↓
agents/SYSTEM_DESIGNER.md
```

Resumo:

```text
000–005   COMO O PROJETO É GOVERNADO
010–020   O QUE É O PRODUTO
030–034   COMO É A INTERFACE
040–046   COMO O CÓDIGO DELPHI DEVE SER CONSTRUÍDO
050–060   COMO A EQUIPE TRABALHA
100–113   QUEM SÃO OS ESPECIALISTAS
120–127   COMO A EQUIPE É MONTADA E EXECUTADA
```



## 🔀 Por que duas integrações?

Claude Code e OpenAI Codex usam mecanismos diferentes para carregar instruções do repositório.

Por isso, o projeto contém:

```text
CLAUDE.md
```

e:

```text
AGENTS.md
```

Esses arquivos não representam duas arquiteturas distintas. Eles funcionam como pontos de entrada específicos de cada plataforma para o mesmo sistema de engenharia.

A camada compartilhada continua sendo:

```text
agents/
policies/
config/
runtime/
scripts/
```

O objetivo é preservar o mesmo processo de engenharia independentemente do coding agent utilizado.



## 📚 Glossário

| Termo | Definição |
|---|---|
| **Agent** | Unidade especializada do runtime com responsabilidade, autoridade, entradas, saídas e limites definidos. |
| **Multi-Agent** | Arquitetura em que diferentes agentes colaboram em etapas específicas de uma mesma tarefa. |
| **Flow Coordinator** | Agente responsável por coordenar estados, gates, blockers, handoffs e progressão do workflow. |
| **Handoff** | Transferência formal de responsabilidade ou contexto entre etapas do fluxo. |
| **Blocker** | Condição que impede o avanço do workflow até ser resolvida e registrada. |
| **Gate** | Critério obrigatório que precisa ser satisfeito antes de uma etapa avançar. |
| **Runtime** | Camada operacional responsável por executar a tarefa, manter o estado e coordenar o fluxo. |
| **Status Registry** | Registro persistente do estado da execução, armazenado em `runtime/status/status.json`. |
| **Build Specs** | Especificações usadas para construir, organizar e auditar o sistema de Agents. Não são dependências do runtime final. |
| **Task Specs** | Especificações produzidas pelos Agents durante uma tarefa real, como `REQUIREMENTS`, `SYSTEM_DESIGN` e `TDD_PLAN`. |
| **Prompt Engineering** | Disciplina aplicada ao desenho de contexto, restrições, responsabilidades, entradas, saídas e regras de interação dos agentes. |
| **Autonomous Agent Engineering** | Engenharia aplicada ao projeto de agentes capazes de executar trabalho especializado, colaborar, manter estado e respeitar limites de autoridade. |
| **TDD** | Test-Driven Development. Processo de desenvolvimento orientado pelos ciclos RED, GREEN e REFACTOR. |
| **RED** | Etapa do TDD em que um teste válido falha antes da implementação da funcionalidade. |
| **GREEN** | Etapa em que a implementação necessária faz o teste passar. |
| **REFACTOR** | Etapa em que o código é melhorado sem alterar o comportamento validado. |
| **Code Review** | Revisão técnica independente da implementação antes da validação final. |
| **QA** | Quality Assurance. Processo de validação da qualidade e do comportamento esperado do produto. |
| **UI QA** | Validação específica do comportamento e da apresentação da interface. |
| **Release Validation** | Verificação de build, testes, warnings, artefatos e condições necessárias para liberar uma versão. |
| **Product Acceptance** | Validação final do produto em relação aos requisitos e critérios de aceite aprovados. |
| **Policy** | Regra técnica compartilhada entre os Agents, como padrões Delphi, arquitetura e requisitos de qualidade. |
| **Evidence** | Artefato verificável produzido durante o processo, como resultado de teste, build, log ou validação. |
| **No-Assumption Rule** | Regra que impede agentes de preencher lacunas por suposição quando não existe evidência ou decisão autorizada. |
| **Zero Warning** | Critério de qualidade que exige build sem warnings quando definido pelas Policies do projeto. |
| **Method Toxicity Metrics** | Critérios usados para identificar métodos excessivamente complexos, extensos ou com responsabilidades em excesso. |
| **BDS** | Identificador interno da versão do RAD Studio / Delphi, como `20.0` para Delphi 10.3 Rio. |
| **dcc32** | Compilador Delphi Win32 utilizado em automações por linha de comando. |
| **MSBuild** | Ferramenta utilizada pelo RAD Studio para executar builds de projetos e project groups. |
| **rsvars.bat** | Script da Embarcadero que inicializa as variáveis de ambiente necessárias ao toolchain Delphi. |



## 📄 Licença

Este projeto é distribuído sob a **MIT License**.

O texto completo está disponível em:

```text
LICENSE
```

na raiz do repositório.
