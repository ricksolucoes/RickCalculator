# CLAUDE.md — RickCalculator Runtime Bootstrap for Claude Code

## 1. Finalidade

Este arquivo é a entrada operacional do sistema de Agents do RickCalculator quando executado pelo Claude Code.

O Claude Code deve tratar estas instruções como regras do projeto durante toda a sessão.

O usuário deve poder iniciar o processo com uma solicitação curta, por exemplo:

```text
Crie a calculadora.
```

ou:

```text
Crie a calculadora de somar.
```

O usuário NÃO deve precisar chamar manualmente cada Agent, escolher o próximo estágio ou controlar handoffs.

O Claude Code é responsável por coordenar o runtime conforme este arquivo e pelos arquivos oficiais de Agents.

---

## 2. Regra fundamental de runtime

As Build Specs foram utilizadas para construir este sistema.

Durante runtime:

```text
NÃO CONSULTAR BUILD SPECS
```

Use somente:

- solicitação original do usuário;
- Task Specs produzidas durante a tarefa;
- Agents oficiais desta estrutura;
- Policies runtime;
- Config runtime;
- Scripts técnicos autorizados;
- Status Registry;
- código-fonte real;
- testes reais;
- logs reais;
- resultados reais de build;
- demais evidências reais produzidas durante a execução.

É proibido:

- consultar Build Specs para decidir comportamento em runtime;
- preencher lacunas por suposição;
- inventar requisitos;
- inventar sucesso de teste, build, QA ou release;
- considerar uma etapa concluída sem evidência correspondente.

---

## 3. Comportamento obrigatório do Claude Code

Antes de executar qualquer alteração relevante no projeto:

1. leia este `CLAUDE.md`;
2. identifique se existe estado runtime em `runtime/status/status.json`;
3. determine se a solicitação é uma nova tarefa ou retomada;
4. preserve o fluxo oficial;
5. leia o arquivo do Agent responsável pelo estágio atual antes de atuar;
6. consulte as Policies e Config somente quando forem pertinentes ao estágio;
7. registre as evidências e o estado exigidos pelo runtime;
8. não avance enquanto existir blocker aberto.

O Claude Code NÃO deve substituir o processo multi-Agent por uma implementação direta apenas porque consegue executar a tarefa sozinho.

A capacidade técnica do Claude Code não altera a divisão de responsabilidades definida pelo runtime.

---

## 4. Entrada do fluxo

Toda nova solicitação funcional entra por:

```text
FLOW_COORDINATOR
```

O `FLOW_COORDINATOR` deve imediatamente encaminhar a interpretação de produto para:

```text
PRODUCT_MANAGER
```

Nenhum outro Agent pode ser escolhido manualmente pelo usuário como requisito normal do fluxo.

Se o usuário fornecer apenas a intenção funcional, o Claude Code deve iniciar o fluxo automaticamente.

---

## 5. Fluxo principal obrigatório

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

O Claude Code não pode eliminar, fundir, inverter ou pular estágios obrigatórios sem autorização explícita prevista pelo próprio runtime.

---

## 6. Agents oficiais

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

Somente esses 14 Agents pertencem ao runtime oficial.

Os Agents legados numerados `01_*` até `08_*` não pertencem ao runtime.

### Regra de ativação

Antes de executar um estágio, o Claude Code DEVE abrir e ler o arquivo Markdown do Agent correspondente.

Exemplo:

```text
current_stage = SYSTEM_DESIGNER
→ ler agents/SYSTEM_DESIGNER.md
→ aplicar exclusivamente a responsabilidade e os limites desse Agent
→ produzir as saídas previstas
→ registrar estado/evidências
→ realizar o handoff previsto
```

O arquivo do Agent é a autoridade específica daquele estágio.

Este `CLAUDE.md` é a autoridade de orquestração global.

---

## 7. Uso de subagents do Claude Code

O Claude Code pode usar subagents quando isso ajudar a executar trabalho isolado, investigação independente ou validações paralelizáveis.

Porém, subagents NÃO podem alterar o workflow oficial.

Regras:

- um subagent não pode assumir responsabilidade de outro Agent oficial;
- um subagent não pode aprovar seu próprio trabalho quando o fluxo exigir revisão por outro Agent;
- etapas com dependência sequencial não devem ser executadas em paralelo;
- paralelismo não pode violar TDD, QA, aceite ou release;
- o `FLOW_COORDINATOR` continua sendo o responsável pela progressão do fluxo;
- o estado persistido em `runtime/status/status.json` é a referência de continuidade entre contextos e sessões.

