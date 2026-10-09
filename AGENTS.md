# AGENTS.md — RickCalculator Runtime Bootstrap

## 1. Objetivo

Este arquivo é a entrada operacional do sistema de Agents do RickCalculator.

O usuário deve poder iniciar o processo com uma solicitação curta, por exemplo:

```text
Crie a calculadora.
```

ou:

```text
Crie a calculadora de somar.
```

O sistema não deve exigir que o usuário chame manualmente cada Agent.

---

## 2. Regra fundamental

As Build Specs foram utilizadas para construir este sistema.

Durante runtime:

```text
NÃO CONSULTAR BUILD SPECS
```

Use somente:

- solicitação original do usuário;
- Task Specs produzidas durante a tarefa;
- Agents desta pasta;
- Policies runtime;
- Config runtime;
- Scripts técnicos autorizados;
- Status Registry;
- evidências reais.

---

## 3. Entrada do fluxo

Toda nova solicitação funcional entra por:

```text
FLOW_COORDINATOR
```

O Flow Coordinator deve imediatamente encaminhar a interpretação de produto para:

```text
PRODUCT_MANAGER
```

Nenhum outro Agent pode ser escolhido manualmente pelo usuário como requisito normal do fluxo.

---

## 4. Fluxo principal

```text
User
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

O ciclo:

```text
TEST_DEVELOPER
↓
PRODUCTION_DEVELOPER
↓
REFACTOR_SPECIALIST
```

pode se repetir conforme o `TDD_PLAN`.

---

## 5. Agents oficiais

Arquivos oficiais:

```text
agents/FLOW_COORDINATOR.md
agents/PRODUCT_MANAGER.md
agents/REQUIREMENTS_ANALYST.md
agents/PRODUCT_DESIGNER.md
agents/SYSTEM_DESIGNER.md
agents/TDD_PLANNER.md
agents/TEST_DEVELOPER.md
agents/PRODUCTION_DEVELOPER.md
agents/REFACTOR_SPECIALIST.md
agents/CODE_REVIEWER.md
agents/QA_FUNCTIONAL.md
agents/UI_QA.md
agents/BUILD_RELEASE_VALIDATOR.md
agents/PRODUCT_ACCEPTANCE.md
```

Os Agents legados numerados `01_*` até `08_*` foram removidos deste pacote limpo.

Somente os 14 Agents oficiais listados acima pertencem ao runtime.

---

## 6. Handoff, blocker e resolução

Os templates obrigatórios estão definidos nos próprios Agents e no runtime.

Nenhum Agent deve:

- assumir responsabilidade de outro;
- corrigir problema fora da própria autoridade;
- avançar com blocker aberto;
- inventar uma decisão para evitar escalonamento.

---

## 7. Task Specs runtime

Task Specs padrão:

```text
PRODUCT_BRIEF
REQUIREMENTS
ACCEPTANCE_CRITERIA
UI_SPEC
SYSTEM_DESIGN
TDD_PLAN
```

Elas são gravadas na estrutura runtime da tarefa.

Cada Task Spec pertence ao Agent responsável por sua criação.

---

## 8. Status Registry

O estado runtime é persistido em:

```text
runtime/status/status.json
```

O Flow Coordinator é o principal consumidor desse estado.

Agents especializados só alteram os campos cuja responsabilidade lhes pertence.

---

## 9. Policies

Policies compartilhadas ficam em:

```text
policies/
```

Elas definem regras técnicas transversais.

Agents não devem duplicar regras extensas de Policy sem necessidade.

---

## 10. Config

Configuração de ambiente:

```text
config/delphi.env.cmd
runtime/config/runtime.json
```

Agents não devem hardcodar paths específicos da máquina quando a Config já fornecer esse valor.

---

## 11. Scripts

Scripts são mecanismos técnicos.

Scripts não podem:

- decidir requisito;
- escolher UI;
- definir arquitetura;
- alterar expected result;
- escolher o próximo Agent;
- aprovar QA;
- decidir release.

---

## 12. Prompt Entry

Novo prompt:

```text
user request
↓
scripts/runtime-init.ps1
↓
runtime/status/status.json
↓
FLOW_COORDINATOR
↓
PRODUCT_MANAGER
```

Retomada:

```text
existing status
↓
FLOW_COORDINATOR
↓
resume from current_stage
```

---

## 13. Critério de prontidão

O prompt real do RickCalculator só pode ser considerado liberado quando o marcador runtime de prontidão indicar:

```text
TEAM READY: YES
```

Enquanto isso:

```text
TEAM READY: NO
PROMPT REAL: NOT YET AUTHORIZED
```
