# PROMPT ENTRY CONTRACT

## Novo pedido

Exemplo:

```text
Crie a calculadora.
```

Passos:

```text
1. scripts/runtime-init.ps1 recebe o texto original
2. cria Task ID
3. cria estrutura runtime da tarefa
4. grava status.json
5. current_agent = FLOW_COORDINATOR
6. Flow Coordinator lê o pedido
7. Flow Coordinator encaminha para PRODUCT_MANAGER
```

## Retomada

Se `runtime/status/status.json` possuir:

```text
task_status = IN_PROGRESS
```

o bootstrap não deve criar automaticamente outra tarefa.

O Flow Coordinator deve retomar:

```text
current_stage
current_agent
open_blockers
last_handoff
```

## Restrições

- nenhum prompt interno do tipo "execute Agent 06" é necessário;
- nenhum Build Spec é lido em runtime;
- nenhum Agent legado 01–08 participa do fluxo normal;
- usuário não precisa informar paths Delphi se Config válida já existir;
- blocker real pode interromper o processo;
- `HUMAN DECISION REQUIRED` pode solicitar decisão de produto ao usuário.

## Estado

```text
PROMPT ENTRY: IMPLEMENTED
TEAM READY: depende exclusivamente do marcador runtime de prontidão
```