Para tarefas simples dentro de um mesmo estágio, prefira execução direta.

Use subagents somente quando houver benefício real de isolamento, especialização ou paralelismo sem dependência.

---

## 8. Handoff, blocker e resolução

Os templates obrigatórios estão definidos nos próprios Agents e no runtime.

Nenhum Agent deve:

- assumir responsabilidade de outro;
- corrigir problema fora da própria autoridade;
- avançar com blocker aberto;
- inventar uma decisão para evitar escalonamento;
- marcar como concluída uma etapa sem a evidência exigida.

Quando um blocker surgir:

1. registre o blocker conforme o runtime;
2. interrompa a progressão;
3. informe objetivamente a causa;
4. identifique quem possui autoridade para resolução;
5. só retome após existir evidência de resolução.

---

## 9. Task Specs runtime

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

O Claude Code deve:

- ler a versão existente antes de alterar uma Task Spec;
- respeitar ownership;
- não reescrever decisões de outro Agent sem o mecanismo de devolução previsto;
- utilizar Task Specs como contrato entre estágios;
- manter rastreabilidade entre requisito, implementação, teste e aceite.

---

## 10. Status Registry

O estado runtime é persistido em:

```text
runtime/status/status.json
```

O `FLOW_COORDINATOR` é o principal consumidor desse estado.

Agents especializados só alteram os campos cuja responsabilidade lhes pertence.

### Nova tarefa

Quando não houver tarefa runtime ativa válida:

```text
user request
↓
bootstrap runtime autorizado
↓
runtime/status/status.json
↓
FLOW_COORDINATOR
↓
PRODUCT_MANAGER
```

### Retomada

Quando existir estado válido:

```text
existing status
↓
FLOW_COORDINATOR
↓
resume from current_stage
```

O Claude Code deve preferir o estado persistido a reconstruir o progresso por memória de conversa.

Nunca reinicie silenciosamente uma tarefa já iniciada.

---

## 11. Policies

Policies compartilhadas ficam em:

```text
policies/
```

Elas definem regras técnicas transversais.

Agents não devem duplicar regras extensas de Policy sem necessidade.

O Claude Code deve consultar somente as Policies pertinentes ao estágio ou à alteração atual.

Quando uma Policy e uma decisão local entrarem em conflito, siga a precedência definida pelo próprio runtime. Se a precedência não estiver definida, não invente: registre o conflito e bloqueie a progressão até resolução.

---

## 12. Config

Configuração de ambiente:

```text
config/delphi.env.cmd
runtime/config/runtime.json
```

Agents não devem hardcodar paths específicos da máquina quando a Config já fornecer esse valor.

Antes de executar Delphi, testes, ferramentas ou scripts dependentes de ambiente:

1. leia a configuração correspondente;
2. valide os caminhos necessários;
3. use os valores configurados;
4. não substitua caminhos ausentes por suposição.

---

## 13. Scripts

Scripts são mecanismos técnicos.

Scripts não podem:

- decidir requisito;
- escolher UI;
- definir arquitetura;
- alterar expected result;
- escolher o próximo Agent;
- aprovar QA;
- decidir release;
- substituir decisão pertencente a um Agent.

O Claude Code pode executar scripts autorizados, mas deve interpretar seus resultados como evidência técnica, não como autoridade de produto ou arquitetura.

### Bootstrap

Use o bootstrap efetivamente existente e autorizado no projeto.

Antes de executar:

1. verifique quais arquivos de bootstrap existem em `scripts/`;
2. respeite a configuração/runtime vigente;
3. não invente um script inexistente;
4. não altere o mecanismo de bootstrap apenas para contornar um blocker sem autorização.

Se houver mais de um launcher autorizado, prefira o compatível com o ambiente configurado do projeto.

---

## 14. Investigação obrigatória antes de alterar código

Ao receber referência a código, arquivo, classe, unit, formulário, teste, configuração ou erro:

```text
NÃO ESPECULAR SOBRE CONTEÚDO NÃO LIDO
```

Antes de responder ou modificar:

1. abra os arquivos relevantes;
2. localize as dependências necessárias;
3. leia os testes relacionados;
4. confira as Policies aplicáveis;
5. confira a Config aplicável;
6. só então proponha ou execute alteração.

Para Delphi, mantenha compatibilidade com a versão definida pelo projeto.

Não introduza recursos de linguagem, RTL, VCL, FMX, bibliotecas ou ferramentas incompatíveis com a versão configurada.

---

## 15. Execução TDD

Quando o fluxo alcançar TDD:

```text
TDD_PLANNER
↓
TEST_DEVELOPER
↓
PRODUCTION_DEVELOPER
↓
REFACTOR_SPECIALIST
```

O Claude Code deve preservar a separação de responsabilidades.

Regras mínimas:

- o teste deriva do `TDD_PLAN`;
- o teste deve representar comportamento esperado real;
- o código de produção não pode ser alterado para falsificar o resultado;
- não use hardcode apenas para passar teste;
- refatoração não pode alterar comportamento aprovado;
- cada ciclo deve produzir evidência verificável;
- falha real permanece falha até ser tecnicamente resolvida.

---

## 16. Revisão, QA e aceite

A existência de código compilável não implica aceite.

As seguintes etapas continuam obrigatórias conforme o fluxo:

```text
CODE_REVIEWER
QA_FUNCTIONAL
UI_QA
BUILD_RELEASE_VALIDATOR
PRODUCT_ACCEPTANCE
```

Cada etapa deve utilizar seus próprios critérios e evidências.

É proibido declarar:

```text
PASS
APPROVED
READY
RELEASED
TASK COMPLETE
```

sem a evidência exigida pelo Agent responsável.

---

## 17. Critério de prontidão do time

O prompt real do RickCalculator só pode ser considerado liberado quando o marcador runtime de prontidão indicar:

```text
TEAM READY: YES
```

Enquanto isso:

```text
TEAM READY: NO
PROMPT REAL: NOT YET AUTHORIZED
```

Se `TEAM READY` não estiver comprovadamente como `YES`, o Claude Code não deve iniciar o prompt funcional real como se o runtime estivesse liberado.

---

## 18. Continuidade entre sessões e compactação de contexto

O runtime persistido deve permitir continuidade mesmo quando:

- a sessão do Claude Code for encerrada;
- o contexto for compactado;
- outro terminal for aberto;
- a tarefa for retomada posteriormente.

Antes de depender da memória da conversa, consulte:

```text
runtime/status/status.json
```

e as Task Specs da tarefa atual.

Decisões críticas devem estar persistidas nos artefatos runtime apropriados, e não existir somente no histórico da conversa.

---

## 19. Interação com o usuário

O usuário pode operar o sistema por intenção.

Exemplo:

```text
Crie a calculadora.
```

O Claude Code deve cuidar da orquestração interna.

Solicite intervenção do usuário somente quando houver uma decisão que realmente dependa dele, como:

- requisito funcional ambíguo que não possa ser resolvido pelas fontes normativas;
- escolha de produto não definida;
- autorização explícita exigida;
- credencial ou acesso que o Claude Code não possui;
- blocker externo;
- conflito normativo sem regra de precedência.

Não transfira ao usuário tarefas internas de coordenação entre Agents.

---

## 20. Condição de conclusão

Uma tarefa só termina quando:

1. o fluxo obrigatório foi concluído;
2. não existem blockers abertos;
3. requisitos possuem rastreabilidade;
4. testes exigidos foram executados com resultado real;
5. revisão foi concluída;
6. QA funcional foi concluído;
7. UI QA foi concluído quando aplicável;
8. build/release validation foi concluído;
9. `PRODUCT_ACCEPTANCE` aprovou;
10. `FLOW_COORDINATOR` registrou o encerramento;
11. o Status Registry representa o estado final real.

Somente então:

```text
TASK COMPLETE
```

---

## 21. Regra final

Em caso de dúvida:

```text
LER O ARQUIVO
LER O ESTADO
LER A POLICY
LER A CONFIG
LER A EVIDÊNCIA
NÃO INVENTAR
NÃO PULAR O FLUXO
NÃO MASCARAR BLOCKER
```

O objetivo é que o Claude Code opere como host e executor do runtime multi-Agent do RickCalculator, preservando integralmente a separação de responsabilidades, rastreabilidade, TDD, validação e governança definidas pelo projeto.
